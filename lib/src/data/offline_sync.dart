import 'dart:async';
import 'dart:convert';

import 'package:dodomaapp/core/app_data.dart';
import 'package:dodomaapp/src/data/offline_scan_store.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

/// Sends scans that were saved on the phone, then refreshes the student list.
class OfflineSync {
  static Timer? _timer;
  static bool _busy = false;
  static bool _again = false;

  static void start() {
    WidgetsFlutterBinding.ensureInitialized();
    _timer ??= Timer.periodic(const Duration(minutes: 10), (_) {
      run();
    });
    requestSync();
  }

  /// Sends scans that are still only on this device, without waiting for the timer.
  static Future<void> requestSync() async {
    final waiting = await OfflineScanStore.pending();
    if (waiting.isNotEmpty) {
      await run();
    }
  }

  static Future<void> run() async {
    if (_busy) {
      _again = true;
      return;
    }
    _busy = true;
    try {
      do {
        _again = false;
        try {
          await _pushPending();
          await _pullStudents();
        } catch (e) {
          debugPrint('Offline sync skipped: $e');
          if (!_again) break;
        }
      } while (_again);
    } finally {
      _busy = false;
    }
  }

  static Future<void> _pushPending() async {
    final waiting = await OfflineScanStore.pending();
    for (final scan in waiting) {
      final clientId = scan['client_scan_id']?.toString() ?? '';
      if (clientId.isEmpty) continue;
      final response = await http
          .post(
            Uri.parse('${AppData.url}/parent/qr-code/scan'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'control_number': scan['control_number'],
              'scan_date': scan['scan_date'],
              'client_scan_id': clientId,
              'offline': true,
              'total_amount': scan['total_amount'],
              'class_name': scan['class_name'],
              'section_name': scan['section_name'],
              if (scan['session_id'] != null) 'session_id': scan['session_id'],
              if (scan['classes_id'] != null) 'classes_id': scan['classes_id'],
              if (scan['section_id'] != null) 'section_id': scan['section_id'],
              if (scan['latitude'] != null) 'latitude': scan['latitude'],
              if (scan['longitude'] != null) 'longitude': scan['longitude'],
            }),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body is Map && body['status'] == true) {
          await OfflineScanStore.markSynced(clientId);
        }
      }
    }
  }

  static Future<void> _pullStudents() async {
    final response = await http
        .get(
          Uri.parse('${AppData.url}/parent/qr-code/offline-data'),
          headers: {'Accept': 'application/json'},
        )
        .timeout(const Duration(seconds: 25));
    if (response.statusCode != 200) return;
    final body = jsonDecode(response.body);
    if (body is! Map) return;
    final data = body['data'];
    if (data is! Map) return;
    final students = data['scan_students'];
    if (students is List && students.isNotEmpty) {
      await OfflineScanStore.saveStudents(students);
    }
  }
}
