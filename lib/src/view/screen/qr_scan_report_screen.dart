import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/app_color.dart';

class QrScanReportScreen extends StatefulWidget {
  const QrScanReportScreen({Key? key}) : super(key: key);

  @override
  State<QrScanReportScreen> createState() => _QrScanReportScreenState();
}

class _StudentScanRow {
  final String name;
  final String className;
  final String day;
  DateTime? firstScan;
  DateTime? lastEvening;

  _StudentScanRow({required this.name, required this.className, required this.day});
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

  String _clock(DateTime? value) {
    if (value == null) return '-';
    return DateFormat('dd MMM yyyy, HH:mm').format(value);
  }

  List<_StudentScanRow> _groupScans(List<Map<String, dynamic>> scans) {
    final grouped = <String, _StudentScanRow>{};
    for (final scan in scans) {
      final parsed = DateTime.tryParse(scan['scan_date']?.toString() ?? '')?.toLocal();
      if (parsed == null) continue;
      final name = scan['student_name']?.toString().trim() ?? '';
      final className = [scan['class_name'], scan['section_name']]
          .where((part) => part != null && '$part'.trim().isNotEmpty)
          .join(' - ');
      final day = DateFormat('yyyy-MM-dd').format(parsed);
      final key = '$name|$className|$day';
      final row = grouped.putIfAbsent(key, () => _StudentScanRow(name: name, className: className, day: day));
      if (row.firstScan == null || parsed.isBefore(row.firstScan!)) {
        row.firstScan = parsed;
      }
      final period = scan['day_period']?.toString() ?? '';
      final isEvening = period == 'Evening' || parsed.hour >= 12;
      if (isEvening && (row.lastEvening == null || parsed.isAfter(row.lastEvening!))) {
        row.lastEvening = parsed;
      }
    }

    final list = grouped.values.toList()
      ..sort((a, b) {
        final byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
        if (byName != 0) return byName;
        return (a.firstScan ?? DateTime(2000)).compareTo(b.firstScan ?? DateTime(2000));
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
        setState(() => rows = _groupScans(scans));
      } else {
        setState(() {
          errorMessage = body['message']?.toString() ?? 'Could not load the report';
          rows = [];
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
        rows = [];
      });
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
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
              headers: const ['Name', 'Class', 'First scan', 'Last evening'],
              data: rows
                  .map((row) => [
                        row.name,
                        row.className,
                        _clock(row.firstScan),
                        _clock(row.lastEvening),
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
    final morningCount = rows.where((row) => row.firstScan != null && row.firstScan!.hour < 12).length;
    final eveningCount = rows.where((row) => row.lastEvening != null).length;

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
                Expanded(child: _summary('Morning', '$morningCount')),
                const SizedBox(width: 8),
                Expanded(child: _summary('Evening', '$eveningCount')),
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

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: rows.length,
      itemBuilder: (context, index) {
        final row = rows[index];
        return Card(
          child: ListTile(
            title: Text(row.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(
              [
                if (row.className.isNotEmpty) row.className,
                'First scan: ${_clock(row.firstScan)}',
                'Last evening: ${_clock(row.lastEvening)}',
              ].join('\n'),
              style: const TextStyle(fontSize: 14),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
