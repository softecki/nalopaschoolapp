import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  String? scannedControlNumber;
  Map<String, dynamic>? scanResult;
  bool isLoading = false;
  String? errorMessage;
  bool showManualInput = false;
  bool _hasProcessedScan = false;

  MobileScannerController? controller;
  final TextEditingController manualInputController =
      TextEditingController();

  final String baseUrl =
      'https://nalopaschool.softecki.com/api';

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    manualInputController.dispose();
    super.dispose();
  }

  double _safeDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Future<Map<String, double>?> _currentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return null;

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 8),
        ),
      );
      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    } catch (_) {
      return null;
    }
  }

  Future<void> scanQrCode(String controlNumber) async {
    if (_hasProcessedScan) return;

    setState(() {
      _hasProcessedScan = true;
      isLoading = true;
      errorMessage = null;
      scanResult = null;
    });

    await controller?.stop();

    try {
      final location = await _currentLocation();
      final response = await http
          .post(
            Uri.parse('$baseUrl/parent/qr-code/scan'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'control_number': controlNumber,
              'scan_date': DateTime.now().toIso8601String(),
              if (location != null) 'latitude': location['latitude'],
              if (location != null) 'longitude': location['longitude'],
            }),
          )
          .timeout(const Duration(seconds: 20));

      final data = jsonDecode(response.body);

      if (!mounted) return;

      if (response.statusCode == 200 &&
          data['status'] == true &&
          data['data'] != null) {
        setState(() {
          scanResult =
              Map<String, dynamic>.from(data['data']);
          scannedControlNumber = controlNumber;
        });
      } else {
        setState(() {
          errorMessage =
              data['message'] ?? 'Scan failed';
        });
      }
    } on TimeoutException {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Request timed out';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
      });
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
      _hasProcessedScan = false;
    });
  }

  void _handleBarcode(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty &&
        !_hasProcessedScan &&
        !isLoading) {
      final barcode = capture.barcodes.first;
      if (barcode.rawValue != null) {
        scanQrCode(barcode.rawValue!);
      }
    }
  }

  void _toggleManualInput() {
    setState(() {
      showManualInput = !showManualInput;
      if (showManualInput) {
        controller?.stop();
      } else {
        controller?.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        actions: [
          IconButton(
            icon: Icon(showManualInput
                ? Icons.qr_code_scanner
                : Icons.edit),
            onPressed: _toggleManualInput,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [

            /// 🔵 TOP HALF (Scanner / Manual)
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                width: double.infinity,
                child: showManualInput
                    ? _buildManualInput()
                    : _buildScanner(),
              ),
            ),

            /// 🟢 BOTTOM HALF (Results)
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: _buildResultArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanner() {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: _handleBarcode,
        ),
        Center(
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildManualInput() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter Control Number",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: manualInputController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Control Number',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (manualInputController
                  .text.isNotEmpty) {
                scanQrCode(
                    manualInputController.text.trim());
              }
            },
            child:
                const Text("Check Payment Status"),
          ),
        ],
      ),
    );
  }

  Widget _buildResultArea() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (scanResult == null) {
      return const Center(
        child: Text(
          "Scan a QR code to see results",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    double totalAmount = _safeDouble(scanResult!['total_amount']);

    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding:
              const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              _row("Student",
                  scanResult!['student_name']),
              if ((scanResult!['class_name'] ?? '').toString().isNotEmpty)
                _row("Class", scanResult!['class_name']),
              _row("Attendance", scanResult!['attendance_status'] ?? 'Present'),
              if ((scanResult!['day_period'] ?? '').toString().isNotEmpty)
                _row("Period", scanResult!['day_period']),
              _row(
                "Location",
                (scanResult!['latitude'] != null && scanResult!['longitude'] != null)
                    ? '${scanResult!['latitude']}, ${scanResult!['longitude']}'
                    : 'Not available',
              ),
              // _row("Class",
              //     scanResult!['class_name']),
              _row(
                  "Total Amount",
                  "TZS ${NumberFormat('#,##0.00').format(
                      _safeDouble(
                          scanResult!['total_amount']))}"),
                           const SizedBox(height: 10),

    // Status Text
    Text(
      totalAmount > 0
          ? "UNCLEARED - NOT APPROVED"
          : "APPROVED - ALLOWED",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: totalAmount > 0
            ? Colors.red
            : Colors.green,
      ),
    ),
                          
              // _row(
              //     "Paid",
              //     "TZS ${NumberFormat('#,##0.00').format(
              //         _safeDouble(
              //             scanResult!['amount_paid']))}"),
              // _row(
              //     "Balance",
              //     "TZS ${NumberFormat('#,##0.00').format(
              //         _safeDouble(
              //             scanResult!['balance']))}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String title, dynamic value) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight:
                      FontWeight.w600)),
          Flexible(
            child: Text(
              value?.toString() ?? "-",
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontWeight:
                      FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
