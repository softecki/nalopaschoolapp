import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../core/app_color.dart';

class QrScanReportScreen extends StatefulWidget {
  const QrScanReportScreen({Key? key}) : super(key: key);

  @override
  State<QrScanReportScreen> createState() => _QrScanReportScreenState();
}

class _QrScanReportScreenState extends State<QrScanReportScreen> {
  final String baseUrl = 'https://nalopaschool.softecki.com/api';
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  bool isLoading = false;
  String? errorMessage;
  int totalScans = 0;
  int uniqueStudents = 0;
  int morningCount = 0;
  int eveningCount = 0;
  List<Map<String, dynamic>> scans = [];

  @override
  void initState() {
    super.initState();
    loadReport();
  }

  String _date(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  String _displayDate(String? value) {
    if (value == null || value.isEmpty) return '';
    final parsed = DateTime.tryParse(value);
    if (parsed == null) return value;
    return DateFormat('dd MMM yyyy, HH:mm').format(parsed.toLocal());
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
        setState(() {
          totalScans = data['total_scans'] is int ? data['total_scans'] : int.tryParse('${data['total_scans']}') ?? 0;
          uniqueStudents = data['unique_students'] is int
              ? data['unique_students']
              : int.tryParse('${data['unique_students']}') ?? 0;
          morningCount = data['morning_count'] is int ? data['morning_count'] : int.tryParse('${data['morning_count']}') ?? 0;
          eveningCount = data['evening_count'] is int ? data['evening_count'] : int.tryParse('${data['evening_count']}') ?? 0;
          scans = List<Map<String, dynamic>>.from(
            (data['scans'] as List? ?? []).map((row) => Map<String, dynamic>.from(row)),
          );
        });
      } else {
        setState(() {
          errorMessage = body['message']?.toString() ?? 'Could not load the report';
          scans = [];
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
        scans = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Scan Attendance', style: TextStyle(color: Colors.white, fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
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
              child: Text('Scans: $totalScans    Students: $uniqueStudents', style: const TextStyle(fontSize: 14)),
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
    if (scans.isEmpty) return const Center(child: Text('No scans for this period', style: TextStyle(fontSize: 16)));

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: scans.length,
      itemBuilder: (context, index) {
        final scan = scans[index];
        final className = [scan['class_name'], scan['section_name']].where((part) => part != null && '$part'.isNotEmpty).join(' - ');
        return Card(
          child: ListTile(
            title: Text(scan['student_name']?.toString() ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(
              '${_displayDate(scan['scan_date']?.toString())}\n$className',
              style: const TextStyle(fontSize: 14),
            ),
            isThreeLine: true,
            trailing: Text(
              scan['is_counted'] == true || scan['is_counted'] == 1
                  ? (scan['day_period']?.toString() ?? '')
                  : '',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }
}
