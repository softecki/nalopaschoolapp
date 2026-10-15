import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Web-specific database connection using SQL.js (WebAssembly)
QueryExecutor createPlatformConnection() {
  // WebDatabase uses SQL.js under the hood
  // Make sure sql-wasm.js is loaded in index.html
  return WebDatabase('margaret_db');
}

