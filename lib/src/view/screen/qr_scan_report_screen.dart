import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/app_color.dart';
import '../../data/offline_scan_store.dart';

class QrScanReportScreen extends StatefulWidget {
  const QrScanReportScreen({Key? key}) : super(key: key);

  @override
  State<QrScanReportScreen> createState() => _QrScanReportScreenState();
}

class _StudentScanRow {
  final String name;
  final String day;
  bool morning = false;
  bool evening = false;

  _StudentScanRow({required this.name, required this.day});
}

class _QrScanReportScreenState extends State<QrScanReportScreen> {
  final String baseUrl = 'https://nalopaschool.softecki.com/api';
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  bool isLoading = false;
  bool isExporting = false;
  String? errorMessage;
  List<_StudentScanRow> rows = [];

  @override
  void initState() {
    super.initState();
    loadReport();
  }

  String _date(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  String _twoNames(Map<String, dynamic> scan) {
    final first = (scan['first_name'] ?? '').toString().trim();
    final last = (scan['last_name'] ?? '').toString().trim();
    if (first.isNotEmpty || last.isNotEmpty) {
      final firstWord = first.isEmpty ? '' : first.split(RegExp(r'\s+')).first;
      return [firstWord, last].where((part) => part.isNotEmpty).join(' ');
    }
    final parts = (scan['student_name'] ?? '').toString().trim().split(RegExp(r'\s+')).where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first;
    return '${parts.first} ${parts.last}';
  }

  List<_StudentScanRow> _groupScans(List<Map<String, dynamic>> scans) {
    final grouped = <String, _StudentScanRow>{};
    for (final scan in scans) {
      final parsed = DateTime.tryParse(scan['scan_date']?.toString() ?? '')?.toLocal();
      if (parsed == null) continue;
      final name = _twoNames(scan);
      final day = DateFormat('yyyy-MM-dd').format(parsed);
      final studentKey = scan['student_id']?.toString().isNotEmpty == true ? scan['student_id'].toString() : name;
      final row = grouped.putIfAbsent('$studentKey|$day', () => _StudentScanRow(name: name, day: day));
      if (parsed.hour < 12) {
        row.morning = true;
      } else {
        row.evening = true;
      }
    }

    final list = grouped.values.toList()
      ..sort((a, b) {
        final byDay = a.day.compareTo(b.day);
        if (byDay != 0) return byDay;
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    return list;
  }

  Future<void> loadReport() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final uri = Uri.parse('$baseUrl/parent/qr-code/scans').replace(
        queryParameters: {
          'from': _date(fromDate),
          'to': _date(toDate),
        },
      );
      final response = await http.get(uri, headers: {'Accept': 'application/json'});
      final body = jsonDecode(response.body);

      if (!mounted) return;

      if (response.statusCode == 200 && body['status'] == true) {
        final data = body['data'] as Map<String, dynamic>;
        final scans = List<Map<String, dynamic>>.from(
          (data['scans'] as List? ?? []).map((row) => Map<String, dynamic>.from(row)),
        );
        scans.addAll(await _localScans());
        setState(() => rows = _groupScans(scans));
      } else {
        final local = await _localScans();
        setState(() {
          rows = _groupScans(local);
          errorMessage = local.isEmpty
              ? (body['message']?.toString() ?? 'Could not load the report')
              : null;
        });
      }
    } catch (e) {
      if (!mounted) return;
      final local = await _localScans();
      setState(() {
        rows = _groupScans(local);
        errorMessage = local.isEmpty ? e.toString() : null;
      });
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<List<Map<String, dynamic>>> _localScans() async {
    final start = DateTime(fromDate.year, fromDate.month, fromDate.day);
    final end = DateTime(toDate.year, toDate.month, toDate.day, 23, 59, 59);
    final saved = await OfflineScanStore.scansOnDevice();
    return saved.where((row) {
      final parsed = DateTime.tryParse(row['scan_date']?.toString() ?? '')?.toLocal();
      if (parsed == null) return false;
      return !parsed.isBefore(start) && !parsed.isAfter(end);
    }).toList();
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? fromDate : toDate,
      firstDate: DateTime(2024),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        fromDate = picked;
        if (fromDate.isAfter(toDate)) toDate = fromDate;
      } else {
        toDate = picked;
        if (toDate.isBefore(fromDate)) fromDate = toDate;
      }
    });
    loadReport();
  }

  Future<void> _exportPdf() async {
    if (rows.isEmpty || isExporting) return;
    setState(() => isExporting = true);
    try {
      final doc = pw.Document();
      final title = 'Scan report ${DateFormat('dd MMM yyyy').format(fromDate)} - ${DateFormat('dd MMM yyyy').format(toDate)}';
      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (context) => [
            pw.Text('Nalopa School', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            pw.Text(title, style: const pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 12),
            pw.TableHelper.fromTextArray(
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
              cellStyle: const pw.TextStyle(fontSize: 10),
              headers: const ['Name', 'Morning', 'Evening'],
              data: rows
                  .map((row) => [
                        _date(fromDate) == _date(toDate) ? row.name : '${row.name}\n${row.day}',
                        row.morning ? 'Yes' : '',
                        row.evening ? 'Yes' : '',
                      ])
                  .toList(),
            ),
          ],
        ),
      );
      await Printing.layoutPdf(onLayout: (format) async => doc.save(), name: 'scan-report.pdf');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not export PDF: $e')));
    } finally {
      if (mounted) setState(() => isExporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final morningCount = rows.where((row) => row.morning).length;
    final eveningCount = rows.where((row) => row.evening).length;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Scan Attendance', style: TextStyle(color: Colors.white, fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            tooltip: 'Export PDF',
            onPressed: rows.isEmpty || isExporting ? null : _exportPdf,
            icon: isExporting
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.picture_as_pdf, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: _dateButton('From', fromDate, () => _pickDate(isFrom: true))),
                const SizedBox(width: 8),
                Expanded(child: _dateButton('To', toDate, () => _pickDate(isFrom: false))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(child: _summary('Morning students', '$morningCount')),
                const SizedBox(width: 8),
                Expanded(child: _summary('Evening students', '$eveningCount')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Students: ${rows.length}', style: const TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _dateButton(String label, DateTime date, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text('$label  ${DateFormat('dd MMM yyyy').format(date)}', style: const TextStyle(fontSize: 14, color: Colors.black87)),
    );
  }

  Widget _summary(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Text('$label: $value', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  Widget _body() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)));
    }
    if (rows.isEmpty) return const Center(child: Text('No scans for this period', style: TextStyle(fontSize: 16)));

    final showDate = _date(fromDate) != _date(toDate);
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: const Row(
            children: [
              Expanded(flex: 2, child: Text('Name', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
              Expanded(child: Text('Morning', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
              Expanded(child: Text('Evening', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: rows.length,
            itemBuilder: (context, index) {
              final row = rows[index];
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                margin: const EdgeInsets.only(top: 1),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(row.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          if (showDate) Text(row.day, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                    Expanded(child: _tick(row.morning)),
                    Expanded(child: _tick(row.evening)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _tick(bool scanned) {
    if (!scanned) return const SizedBox.shrink();
    return const Icon(Icons.check, color: Color(0xFF1B8A2F), size: 26);
  }
}
