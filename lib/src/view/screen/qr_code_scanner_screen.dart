import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
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

      if (!mounted) return;
      setState(() => isLoading = false);

      if (response.statusCode == 200 &&
          data['status'] == true &&
          data['data'] != null) {
        final result = Map<String, dynamic>.from(data['data']);
        scannedControlNumber = controlNumber;
        final cleared = _safeDouble(result['total_amount']) <= 0;
        await _showOutcome(
          cleared: cleared,
          name: result['student_name']?.toString() ?? '',
          className: result['class_name']?.toString() ?? '',
        );
      } else {
        await _showOutcome(
          cleared: false,
          message: data['message']?.toString() ?? 'Scan failed',
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      setState(() => isLoading = false);
      await _showOutcome(cleared: false, message: 'Request timed out');
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      await _showOutcome(cleared: false, message: e.toString());
    }

    _resumeScanning();
  }

  Future<void> _showOutcome({
    required bool cleared,
    String name = '',
    String className = '',
    String? message,
  }) async {
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                message != null
                    ? Icons.error_outline
                    : (cleared ? Icons.check_circle : Icons.close),
                color: message != null
                    ? Colors.red
                    : (cleared ? Colors.green : Colors.red),
                size: 88,
              ),
              const SizedBox(height: 12),
              Text(
                message ?? (cleared ? 'Cleared' : 'Uncleared - Not Approved'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: message != null
                      ? Colors.red
                      : (cleared ? Colors.green : Colors.red),
                ),
              ),
              if (name.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
              if (className.isNotEmpty)
                Text(className, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15)),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _resumeScanning() {
    if (!mounted) return;
    setState(() {
      isLoading = false;
      errorMessage = null;
      scanResult = null;
      _hasProcessedScan = false;
      showManualInput = false;
    });
    controller?.start();
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

    return const Center(
      child: Text(
        "Scan a QR code",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
