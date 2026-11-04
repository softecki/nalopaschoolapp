/// Tables shared by the phone SQLite database and the web Drift database.
class OfflineScanTables {
  static const students = '''
    CREATE TABLE IF NOT EXISTS offline_scan_students (
      student_id INTEGER PRIMARY KEY,
      first_name TEXT,
      last_name TEXT,
      control_number TEXT,
      class_name TEXT,
      section_name TEXT,
      classes_id INTEGER,
      section_id INTEGER,
      session_id INTEGER,
      total_amount TEXT,
      base_remained TEXT,
      out_remained TEXT,
      base_q1 TEXT,
      base_q2 TEXT,
      base_q3 TEXT,
      out_q1 TEXT,
      out_q2 TEXT,
      out_q3 TEXT,
      credit TEXT
    )
  ''';

  static const scans = '''
    CREATE TABLE IF NOT EXISTS offline_scans (
      client_scan_id TEXT PRIMARY KEY,
      control_number TEXT,
      scan_date TEXT,
      student_id INTEGER,
      first_name TEXT,
      last_name TEXT,
      student_name TEXT,
      class_name TEXT,
      section_name TEXT,
      classes_id INTEGER,
      section_id INTEGER,
      session_id INTEGER,
      total_amount TEXT,
      day_period TEXT,
      is_paid_complete INTEGER,
      attendance_status TEXT,
      latitude REAL,
      longitude REAL,
      synced INTEGER NOT NULL DEFAULT 0
    )
  ''';

  static const controlIndex = '''
    CREATE INDEX IF NOT EXISTS idx_offline_scan_students_control
    ON offline_scan_students(control_number)
  ''';

  /// Columns added after the first version of these tables.
  static const studentExtras = <String, String>{
    'classes_id': 'INTEGER',
    'section_id': 'INTEGER',
    'session_id': 'INTEGER',
    'base_remained': 'TEXT',
    'out_remained': 'TEXT',
    'base_q1': 'TEXT',
    'base_q2': 'TEXT',
    'base_q3': 'TEXT',
    'out_q1': 'TEXT',
    'out_q2': 'TEXT',
    'out_q3': 'TEXT',
    'credit': 'TEXT',
  };

  static const scanExtras = <String, String>{
    'classes_id': 'INTEGER',
    'section_id': 'INTEGER',
    'session_id': 'INTEGER',
    'day_period': 'TEXT',
    'is_paid_complete': 'INTEGER',
    'attendance_status': 'TEXT',
  };

  static Future<void> addMissingColumns({
    required Future<List<String>> Function(String table) columnsOf,
    required Future<void> Function(String sql) execute,
  }) async {
    Future<void> table(String name, Map<String, String> extras) async {
      final have = await columnsOf(name);
      for (final column in extras.entries) {
        if (have.contains(column.key)) continue;
        await execute('ALTER TABLE $name ADD COLUMN ${column.key} ${column.value}');
      }
    }

    await table('offline_scan_students', studentExtras);
    await table('offline_scans', scanExtras);
  }
}
