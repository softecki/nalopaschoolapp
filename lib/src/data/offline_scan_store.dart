import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
import 'drift_database.dart';
import 'offline_scan_tables.dart';

/// Students and scans kept in the local database so a QR scan can be checked
/// and saved when the server does not answer in time.
class OfflineScanStore {
  static const studentsKey = 'offline_scan_students';
  static const scansKey = 'offline_local_scans';
  static bool _legacyImported = false;

  static Future<void> saveStudents(List students) async {
    final compact = <Map<String, Object?>>[];
    for (final item in students) {
      if (item is! Map) continue;
      final row = Map<String, dynamic>.from(item);
      final control = (row['control_number'] ?? '').toString().trim();
      final studentId = int.tryParse(row['student_id']?.toString() ?? '');
      if (control.isEmpty || studentId == null) continue;
      compact.add({
        'student_id': studentId,
        'first_name': row['first_name']?.toString() ?? '',
        'last_name': row['last_name']?.toString() ?? '',
        'control_number': control,
        'class_name': row['class_name']?.toString() ?? '',
        'section_name': row['section_name']?.toString() ?? '',
        'classes_id': int.tryParse(row['classes_id']?.toString() ?? ''),
        'section_id': int.tryParse(row['section_id']?.toString() ?? ''),
        'session_id': int.tryParse(row['session_id']?.toString() ?? ''),
        'total_amount': row['total_amount']?.toString() ?? '0',
        'base_remained': row['base_remained']?.toString() ?? '0',
        'out_remained': row['out_remained']?.toString() ?? '0',
        'base_q1': row['base_q1']?.toString() ?? '0',
        'base_q2': row['base_q2']?.toString() ?? '0',
        'base_q3': row['base_q3']?.toString() ?? '0',
        'out_q1': row['out_q1']?.toString() ?? '0',
        'out_q2': row['out_q2']?.toString() ?? '0',
        'out_q3': row['out_q3']?.toString() ?? '0',
        'credit': row['credit']?.toString() ?? '0',
      });
    }
    if (compact.isEmpty) return;
    await _ready();

    if (kIsWeb) {
      final db = await _drift();
      await db.transaction(() async {
        await db.customStatement('DELETE FROM offline_scan_students');
        for (final row in compact) {
          await db.customStatement(
            'INSERT OR REPLACE INTO offline_scan_students (student_id, first_name, last_name, control_number, class_name, section_name, classes_id, section_id, session_id, total_amount, base_remained, out_remained, base_q1, base_q2, base_q3, out_q1, out_q2, out_q3, credit) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [
              row['student_id'],
              row['first_name'],
              row['last_name'],
              row['control_number'],
              row['class_name'],
              row['section_name'],
              row['classes_id'],
              row['section_id'],
              row['session_id'],
              row['total_amount'],
              row['base_remained'],
              row['out_remained'],
              row['base_q1'],
              row['base_q2'],
              row['base_q3'],
              row['out_q1'],
              row['out_q2'],
              row['out_q3'],
              row['credit'],
            ],
          );
        }
      });
      return;
    }

