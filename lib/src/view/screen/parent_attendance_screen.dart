import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';

class ParentAttendanceScreen extends StatefulWidget {
  const ParentAttendanceScreen({super.key});

  @override
  State<ParentAttendanceScreen> createState() => _ParentAttendanceScreenState();
}

class _ParentAttendanceScreenState extends State<ParentAttendanceScreen> {
  final String baseUrl = 'https://nalopaschool.softecki.com/api';
  DateTime fromDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime toDate = DateTime.now();
  bool isLoading = false;
  String? errorMessage;
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadReport();
  }

  String _date(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  Future<void> loadReport() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final phone = prefs.getString('code_number') ?? '';
      final response = await http.post(
        Uri.parse('$baseUrl/parent/attendance'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: jsonEncode({
          'phone': phone,
          'from': _date(fromDate),
          'to': _date(toDate),
        }),
      );
      final body = jsonDecode(response.body);
      if (!mounted) return;
      if (response.statusCode == 200 && body['status'] == true) {
        final list = body['data']['students'] as List? ?? [];
        setState(() {
          students = list.map((row) => Map<String, dynamic>.from(row)).toList();
        });
      } else {
        setState(() {
          errorMessage = body['message']?.toString() ?? 'Could not load attendance';
          students = [];
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => errorMessage = e.toString());
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Attendance Report', style: TextStyle(color: Colors.white, fontSize: 18)),
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

  Widget _body() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)));
    }
    if (students.isEmpty) {
      return const Center(child: Text('No linked children found', style: TextStyle(fontSize: 16)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        final counts = Map<String, dynamic>.from(student['counts'] ?? {});
        final records = List<Map<String, dynamic>>.from(
          (student['records'] as List? ?? []).map((row) => Map<String, dynamic>.from(row)),
        );
        return Card(
          child: ExpansionTile(
            title: Text(student['student_name']?.toString() ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(
              '${student['class_name'] ?? ''} (${student['section_name'] ?? ''})\nPresent ${counts['Present'] ?? 0}  Absent ${counts['Absent'] ?? 0}  Late ${counts['Late'] ?? 0}',
              style: const TextStyle(fontSize: 14),
            ),
            children: records.isEmpty
                ? const [ListTile(title: Text('No attendance in this period'))]
                : records.map((record) {
                    return ListTile(
                      dense: true,
                      title: Text(record['date']?.toString() ?? '', style: const TextStyle(fontSize: 14)),
                      trailing: Text(record['status']?.toString() ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    );
                  }).toList(),
          ),
        );
      },
    );
  }
}