    final db = await _sqlite();
    final batch = db.batch();
    batch.delete('offline_scan_students');
    for (final row in compact) {
      batch.insert('offline_scan_students', row, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  static Future<Map<String, dynamic>?> findStudent(String controlNumber) async {
    final code = controlNumber.trim();
    if (code.isEmpty) return null;
    await _ready();

    if (kIsWeb) {
      final rows = await (await _drift()).customSelect(
        'SELECT * FROM offline_scan_students WHERE TRIM(control_number) = ? LIMIT 1',
        variables: [Variable.withString(code)],
      ).get();
      if (rows.isEmpty) return null;
      return _studentFrom(rows.first.data);
    }

    final rows = await (await _sqlite()).query(
      'offline_scan_students',
      where: 'TRIM(control_number) = ?',
      whereArgs: [code],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return _studentFrom(rows.first);
  }

  static Future<void> saveScan(Map<String, dynamic> scan) async {
    final clientId = scan['client_scan_id']?.toString() ?? '';
    if (clientId.isEmpty) return;
    await _ready();
    final row = <String, Object?>{
      'client_scan_id': clientId,
      'control_number': scan['control_number']?.toString() ?? '',
      'scan_date': scan['scan_date']?.toString() ?? '',
      'student_id': int.tryParse(scan['student_id']?.toString() ?? ''),
      'first_name': scan['first_name']?.toString() ?? '',
      'last_name': scan['last_name']?.toString() ?? '',
      'student_name': scan['student_name']?.toString() ?? '',
      'class_name': scan['class_name']?.toString() ?? '',
      'section_name': scan['section_name']?.toString() ?? '',
      'classes_id': int.tryParse(scan['classes_id']?.toString() ?? ''),
      'section_id': int.tryParse(scan['section_id']?.toString() ?? ''),
      'session_id': int.tryParse(scan['session_id']?.toString() ?? ''),
      'total_amount': scan['total_amount']?.toString() ?? '0',
      'day_period': scan['day_period']?.toString() ?? '',
      'is_paid_complete': scan['is_paid_complete'] == true || scan['is_paid_complete'] == 1 || _num(scan['total_amount']) <= 0 ? 1 : 0,
      'attendance_status': scan['attendance_status']?.toString() ?? 'Present',
      'latitude': _doubleOrNull(scan['latitude']),
      'longitude': _doubleOrNull(scan['longitude']),
      'synced': scan['synced'] == true ? 1 : 0,
    };

    if (kIsWeb) {
      final db = await _drift();
      await db.customStatement(
        'INSERT OR REPLACE INTO offline_scans (client_scan_id, control_number, scan_date, student_id, first_name, last_name, student_name, class_name, section_name, classes_id, section_id, session_id, total_amount, day_period, is_paid_complete, attendance_status, latitude, longitude, synced) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          row['client_scan_id'],
          row['control_number'],
          row['scan_date'],
          row['student_id'],
          row['first_name'],
          row['last_name'],
          row['student_name'],
          row['class_name'],
          row['section_name'],
          row['classes_id'],
          row['section_id'],
          row['session_id'],
          row['total_amount'],
          row['day_period'],
          row['is_paid_complete'],
          row['attendance_status'],
          row['latitude'],
          row['longitude'],
          row['synced'],
        ],
      );
    } else {
      await (await _sqlite()).insert(
        'offline_scans',
        row,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await _trimSynced();
  }

  static Future<List<Map<String, dynamic>>> pending() async {
    await _ready();
    if (kIsWeb) {
      final rows = await (await _drift()).customSelect(
        'SELECT * FROM offline_scans WHERE synced = 0',
      ).get();
      return rows.map((row) => _scanFrom(row.data)).toList();
    }
    final rows = await (await _sqlite()).query('offline_scans', where: 'synced = ?', whereArgs: [0]);
    return rows.map(_scanFrom).toList();
  }

  static Future<void> markSynced(String clientId) async {
    if (clientId.isEmpty) return;
    await _ready();
    if (kIsWeb) {
      await (await _drift()).customStatement(
        'UPDATE offline_scans SET synced = 1 WHERE client_scan_id = ?',
        [clientId],
      );
      return;
    }
    await (await _sqlite()).update(
      'offline_scans',
      {'synced': 1},
      where: 'client_scan_id = ?',
      whereArgs: [clientId],
    );
  }

  static Future<List<Map<String, dynamic>>> scansOnDevice() async {
    await _ready();
    if (kIsWeb) {
      final rows = await (await _drift()).customSelect(
        'SELECT * FROM offline_scans ORDER BY scan_date',
      ).get();
      return rows.map((row) => _scanFrom(row.data)).toList();
    }
    final rows = await (await _sqlite()).query('offline_scans', orderBy: 'scan_date');
    return rows.map(_scanFrom).toList();
  }

  static Future<void> _ready() async {
    final db = await DatabaseHelper.instance.database;
    if (kIsWeb) {
      await (db as AppDatabase).createOfflineScanTables();
    } else {
      final sqlite = db as Database;
      await sqlite.execute(OfflineScanTables.students);
      await sqlite.execute(OfflineScanTables.scans);
      await sqlite.execute(OfflineScanTables.controlIndex);
      await OfflineScanTables.addMissingColumns(
        columnsOf: (table) async {
          final rows = await sqlite.rawQuery('PRAGMA table_info($table)');
          return rows.map((row) => row['name'].toString()).toList();
        },
        execute: sqlite.execute,
      );
    }
    await _importLegacyPrefs();
  }

  static Future<void> _importLegacyPrefs() async {
    if (_legacyImported) return;
    _legacyImported = true;
    final prefs = await SharedPreferences.getInstance();
    final studentsRaw = prefs.getString(studentsKey);
    final scansRaw = prefs.getString(scansKey);
    if (studentsRaw != null && studentsRaw.isNotEmpty) {
      final decoded = jsonDecode(studentsRaw);
      if (decoded is List && decoded.isNotEmpty) {
        final existing = kIsWeb
            ? (await (await _drift()).customSelect('SELECT COUNT(*) AS total FROM offline_scan_students').get()).first.data['total']
            : Sqflite.firstIntValue(await (await _sqlite()).rawQuery('SELECT COUNT(*) FROM offline_scan_students'));
        if ((existing is num ? existing.toInt() : int.tryParse('$existing') ?? 0) == 0) {
          await saveStudents(decoded);
        }
      }
      await prefs.remove(studentsKey);
    }
    if (scansRaw != null && scansRaw.isNotEmpty) {
      final decoded = jsonDecode(scansRaw);
      if (decoded is List) {
        for (final item in decoded) {
          if (item is Map) await saveScan(Map<String, dynamic>.from(item));
        }
      }
      await prefs.remove(scansKey);
    }
  }

  static Future<void> _trimSynced() async {
    const sql = '''
      DELETE FROM offline_scans
      WHERE synced = 1
        AND client_scan_id NOT IN (
          SELECT client_scan_id FROM offline_scans WHERE synced = 1 ORDER BY scan_date DESC LIMIT 1500
        )
    ''';
    if (kIsWeb) {
      await (await _drift()).customStatement(sql);
    } else {
      await (await _sqlite()).execute(sql);
    }
  }

  static Future<AppDatabase> _drift() async {
    return await DatabaseHelper.instance.database as AppDatabase;
  }

  static Future<Database> _sqlite() async {
    return await DatabaseHelper.instance.database as Database;
  }

  /// Same month rules the server uses when it decides cleared or uncleared.
  static double amountDue(Map student, DateTime when) {
    final hasParts = student['base_q1'] != null || student['base_remained'] != null || student['credit'] != null;
    if (!hasParts) return _num(student['total_amount']);
    final month = when.month;
    final credit = _num(student['credit']).abs();
    double due;
    if (month >= 9 && month <= 12) {
      due = _num(student['base_remained']) + _num(student['out_remained']);
    } else {
      due = _num(student['base_q1']) + _num(student['out_q1']);
      if (month >= 4 && month < 9) {
        due += _num(student['base_q2']) + _num(student['out_q2']);
      }
      if (month >= 6 && month < 9) {
        due += _num(student['base_q3']) + _num(student['out_q3']);
      }
    }
    final amount = due - credit;
    return amount < 0 ? 0 : amount;
  }

  static Map<String, dynamic> _studentFrom(Map<String, Object?> row) {
    return Map<String, dynamic>.from(row);
  }

  static Map<String, dynamic> _scanFrom(Map<String, Object?> row) {
    final scan = Map<String, dynamic>.from(row);
    scan['synced'] = row['synced'] == 1 || row['synced'] == true;
    scan['is_paid_complete'] = row['is_paid_complete'] == 1 || row['is_paid_complete'] == true;
    return scan;
  }

  static double _num(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0;
  }

  static double? _doubleOrNull(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }
}
