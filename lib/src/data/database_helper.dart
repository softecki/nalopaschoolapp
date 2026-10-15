import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

// Conditional imports for database
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Drift database for web support
import 'package:drift/drift.dart';
import 'drift_database.dart';

// Import Exam class with alias to avoid conflict
import '../view/screen/exam_list_screen.dart' as exam_screen;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  static AppDatabase? _driftDatabase;

  DatabaseHelper._init();

  // Helper functions for safe type conversion
  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) {
      final parsed = int.tryParse(value);
      return parsed;
    }
    if (value is double) return value.toInt();
    return null;
  }

  // API values may arrive as int/double/bool/List even for text columns.
  static String? _toStr(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is List || value is Map) return jsonEncode(value);
    return value.toString();
  }

  static String _toStrRequired(dynamic value, {String defaultValue = ''}) {
    return _toStr(value) ?? defaultValue;
  }

  static int _toIntRequired(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }
    if (value is double) return value.toInt();
    return defaultValue;
  }

  Future<dynamic> get database async {
    if (kIsWeb) {
      // Use Drift on web - return AppDatabase instance
      _driftDatabase ??= AppDatabase();
      return _driftDatabase!;
    } else {
      // Use SQLite on mobile
      if (_database != null) return _database!;
      _database = await _initDB('margaret.db');
      return _database!;
    }
  }
  
  /// Get Drift database instance (web only)
  AppDatabase? get driftDb => _driftDatabase;
  
  /// Get SQLite database instance (mobile only)
  Future<Database?> get sqliteDb async {
    if (kIsWeb) return null;
    return await database as Database?;
  }

  Future<Database> _initDB(String filePath) async {
    // For mobile platforms only
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS fees_groups (
        id INTEGER PRIMARY KEY,
        name TEXT,
        dashboard_order TEXT,
        description TEXT,
        status INTEGER,
        online_admission_fees INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    ''' );
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT  NULL ,
        email TEXT  NULL ,
        password TEXT NOT NULL,
        status TEXT NOT NULL,
        role_id TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        admission_no TEXT,
        roll_no TEXT,
        first_name TEXT,
        last_name TEXT,
        mobile TEXT,
        email TEXT,
        dob TEXT,
        admission_date TEXT,
        student_category_id INTEGER,
        religion_id INTEGER,
        blood_group_id INTEGER,
        gender_id INTEGER,
        category_id INTEGER,
        image_id INTEGER,
        parent_guardian_id INTEGER,
        user_id INTEGER,
        upload_documents TEXT,
        status INTEGER,
        previous_school INTEGER,
        previous_school_info TEXT,
        previous_school_image_id INTEGER,
        place_of_birth TEXT,
        nationality TEXT,
        cpr_no TEXT,
        spoken_lang_at_home TEXT,
        residance_address TEXT,
        control_number TEXT,
        created_at TEXT,
        updated_at TEXT,
        full_name TEXT,
        class_name TEXT,
        section_name TEXT,
        available TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE fees_assignments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fees_assign_id INTEGER NOT NULL,
        fees_master_id INTEGER NOT NULL,
        student_id INTEGER NOT NULL,
        control_number TEXT NOT NULL,
        fees_amount TEXT DEFAULT '0',
        paid_amount TEXT DEFAULT '0',
        remained_amount TEXT DEFAULT '0',
        quater_amount TEXT DEFAULT NULL,
        quater_one INTEGER DEFAULT NULL,
        quater_two INTEGER DEFAULT NULL,
        quater_three INTEGER DEFAULT NULL,
        quater_four INTEGER DEFAULT NULL,
        comment TEXT DEFAULT NULL,
        outstandingbalance TEXT DEFAULT NULL,
        fee_group TEXT DEFAULT NULL,
        updated TEXT DEFAULT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE fees_assign_children (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fees_assign_id INTEGER NOT NULL,
        fees_master_id INTEGER NOT NULL,
        student_id INTEGER NOT NULL,
        control_number TEXT NOT NULL,
        fees_amount TEXT DEFAULT '0',
        paid_amount TEXT DEFAULT '0',
        remained_amount TEXT DEFAULT '0',
        quater_amount TEXT DEFAULT NULL,
        quater_one INTEGER DEFAULT NULL,
        quater_two INTEGER DEFAULT NULL,
        quater_three INTEGER DEFAULT NULL,
        quater_four INTEGER DEFAULT NULL,
        comment TEXT DEFAULT NULL,
        outstandingbalance TEXT DEFAULT NULL,
        fee_group TEXT DEFAULT NULL,
        updated TEXT DEFAULT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE exam_types (
        id INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT,
        status INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
          CREATE TABLE classes (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            status INTEGER NOT NULL,
            orders INTEGER NOT NULL,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL,
            class_tran TEXT NOT NULL
          )
        ''');

    await db.execute('''
          CREATE TABLE subjects (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            code TEXT,
            type INTEGER NOT NULL,
            status INTEGER NOT NULL,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');

    await db.execute('''
          CREATE TABLE sections (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            status INTEGER NOT NULL,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL,
            section_tran TEXT NOT NULL
          )
        ''');

    await db.execute('''
      CREATE TABLE exams (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sectionId INTEGER NOT NULL,
        examTypeId INTEGER NOT NULL,
        subjectId INTEGER NOT NULL,
        classId INTEGER NOT NULL,
         marks TEXT,
         status INTEGER
      )
    ''');

    await db.execute('''
  CREATE TABLE marks_register_childrens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    marks_register_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    mark INTEGER NOT NULL,
    created_at TEXT,
    updated_at TEXT
  )
''');

    await db.execute('''
  CREATE TABLE fees_masters (
  id INTEGER PRIMARY KEY,
  session_id INTEGER,
  fees_group_id INTEGER,
  fees_type_id INTEGER,
  due_date TEXT,
  amount TEXT,
  fine_type INTEGER,
  percentage INTEGER,
  fine_amount TEXT,
  status INTEGER,
  created_at TEXT,
  updated_at TEXT
)
''');


    await db.execute('''
  CREATE TABLE fees_type (
  id INTEGER PRIMARY KEY,
  name TEXT,
  code TEXT,
  description TEXT,
  status INTEGER,
  class_id INTEGER,
  created_at TEXT,
  updated_at TEXT
)
''');



    await db.execute('''
  CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  date TEXT,
  payment_method INTEGER,
  payment_gateway TEXT,
  transaction_id TEXT,
  fees_assign_children_id INTEGER,
  fees_collect_by INTEGER,
  student_id INTEGER,
  session_id INTEGER,
  amount TEXT,
  fine_amount TEXT,
  account_id INTEGER,
  comments TEXT,
  printed INTEGER,
  created_at TEXT,
  updated_at TEXT
)
''');

    await db.execute('''
  CREATE TABLE bank_accounts (
    id INTEGER PRIMARY KEY,
    bank_name TEXT NOT NULL,
    account_name TEXT NOT NULL,
    account_number TEXT NOT NULL,
    account_type TEXT,
    status TEXT DEFAULT '1',
    created_at TEXT,
    updated_at TEXT
)
''');

    await db.execute('''
  CREATE TABLE subject_assign_childrens (
    id INTEGER PRIMARY KEY,
    subject_assign_id TEXT NOT NULL,
    subject_id TEXT NOT NULL,
    staff_id TEXT NOT NULL,
    status TEXT,
    created_at TEXT,
    updated_at TEXT
)
''');

    await db.execute('''
  CREATE TABLE subject_assigns (
    id INTEGER PRIMARY KEY,
    session_id TEXT NOT NULL,
    classes_id TEXT NOT NULL,
    section_id TEXT NOT NULL,
    status TEXT,
    created_at TEXT,
    updated_at TEXT
)
''');

    await db.execute('''
  CREATE TABLE staff (
    id INTEGER PRIMARY KEY,
    user_id TEXT NOT NULL,
    staff_id TEXT NOT NULL,
    role_id TEXT NOT NULL,
    designation_id TEXT NOT NULL,
    department_id TEXT NOT NULL,
    first_name TEXT ,
    last_name TEXT ,
    email TEXT ,
    gender_id TEXT ,
    status TEXT,
    created_at TEXT,
    updated_at TEXT
)
''');

    await db.execute('''
  CREATE TABLE marks_grade (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  percent_from REAL NOT NULL,
  percent_upto REAL NOT NULL,
  point INTEGER NOT NULL,
  remarks TEXT,
  session_id INTEGER NOT NULL,
  status INTEGER DEFAULT 1,
  created_at TEXT,
  updated_at TEXT
)
''');


    await db.execute('''
  CREATE TABLE parent_details (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    father_name TEXT,
    father_mobile TEXT,
    father_profession TEXT,
    father_image TEXT,
    father_nationality TEXT,
    mother_name TEXT,
    mother_mobile TEXT,
    mother_profession TEXT,
    mother_image TEXT,
    guardian_name TEXT,
    guardian_email TEXT,
    guardian_mobile TEXT,
    guardian_image TEXT,
    guardian_profession TEXT,
    guardian_relation TEXT,
    guardian_address TEXT,
    status INTEGER DEFAULT 1,
    created_at TEXT,
    updated_at TEXT
)
''');

    await db.execute('''
    CREATE TABLE notice_boards (
      id INTEGER PRIMARY KEY,
      title TEXT,
      date TEXT,
      publish_date TEXT,
      description TEXT,
      attachment TEXT,
      is_visible_web INTEGER,
      status INTEGER,
      visible_to TEXT,
      created_at TEXT,
      updated_at TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE students_list (
      id INTEGER PRIMARY KEY,
      admission_no TEXT,
      roll_no INTEGER,
      first_name TEXT,
      last_name TEXT,
      mobile TEXT,
      email TEXT,
      dob TEXT,
      admission_date TEXT,
      student_category_id INTEGER,
      religion_id INTEGER,
      blood_group_id INTEGER,
      gender_id INTEGER,
      category_id INTEGER,
      image_id INTEGER,
      parent_guardian_id INTEGER,
      user_id INTEGER,
      upload_documents TEXT,
      status INTEGER,
      previous_school INTEGER,
      previous_school_info TEXT,
      previous_school_image_id INTEGER,
      place_of_birth TEXT,
      nationality TEXT,
      cpr_no TEXT,
      spoken_lang_at_home TEXT,
      residance_address TEXT,
      control_number TEXT,
      available TEXT,
      created_at TEXT,
      updated_at TEXT
    )
  ''');

  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS fees_groups (
          id INTEGER PRIMARY KEY,
          name TEXT,
          dashboard_order TEXT,
          description TEXT,
          status INTEGER,
          online_admission_fees INTEGER,
          created_at TEXT,
          updated_at TEXT
        )
      ''');
    }
  }

  Future<void> insertStudentList(Map<String, dynamic> student) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.studentsList).insertOnConflictUpdate(
        StudentsListCompanion(
          id: student['id'] != null && student['id'].toString().isNotEmpty ? Value(_toIntRequired(student['id'])) : const Value.absent(),
          admissionNo: Value(_toStr(student['admission_no'])),
          rollNo: Value(_toInt(student['roll_no'])),
          firstName: Value(_toStr(student['first_name'])),
          lastName: Value(_toStr(student['last_name'])),
          mobile: Value(_toStr(student['mobile'])),
          email: Value(_toStr(student['email'])),
          dob: Value(_toStr(student['dob'])),
          admissionDate: Value(_toStr(student['admission_date'])),
          studentCategoryId: Value(_toInt(student['student_category_id'])),
          religionId: Value(_toInt(student['religion_id'])),
          bloodGroupId: Value(_toInt(student['blood_group_id'])),
          genderId: Value(_toInt(student['gender_id'])),
          categoryId: Value(_toInt(student['category_id'])),
          imageId: Value(_toInt(student['image_id'])),
          parentGuardianId: Value(_toInt(student['parent_guardian_id'])),
          userId: Value(_toInt(student['user_id'])),
          uploadDocuments: Value(_toStr(student['upload_documents'])),
          status: Value(_toInt(student['status'])),
          previousSchool: Value(_toInt(student['previous_school'])),
          previousSchoolInfo: Value(_toStr(student['previous_school_info'])),
          previousSchoolImageId: Value(_toInt(student['previous_school_image_id'])),
          placeOfBirth: Value(_toStr(student['place_of_birth'])),
          nationality: Value(_toStr(student['nationality'])),
          cprNo: Value(_toStr(student['cpr_no'])),
          spokenLangAtHome: Value(_toStr(student['spoken_lang_at_home'])),
          residanceAddress: Value(_toStr(student['residance_address'])),
          controlNumber: Value(_toStr(student['control_number'])),
          available: Value(_toStr(student['available'])),
          createdAt: Value(_toStr(student['created_at'])),
          updatedAt: Value(_toStr(student['updated_at'])),
        ),
      );
    } else {
      final db = await instance.database as Database;
      await db.insert(
        'students_list',
        student,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertNotice(Map<String, dynamic> notice) async {
    // Clean <p> tags if still present
    final cleanedDescription = notice['description']
        ?.replaceAll('<p>', '')
        .replaceAll('</p>', '');

    if (kIsWeb) {
      // Use Drift on web
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.noticeBoards).insertOnConflictUpdate(
        NoticeBoardsCompanion(
          id: notice['id'] != null && notice['id'].toString().isNotEmpty ? Value(_toIntRequired(notice['id'])) : const Value.absent(),
          title: Value(_toStr(notice['title'])),
          date: Value(_toStr(notice['date'])),
          publishDate: Value(_toStr(notice['publish_date'])),
          description: Value(cleanedDescription as String?),
          attachment: Value(_toStr(notice['attachment'])),
          isVisibleWeb: Value(_toInt(notice['is_visible_web'])),
          status: Value(_toInt(notice['status'])),
          visibleTo: Value(_toStr(notice['visible_to'])),
          createdAt: Value(_toStr(notice['created_at'])),
          updatedAt: Value(_toStr(notice['updated_at'])),
        ),
      );
    } else {
      // Use SQLite on mobile
      final db = await instance.database as Database;
      await db.insert(
        'notice_boards',
        {
          'id': notice['id'],
          'title': notice['title'],
          'date': notice['date'],
          'publish_date': notice['publish_date'],
          'description': cleanedDescription,
          'attachment': notice['attachment'],
          'is_visible_web': notice['is_visible_web'],
          'status': notice['status'],
          'visible_to': notice['visible_to'],
          'created_at': notice['created_at'],
          'updated_at': notice['updated_at'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }


  Future<void> insertStaff(Map<String, dynamic> staff) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.staff).insertOnConflictUpdate(
        StaffCompanion(
          id: staff['id'] != null && staff['id'].toString().isNotEmpty ? Value(_toIntRequired(staff['id'])) : const Value.absent(),
          userId: Value(_toStrRequired(staff['user_id'])),
          staffId: Value(_toStrRequired(staff['staff_id'])),
          roleId: Value(_toStrRequired(staff['role_id'])),
          designationId: Value(_toStrRequired(staff['designation_id'])),
          departmentId: Value(_toStrRequired(staff['department_id'])),
          firstName: Value(_toStr(staff['first_name'])),
          lastName: Value(_toStr(staff['last_name'])),
          email: Value(_toStr(staff['email'])),
          genderId: Value(_toStr(staff['gender_id'])),
          status: Value(_toStr(staff['status'])),
          createdAt: Value(_toStr(staff['created_at'])),
          updatedAt: Value(_toStr(staff['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'staff',
        staff,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertSubjectAssign(Map<String, dynamic> subject_assigns) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.subjectAssigns).insertOnConflictUpdate(
        SubjectAssignsCompanion(
          id: _toIntRequired(subject_assigns['id']) != 0 ? Value(_toIntRequired(subject_assigns['id'])) : const Value.absent(),
          sessionId: Value(_toStrRequired(subject_assigns['session_id'])),
          classesId: Value(_toStrRequired(subject_assigns['classes_id'])),
          sectionId: Value(_toStrRequired(subject_assigns['section_id'])),
          status: Value(_toStr(subject_assigns['status'])),
          createdAt: Value(_toStr(subject_assigns['created_at'])),
          updatedAt: Value(_toStr(subject_assigns['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'subject_assigns',
        subject_assigns,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }


  Future<void> insertGrades(Map<String, dynamic> grades) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.marksGrade).insertOnConflictUpdate(
        MarksGradeCompanion(
          id: _toInt(grades['id']) != null ? Value(_toIntRequired(grades['id'])) : const Value.absent(),
          name: Value(_toStrRequired(grades['name'])),
          percentFrom: Value(grades['percent_from'] as double),
          percentUpto: Value(grades['percent_upto'] as double),
          point: Value(_toIntRequired(grades['point'])),
          remarks: Value(_toStr(grades['remarks'])),
          sessionId: Value(_toIntRequired(grades['session_id'])),
          status: Value(_toInt(grades['status']) ?? 1),
          createdAt: Value(_toStr(grades['created_at'])),
          updatedAt: Value(_toStr(grades['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'marks_grade',
        grades,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertSubjectAssignChildren(Map<String, dynamic> subject_assign_childrens) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.subjectAssignChildrens).insertOnConflictUpdate(
        SubjectAssignChildrensCompanion(
          id: _toIntRequired(subject_assign_childrens['id']) != 0 ? Value(_toIntRequired(subject_assign_childrens['id'])) : const Value.absent(),
          subjectAssignId: Value(_toStrRequired(subject_assign_childrens['subject_assign_id'])),
          subjectId: Value(_toStrRequired(subject_assign_childrens['subject_id'])),
          staffId: Value(_toStrRequired(subject_assign_childrens['staff_id'])),
          status: Value(_toStr(subject_assign_childrens['status'])),
          createdAt: Value(_toStr(subject_assign_childrens['created_at'])),
          updatedAt: Value(_toStr(subject_assign_childrens['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'subject_assign_childrens',
        subject_assign_childrens,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertBankAccounts(Map<String, dynamic> bank_accounts) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.bankAccounts).insertOnConflictUpdate(
        BankAccountsCompanion(
          id: _toIntRequired(bank_accounts['id']) != 0 ? Value(_toIntRequired(bank_accounts['id'])) : const Value.absent(),
          bankName: Value(_toStrRequired(bank_accounts['bank_name'])),
          accountName: Value(_toStrRequired(bank_accounts['account_name'])),
          accountNumber: Value(_toStrRequired(bank_accounts['account_number'])),
          accountType: Value(_toStr(bank_accounts['account_type'])),
          status: Value(_toStr(bank_accounts['status']) ?? '1'),
          createdAt: Value(_toStr(bank_accounts['created_at'])),
          updatedAt: Value(_toStr(bank_accounts['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'bank_accounts',
        bank_accounts,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }


  Future<void> insertFeeTransactions(Map<String, dynamic> transactions) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.transactions).insertOnConflictUpdate(
        TransactionsCompanion(
          id: _toIntRequired(transactions['id']) != 0 ? Value(_toIntRequired(transactions['id'])) : const Value.absent(),
          date: Value(_toStr(transactions['date'])),
          paymentMethod: Value(_toInt(transactions['payment_method'])),
          paymentGateway: Value(_toStr(transactions['payment_gateway'])),
          transactionId: Value(_toStr(transactions['transaction_id'])),
          feesAssignChildrenId: Value(_toInt(transactions['fees_assign_children_id'])),
          feesCollectBy: Value(_toInt(transactions['fees_collect_by'])),
          studentId: Value(_toInt(transactions['student_id'])),
          sessionId: Value(_toInt(transactions['session_id'])),
          amount: Value(_toStr(transactions['amount'])),
          fineAmount: Value(_toStr(transactions['fine_amount'])),
          accountId: Value(_toInt(transactions['account_id'])),
          comments: Value(_toStr(transactions['comments'])),
          printed: Value(_toInt(transactions['printed'])),
          createdAt: Value(_toStr(transactions['created_at'])),
          updatedAt: Value(_toStr(transactions['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'transactions',
        transactions,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertFee(Map<String, dynamic> fee) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.feesMasters).insertOnConflictUpdate(
        FeesMastersCompanion(
          id: _toIntRequired(fee['id']) != 0 ? Value(_toIntRequired(fee['id'])) : const Value.absent(),
          sessionId: Value(_toInt(fee['session_id'])),
          feesGroupId: Value(_toInt(fee['fees_group_id'])),
          feesTypeId: Value(_toInt(fee['fees_type_id'])),
          dueDate: Value(_toStr(fee['due_date'])),
          amount: Value(_toStr(fee['amount'])),
          fineType: Value(_toInt(fee['fine_type'])),
          percentage: Value(_toInt(fee['percentage'])),
          fineAmount: Value(_toStr(fee['fine_amount'])),
          status: Value(_toInt(fee['status'])),
          createdAt: Value(_toStr(fee['created_at'])),
          updatedAt: Value(_toStr(fee['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'fees_masters',
        fee,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertFeeType(Map<String, dynamic> fee) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.feesType).insertOnConflictUpdate(
        FeesTypeCompanion(
          id: _toIntRequired(fee['id']) != 0 ? Value(_toIntRequired(fee['id'])) : const Value.absent(),
          name: Value(_toStr(fee['name'])),
          code: Value(_toStr(fee['code'])),
          description: Value(_toStr(fee['description'])),
          status: Value(_toInt(fee['status'])),
          classId: Value(_toInt(fee['class_id'])),
          createdAt: Value(_toStr(fee['created_at'])),
          updatedAt: Value(_toStr(fee['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'fees_type',
        fee,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertFeeGroup(Map<String, dynamic> fee) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.feesGroups).insertOnConflictUpdate(
        FeesGroupsCompanion(
          id: _toIntRequired(fee['id']) != 0 ? Value(_toIntRequired(fee['id'])) : const Value.absent(),
          name: Value(_toStr(fee['name'])),
          dashboardOrder: Value(_toStr(fee['dashboard_order'])),
          description: Value(_toStr(fee['description'])),
          status: Value(_toInt(fee['status'])),
          onlineAdmissionFees: Value(_toInt(fee['online_admission_fees'])),
          createdAt: Value(_toStr(fee['created_at'])),
          updatedAt: Value(_toStr(fee['updated_at'])),
        ),
      );
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      await db.insert(
        'fees_groups',
        fee,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<int> insertMarksRegisterChildren(Map<String, dynamic> data) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final companion = MarksRegisterChildrensCompanion(
        id: _toInt(data['id']) != null ? Value(_toIntRequired(data['id'])) : const Value.absent(),
        marksRegisterId: Value(_toIntRequired(data['marks_register_id'])),
        studentId: Value(_toIntRequired(data['student_id'])),
        title: Value(_toStrRequired(data['title'])),
        mark: Value(_toIntRequired(data['mark'])),
        createdAt: Value(_toStr(data['created_at']) ?? ''),
        updatedAt: Value(_toStr(data['updated_at']) ?? ''),
      );
      await driftDb.into(driftDb.marksRegisterChildrens).insertOnConflictUpdate(companion);
      return _toIntRequired(data['id']);
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      final insertData = <String, dynamic>{
        'marks_register_id': data['marks_register_id'],
        'student_id': data['student_id'],
        'title': data['title'],
        'mark': data['mark'],
        'created_at': data['created_at']??'',
        'updated_at': data['updated_at']??'',
      };
      if (data['id'] != null) {
        insertData['id'] = data['id'];
      }
      return await db.insert(
        'marks_register_childrens',
        insertData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<int> insertMarksRegisterChildrenFromLogin(Map<String, dynamic> data) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final companion = MarksRegisterChildrensCompanion(
        id: _toInt(data['id']) != null ? Value(_toIntRequired(data['id'])) : const Value.absent(),
        marksRegisterId: Value(_toIntRequired(data['marks_register_id'])),
        studentId: Value(_toIntRequired(data['student_id'])),
        title: Value(_toStrRequired(data['title'])),
        mark: Value(_toIntRequired(data['mark'])),
        createdAt: Value(_toStr(data['created_at'])),
        updatedAt: Value(_toStr(data['updated_at'])),
      );
      await driftDb.into(driftDb.marksRegisterChildrens).insertOnConflictUpdate(companion);
      return _toIntRequired(data['id']);
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.insert(
        'marks_register_childrens',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }


  Future<int> insertExam({
    required String sectionId,
    required String examTypeId,
    required String subjectId,
    required String classId,
    required String status,
    required List<Map<String, dynamic>> marks,
  }) async {
    String marksJson = jsonEncode(marks);
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final companion = ExamsCompanion(
        sectionId: Value(int.parse(sectionId)),
        examTypeId: Value(int.parse(examTypeId)),
        subjectId: Value(int.parse(subjectId)),
        classId: Value(int.parse(classId)),
        marks: Value(marksJson),
        status: Value(int.tryParse(status)),
      );
      await driftDb.into(driftDb.exams).insertOnConflictUpdate(companion);
      // Return a dummy ID since we don't have auto-increment on web
      return 0;
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.insert(
        'exams',
        {
          'sectionId': sectionId,
          'examTypeId': examTypeId,
          'subjectId': subjectId,
          'classId': classId,
          'marks': marksJson,
          'status': status
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<int> updateExamStatusToOne(int examId) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.update(driftDb.exams)..where((e) => e.id.equals(examId));
      await query.write(ExamsCompanion(status: Value(1)));
      return 1;
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.update(
        'exams',
        {'status': 1},
        where: 'id = ?',
        whereArgs: [examId],
      );
    }
  }


  Future<bool> checkExamExists({
    required int sectionId,
    required int examTypeId,
    required int subjectId,
    required int classId,
  }) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.exams)
        ..where((e) => e.sectionId.equals(sectionId) &
            e.examTypeId.equals(examTypeId) &
            e.subjectId.equals(subjectId) &
            e.classId.equals(classId));
      final exams = await query.get();
      return exams.isNotEmpty;
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      final result = await db.query(
        'exams',
        where: 'sectionId = ? AND examTypeId = ? AND subjectId = ? AND classId = ?',
        whereArgs: [sectionId, examTypeId, subjectId, classId],
      );
      return result.isNotEmpty;
    }
  }

  Future<List<Map<String, Object?>>> getExamExists({
    required int id
  }) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.exams)..where((e) => e.id.equals(id));
      final exams = await query.get();
      return exams.map((e) => {
        'id': e.id,
        'sectionId': e.sectionId,
        'examTypeId': e.examTypeId,
        'subjectId': e.subjectId,
        'classId': e.classId,
        'marks': e.marks,
        'status': e.status,
      }).toList();
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      final result = await db.query(
        'exams',
        where: 'id = ?',
        whereArgs: [id],
      );
      return result;
    }
  }

  Future<int> insertSection(Map<String, dynamic> section) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.sections).insertOnConflictUpdate(
        SectionsCompanion(
          id: _toIntRequired(section['id']) != 0 ? Value(_toIntRequired(section['id'])) : const Value.absent(),
          name: Value(_toStrRequired(section['name'])),
          status: Value(_toIntRequired(section['status'])),
          createdAt: Value(_toStrRequired(section['created_at'])),
          updatedAt: Value(_toStrRequired(section['updated_at'])),
          sectionTran: Value(_toStrRequired(section['section_tran'])),
        ),
      );
      return _toIntRequired(section['id']);
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.insert('sections', section, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }


  Future<List<String>> getAllSections() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final sections = await driftDb.select(driftDb.sections).get();
      return sections.map((row) => row.name).toList();
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query('sections');
      return results.map((row) => row['name'].toString()).toList();
    }
  }

  Future<int> insertSubject(Map<String, dynamic> subject) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.subjects).insertOnConflictUpdate(
        SubjectsCompanion(
          id: _toIntRequired(subject['id']) != 0 ? Value(_toIntRequired(subject['id'])) : const Value.absent(),
          name: Value(_toStrRequired(subject['name'])),
          code: Value(_toStr(subject['code'])),
          type: Value(_toIntRequired(subject['type'])),
          status: Value(_toIntRequired(subject['status'])),
          createdAt: Value(_toStrRequired(subject['created_at'])),
          updatedAt: Value(_toStrRequired(subject['updated_at'])),
        ),
      );
      return _toIntRequired(subject['id']);
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.insert('subjects', subject, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<String>> getAllSubjects() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final subjects = await driftDb.select(driftDb.subjects).get();
      return subjects.map((row) => row.name).toList();
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query('subjects');
      return results.map((row) => row['name'].toString()).toList();
    }
  }

  Future<int?> getClassIdByName(String className) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.classes)..where((c) => c.name.equals(className));
      final classes = await query.get();
      return classes.isNotEmpty ? classes.first.id : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'classes',
        columns: ['id'],
        where: 'name = ?',
        whereArgs: [className],
      );
      if (results.isNotEmpty) {
        return results.first['id'] as int?;
      }
      return null;
    }
  }

  Future<int?> getSectionIdByName(String sectionName) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.sections)..where((s) => s.name.equals(sectionName));
      final sections = await query.get();
      return sections.isNotEmpty ? sections.first.id : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'sections',
        columns: ['id'],
        where: 'name = ?',
        whereArgs: [sectionName],
      );
      if (results.isNotEmpty) {
        return results.first['id'] as int?;
      }
      return null;
    }
  }

  Future<String> getSubjectNameById(String id) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final subjectId = int.tryParse(id);
      if (subjectId == null) return '';
      final query = driftDb.select(driftDb.subjects)..where((s) => s.id.equals(subjectId));
      final subjects = await query.get();
      return subjects.isNotEmpty ? subjects.first.name : '';
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'subjects',
        columns: ['name'],
        where: 'id = ?',
        whereArgs: [id],
      );
      if (results.isNotEmpty) {
        return results.first['name'];
      }
      return '';
    }
  }

  Future<String> getGradeNameByMarks(String marks) async {
    final double parsedMarks = double.tryParse(marks) ?? 0.0;
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final grades = await driftDb.select(driftDb.marksGrade).get();
      // Filter and sort manually since Drift doesn't support BETWEEN in where clause easily
      final matchingGrades = grades.where((g) => 
        parsedMarks >= g.percentFrom && parsedMarks <= g.percentUpto
      ).toList();
      matchingGrades.sort((a, b) => b.percentFrom.compareTo(a.percentFrom));
      return matchingGrades.isNotEmpty ? matchingGrades.first.name : 'No Grade';
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'marks_grade',
        columns: ['name'],
        where: '? BETWEEN percent_from AND percent_upto',
        whereArgs: [parsedMarks],
        orderBy: 'percent_from DESC',
        limit: 1,
      );
      if (results.isNotEmpty) {
        return _toStrRequired(results.first['name']);
      }
      return 'No Grade';
    }
  }

  Future<String> getClassNameById(String id) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final classId = int.tryParse(id);
      if (classId == null) return '';
      final query = driftDb.select(driftDb.classes)..where((c) => c.id.equals(classId));
      final classes = await query.get();
      return classes.isNotEmpty ? classes.first.name : '';
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'classes',
        columns: ['name'],
        where: 'id = ?',
        whereArgs: [id],
      );
      if (results.isNotEmpty) {
        return results.first['name'];
      }
      return '';
    }
  }

  Future<int?> getExamTypeIdByName(String sectionName) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.examTypes)..where((e) => e.name.equals(sectionName));
      final examTypes = await query.get();
      return examTypes.isNotEmpty ? examTypes.first.id : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'exam_types',
        columns: ['id'],
        where: 'name = ?',
        whereArgs: [sectionName],
      );
      if (results.isNotEmpty) {
        return results.first['id'] as int?;
      }
      return null;
    }
  }

  Future<int?> getSubjectIdByName(String sectionName) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.subjects)..where((s) => s.name.equals(sectionName));
      final subjects = await query.get();
      return subjects.isNotEmpty ? subjects.first.id : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'subjects',
        columns: ['id'],
        where: 'name = ?',
        whereArgs: [sectionName],
      );
      if (results.isNotEmpty) {
        return results.first['id'] as int?;
      }
      return null;
    }
  }



  Future<int> insertClasses(Map<String, dynamic> data) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.classes).insertOnConflictUpdate(
        ClassesCompanion(
          id: _toIntRequired(data['id']) != 0 ? Value(_toIntRequired(data['id'])) : const Value.absent(),
          name: Value(_toStrRequired(data['name'])),
          status: Value(_toIntRequired(data['status'])),
          orders: Value(_toIntRequired(data['orders'])),
          createdAt: Value(_toStrRequired(data['created_at'])),
          updatedAt: Value(_toStrRequired(data['updated_at'])),
          classTran: Value(_toStrRequired(data['class_tran'])),
        ),
      );
      return _toIntRequired(data['id']);
    } else {
      final db = await instance.database as Database;
      return await db.insert('classes', data, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }



  Future<List<String>> getAllClasses() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final classes = await driftDb.select(driftDb.classes).get();
      return classes.map((row) => row.name).toList();
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query('classes');
      return results.map((row) => row['name'].toString()).toList();
    }
  }

  Future<int> insertExamTypes(Map<String, dynamic> examTypes) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.examTypes).insertOnConflictUpdate(
        ExamTypesCompanion(
          id: _toIntRequired(examTypes['id']) != 0 ? Value(_toIntRequired(examTypes['id'])) : const Value.absent(),
          name: Value(_toStr(examTypes['name'])),
          type: Value(_toStr(examTypes['type'])),
          status: Value(_toInt(examTypes['status'])),
          createdAt: Value(_toStr(examTypes['created_at'])),
          updatedAt: Value(_toStr(examTypes['updated_at'])),
        ),
      );
      return _toIntRequired(examTypes['id']);
    } else {
      final db = await DatabaseHelper.instance.database as Database;
      return await db.insert('exam_types', examTypes, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }


  Future<List<String>> getExamTypes() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final examTypes = await driftDb.select(driftDb.examTypes).get();
      return examTypes.map((row) => row.name ?? '').where((name) => name.isNotEmpty).toList();
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query('exam_types');
      return results.map((row) => row['name'].toString()).toList();
    }
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.users).insertOnConflictUpdate(
        UsersCompanion(
          id: user['id'] != null && user['id'].toString().isNotEmpty ? Value(_toIntRequired(user['id'])) : const Value.absent(),
          name: Value(_toStrRequired(user['name'])),
          phone: Value(_toStr(user['phone'])),
          email: Value(_toStr(user['email'])),
          password: Value(_toStrRequired(user['password'])),
          status: Value(_toStrRequired(user['status'])),
          roleId: Value(_toStr(user['role_id'])),
        ),
      );
      return _toIntRequired(user['id']);
    } else {
      final db = await instance.database as Database;
      return await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<int> logOutUser() async {
    await clearFeesSummary();
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.delete(driftDb.feesAssignments).go();
      await driftDb.delete(driftDb.parentDetails).go();
      await driftDb.delete(driftDb.examTypes).go();
      await driftDb.delete(driftDb.transactions).go();
      await driftDb.delete(driftDb.classes).go();
      await driftDb.delete(driftDb.students).go();
      await driftDb.delete(driftDb.exams).go();
      await driftDb.delete(driftDb.staff).go();
      await driftDb.delete(driftDb.marksRegisterChildrens).go();
      return await driftDb.delete(driftDb.users).go();
    } else {
      final db = await instance.database as Database;
      await db.delete('fees_assignments');
      await db.delete('parent_details');
      await db.delete('exam_types');
      await db.delete('transactions');
      await db.delete('classes');
      await db.delete('students');
      await db.delete('exams');
      await db.delete('staff');
      await db.delete('marks_register_childrens');
      return await db.delete('users');
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final users = await driftDb.select(driftDb.users).get();
      return users.map((user) => {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'password': user.password,
        'status': user.status,
        'role_id': user.roleId,
      }).toList();
    } else {
      final db = await instance.database as Database;
      return await db.query('users');
    }
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final students = await driftDb.select(driftDb.students).get();
      return students.map((student) => {
        'id': student.id,
        'admission_no': student.admissionNo,
        'roll_no': student.rollNo,
        'first_name': student.firstName,
        'last_name': student.lastName,
        'mobile': student.mobile,
        'email': student.email,
        'dob': student.dob,
        'admission_date': student.admissionDate,
        'student_category_id': student.studentCategoryId,
        'religion_id': student.religionId,
        'blood_group_id': student.bloodGroupId,
        'gender_id': student.genderId,
        'category_id': student.categoryId,
        'image_id': student.imageId,
        'parent_guardian_id': student.parentGuardianId,
        'user_id': student.userId,
        'upload_documents': student.uploadDocuments,
        'status': student.status,
        'previous_school': student.previousSchool,
        'previous_school_info': student.previousSchoolInfo,
        'previous_school_image_id': student.previousSchoolImageId,
        'place_of_birth': student.placeOfBirth,
        'nationality': student.nationality,
        'cpr_no': student.cprNo,
        'spoken_lang_at_home': student.spokenLangAtHome,
        'residance_address': student.residanceAddress,
        'control_number': student.controlNumber,
        'created_at': student.createdAt,
        'updated_at': student.updatedAt,
        'full_name': student.fullName,
        'class_name': student.className,
        'section_name': student.sectionName,
        'available': student.available,
      }).toList();
    } else {
      final db = await instance.database as Database;
      return await db.query('students');
    }
  }

  Future<List<Map<String, dynamic>>> getStaff() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final staff = await driftDb.select(driftDb.staff).get();
      return staff.map((s) => {
        'id': s.id,
        'user_id': s.userId,
        'staff_id': s.staffId,
        'role_id': s.roleId,
        'designation_id': s.designationId,
        'department_id': s.departmentId,
        'first_name': s.firstName,
        'last_name': s.lastName,
        'email': s.email,
        'gender_id': s.genderId,
        'status': s.status,
        'created_at': s.createdAt,
        'updated_at': s.updatedAt,
      }).toList();
    } else {
      final db = await instance.database as Database;
      return await db.query('staff');
    }
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    List<Map<String, dynamic>> students = await getStudents();
    List<Map<String, dynamic>> result = [];
    if (students.isEmpty) return result;
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final studentId = students.first['id'] as int;
      // Use customSelect for raw SQL on web
      final query = driftDb.customSelect(
        '''
        SELECT 
          transactions.*, 
          students.full_name, 
          bank_accounts.account_number 
        FROM transactions
        INNER JOIN students ON students.id = transactions.student_id
        INNER JOIN bank_accounts ON bank_accounts.id = transactions.account_id
        WHERE transactions.student_id = ?
        ORDER BY transactions.id DESC
        ''',
        variables: [Variable.withInt(studentId)],
        readsFrom: {driftDb.transactions, driftDb.students, driftDb.bankAccounts},
      );
      final rows = await query.get();
      result = rows.map((row) => row.data).toList();
    } else {
      final db = await instance.database as Database;
      result = await db.rawQuery(
        '''
        SELECT 
          transactions.*, 
          students.full_name, 
          bank_accounts.account_number 
        FROM transactions
        INNER JOIN students ON students.id = transactions.student_id
        INNER JOIN bank_accounts ON bank_accounts.id = transactions.account_id
        WHERE transactions.student_id = ?
        ORDER BY transactions.id DESC
        ''',
        [students.first['id']]
      );
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getSchoolFees(int id) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT *, fees_type.name as fee_name 
        FROM fees_assignments
        INNER JOIN fees_masters ON fees_masters.id = fees_assignments.fees_master_id
        INNER JOIN fees_type ON fees_type.id = fees_masters.fees_type_id
        WHERE fees_assignments.student_id = ?
        ''',
        variables: [Variable.withInt(id)],
        readsFrom: {driftDb.feesAssignments, driftDb.feesMasters, driftDb.feesType},
      );
      final rows = await query.get();
      return rows.map((row) => row.data).toList();
    } else {
      final db = await instance.database as Database;
      List<Map<String, dynamic>> result = await db.rawQuery(
        '''
        SELECT *, fees_type.name as fee_name 
        FROM fees_assignments
        INNER JOIN fees_masters ON fees_masters.id = fees_assignments.fees_master_id
        INNER JOIN fees_type ON fees_type.id = fees_masters.fees_type_id
        WHERE fees_assignments.student_id = ?
        ''',
        [id]
      );
      return result;
    }
  }

  Future<Map<String, dynamic>?> getFirstStudent() async {
    List<Map<String, dynamic>> students = await getStudents();
    List<Map<String, dynamic>> users = await getUsers();

    if (students.isNotEmpty) {
      String remainedAmount = await getTotalFees(students.first['id'].toString()); // Await the async function

      return {
        'id': students.first['id'],
        'full_name': students.first['full_name'],
        'email': students.first['email'],
        'class_name': students.first['class_name'],
        'section_name': students.first['section_name'],
        'remained_amount':remainedAmount
      };
    }else if (users.isNotEmpty) {
      return {
        'id': users.first['id'],
        'full_name': users.first['name'],
        'email': users.first['email'],
        'class_name': '',
        'section_name': '',
        'remained_amount':'0'
      };
    }

    return null; // Return null if no users exist
  }

  Future<List<Map<String, dynamic>>> getStudentsWithDetails() async {
    List<Map<String, dynamic>> students = await getStudents();
    List<Map<String, dynamic>> users = await getUsers();
    List<Map<String, dynamic>> result = [];

    if (students.isNotEmpty) {
      for (var student in students) {
        String remainedAmount = await getTotalFees(student['id'].toString()); // You may want to customize this per student later
        result.add({
          'id': student['id'].toString(),
          'full_name': student['full_name'],
          'first_name': student['first_name'],
          'email': student['email' ],
          'class_name': student['class_name'],
          'section_name': student['section_name'],
          'remained_amount': remainedAmount.toString(),
        });
      }
    } else if (users.isNotEmpty) {
      for (var user in users) {
        result.add({
          'id': user['id'],
          'full_name': user['name'],
          'email': user['email'],
          'first_name': '',
          'class_name': '',
          'section_name': '',
          'remained_amount': '0',
        });
      }
    }

    return result;
  }

  Future<Map<String, dynamic>?> getFirstUser() async {
    List<Map<String, dynamic>> users = await getUsers();

    if (users.isNotEmpty) {
      return {
        'id': users.first['id'],
        'email': users.first['email'],
        'status': users.first['status'],
        'name': users.first['name'],
        'phone': users.first['phone'],
      };
    }

    return null; // Return null if no users exist
  }
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.users)..where((u) => u.email.equals(email));
      final users = await query.get();
      if (users.isEmpty) return null;
      final user = users.first;
      return {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'password': user.password,
        'status': user.status,
        'role_id': user.roleId,
      };
    } else {
      final db = await instance.database as Database;
      final result = await db.query('users', where: 'email = ?', whereArgs: [email]);
      return result.isNotEmpty ? result.first : null;
    }
  }


  Future<int> insertStudent(Map<String, dynamic> student) async {
    try {
      if (kIsWeb) {
        final driftDb = _driftDatabase ??= AppDatabase();
        await driftDb.into(driftDb.students).insertOnConflictUpdate(
          StudentsCompanion(
            id: student['id'] != null && student['id'].toString().isNotEmpty ? Value(_toIntRequired(student['id'])) : const Value.absent(),
            admissionNo: Value(_toStr(student['admission_no'])),
            rollNo: Value(_toStr(student['roll_no'])),
            firstName: Value(_toStr(student['first_name'])),
            lastName: Value(_toStr(student['last_name'])),
            mobile: Value(_toStr(student['mobile'])),
            email: Value(_toStr(student['email'])),
            dob: Value(_toStr(student['dob'])),
            admissionDate: Value(_toStr(student['admission_date'])),
            studentCategoryId: Value(_toInt(student['student_category_id'])),
            religionId: Value(_toInt(student['religion_id'])),
            bloodGroupId: Value(_toInt(student['blood_group_id'])),
            genderId: Value(_toInt(student['gender_id'])),
            categoryId: Value(_toInt(student['category_id'])),
            imageId: Value(_toInt(student['image_id'])),
            parentGuardianId: Value(_toInt(student['parent_guardian_id'])),
            userId: Value(_toInt(student['user_id'])),
            uploadDocuments: Value(_toStr(student['upload_documents'])),
            status: Value(_toInt(student['status'])),
            previousSchool: Value(_toInt(student['previous_school'])),
            previousSchoolInfo: Value(_toStr(student['previous_school_info'])),
            previousSchoolImageId: Value(_toInt(student['previous_school_image_id'])),
            placeOfBirth: Value(_toStr(student['place_of_birth'])),
            nationality: Value(_toStr(student['nationality'])),
            cprNo: Value(_toStr(student['cpr_no'])),
            spokenLangAtHome: Value(_toStr(student['spoken_lang_at_home'])),
            residanceAddress: Value(_toStr(student['residance_address'])),
            controlNumber: Value(_toStr(student['control_number'])),
            createdAt: Value(_toStr(student['created_at'])),
            updatedAt: Value(_toStr(student['updated_at'])),
            fullName: Value(_toStr(student['full_name'])),
            className: Value(_toStr(student['class_name'])),
            sectionName: Value(_toStr(student['section_name'])),
            available: Value(_toStr(student['available'])),
          ),
        );
        return _toIntRequired(student['id']);
      } else {
        Map<String, String> stringStudent = student.map((key, value) => MapEntry(key, value?.toString() ?? ''));
        final db = await instance.database as Database;
        return await db.insert(
          'students',
          stringStudent,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (e) {
      print('Error inserting student: $e');
      return -1;
    }
  }

  Future<int> insertParent(Map<String, dynamic> parent) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await driftDb.into(driftDb.parentDetails).insertOnConflictUpdate(
        ParentDetailsCompanion(
          id: _toInt(parent['id']) != null ? Value(_toIntRequired(parent['id'])) : const Value.absent(),
          userId: Value(_toIntRequired(parent['user_id'])),
          fatherName: Value(_toStr(parent['father_name'])),
          fatherMobile: Value(_toStr(parent['father_mobile'])),
          fatherProfession: Value(_toStr(parent['father_profession'])),
          fatherImage: Value(_toStr(parent['father_image'])),
          fatherNationality: Value(_toStr(parent['father_nationality'])),
          motherName: Value(_toStr(parent['mother_name'])),
          motherMobile: Value(_toStr(parent['mother_mobile'])),
          motherProfession: Value(_toStr(parent['mother_profession'])),
          motherImage: Value(_toStr(parent['mother_image'])),
          guardianName: Value(_toStr(parent['guardian_name'])),
          guardianEmail: Value(_toStr(parent['guardian_email'])),
          guardianMobile: Value(_toStr(parent['guardian_mobile'])),
          guardianImage: Value(_toStr(parent['guardian_image'])),
          guardianProfession: Value(_toStr(parent['guardian_profession'])),
          guardianRelation: Value(_toStr(parent['guardian_relation'])),
          guardianAddress: Value(_toStr(parent['guardian_address'])),
          status: Value(_toInt(parent['status']) ?? 1),
          createdAt: Value(_toStr(parent['created_at'])),
          updatedAt: Value(_toStr(parent['updated_at'])),
        ),
      );
      return _toIntRequired(parent['id']);
    } else {
      final db = await instance.database as Database;
      return await db.insert('parent_details', parent, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<int> insertFeesAssignment(Map<String, dynamic> data) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      // Delete existing if exists
      if (data['id'] != null) {
        await (driftDb.delete(driftDb.feesAssignments)
          ..where((f) => f.id.equals(_toIntRequired(data['id'])))).go();
      }
      // Insert new
      await driftDb.into(driftDb.feesAssignments).insertOnConflictUpdate(
        FeesAssignmentsCompanion(
          id: _toInt(data['id']) != null ? Value(_toIntRequired(data['id'])) : const Value.absent(),
          feesAssignId: Value(_toIntRequired(data['fees_assign_id'])),
          feesMasterId: Value(_toIntRequired(data['fees_master_id'])),
          studentId: Value(_toIntRequired(data['student_id'])),
          controlNumber: Value(_toStrRequired(data['control_number'])),
          feesAmount: Value(_toStr(data['fees_amount']) ?? '0'),
          paidAmount: Value(_toStr(data['paid_amount']) ?? '0'),
          remainedAmount: Value(_toStr(data['remained_amount']) ?? '0'),
          quaterAmount: Value(_toStr(data['quater_amount'])),
          quaterOne: Value(_toInt(data['quater_one'])),
          quaterTwo: Value(_toInt(data['quater_two'])),
          quaterThree: Value(_toInt(data['quater_three'])),
          quaterFour: Value(_toInt(data['quater_four'])),
          comment: Value(_toStr(data['comment'])),
          outstandingbalance: Value(_toStr(data['outstandingbalance'])),
          feeGroup: Value(_toStr(data['fee_group'])),
          updated: Value(_toStr(data['updated'])),
          createdAt: Value(_toStr(data['created_at'])),
          updatedAt: Value(_toStr(data['updated_at'])),
        ),
      );
      return _toIntRequired(data['id']);
    } else {
      final db = await instance.database as Database;
      await db.delete(
        'fees_assignments',
        where: 'id = ?',
        whereArgs: [data['id']],
      );
      return await db.insert('fees_assignments', data);
    }
  }
  Future<int> insertFeesAssignChildren(Map<String, dynamic> data) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      // Delete existing if exists
      if (data['id'] != null) {
        await (driftDb.delete(driftDb.feesAssignChildren)
          ..where((f) => f.id.equals(_toIntRequired(data['id'])))).go();
      }
      // Insert new
      await driftDb.into(driftDb.feesAssignChildren).insertOnConflictUpdate(
        FeesAssignChildrenCompanion(
          id: _toInt(data['id']) != null ? Value(_toIntRequired(data['id'])) : const Value.absent(),
          feesAssignId: Value(_toIntRequired(data['fees_assign_id'])),
          feesMasterId: Value(_toIntRequired(data['fees_master_id'])),
          studentId: Value(_toIntRequired(data['student_id'])),
          controlNumber: Value(_toStrRequired(data['control_number'])),
          feesAmount: Value(_toStr(data['fees_amount']) ?? '0'),
          paidAmount: Value(_toStr(data['paid_amount']) ?? '0'),
          remainedAmount: Value(_toStr(data['remained_amount']) ?? '0'),
          quaterAmount: Value(_toStr(data['quater_amount'])),
          quaterOne: Value(_toInt(data['quater_one'])),
          quaterTwo: Value(_toInt(data['quater_two'])),
          quaterThree: Value(_toInt(data['quater_three'])),
          quaterFour: Value(_toInt(data['quater_four'])),
          comment: Value(_toStr(data['comment'])),
          outstandingbalance: Value(_toStr(data['outstandingbalance'])),
          feeGroup: Value(_toStr(data['fee_group'])),
          updated: Value(_toStr(data['updated'])),
          createdAt: Value(_toStr(data['created_at'])),
          updatedAt: Value(_toStr(data['updated_at'])),
        ),
      );
      return _toIntRequired(data['id']);
    } else {
      final db = await instance.database as Database;
      await db.delete(
        'fees_assign_children',
        where: 'id = ?',
        whereArgs: [data['id']],
      );
      return await db.insert('fees_assign_children', data);
    }
  }

  Future<Map<String, dynamic>?> getStudentById(int id) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT students.*, parent_details.guardian_mobile, parent_details.guardian_name, 
               parent_details.guardian_email, sections.id as section_id
        FROM students
        INNER JOIN parent_details ON parent_details.id = students.parent_guardian_id
        INNER JOIN sections ON sections.name = students.section_name
        WHERE students.id = ?
        ''',
        variables: [Variable.withInt(id)],
        readsFrom: {driftDb.students, driftDb.parentDetails, driftDb.sections},
      );
      final rows = await query.get();
      return rows.isNotEmpty ? rows.first.data : null;
    } else {
      final db = await instance.database as Database;
      final result = await db.rawQuery(
        '''
        SELECT students.*, parent_details.guardian_mobile, parent_details.guardian_name,
               parent_details.guardian_email, sections.id as section_id
        FROM students
        INNER JOIN parent_details ON parent_details.id = students.parent_guardian_id
        INNER JOIN sections ON sections.name = students.section_name
        WHERE students.id = ?
        ''',
        [id]
      );
      return result.isNotEmpty ? result.first : null;
    }
  }
  static const String _feesSummaryKey = 'fees_summary';

  /// Stores the server-computed balances (same figures as the web receipt), keyed by student id.
  Future<void> saveFeesSummary(dynamic summaries) async {
    if (summaries is! List) return;
    final Map<String, dynamic> byStudent = {};
    for (final item in summaries) {
      if (item is Map && item['student_id'] != null) {
        byStudent[item['student_id'].toString()] = item;
      }
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_feesSummaryKey, jsonEncode(byStudent));
  }

  Future<Map<String, dynamic>?> getFeesSummary(String studentId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_feesSummaryKey);
    if (raw == null) return null;
    try {
      final decoded = jsonDecode(raw);
      final entry = decoded is Map ? decoded[studentId] : null;
      return entry is Map ? Map<String, dynamic>.from(entry) : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> clearFeesSummary() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_feesSummaryKey);
  }

  /// Drops cached fee rows for the given students so rows from past sessions/years don't linger.
  Future<void> deleteFeesAssignmentsForStudents(Iterable<dynamic> studentIds) async {
    final ids = studentIds
        .map((id) => int.tryParse(id.toString()))
        .whereType<int>()
        .toSet()
        .toList();
    if (ids.isEmpty) return;

    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      await (driftDb.delete(driftDb.feesAssignments)
        ..where((f) => f.studentId.isIn(ids))).go();
    } else {
      final db = await instance.database as Database;
      final placeholders = List.filled(ids.length, '?').join(',');
      await db.delete(
        'fees_assignments',
        where: 'student_id IN ($placeholders)',
        whereArgs: ids,
      );
    }
  }

  /// Fees balance shown in the app. Prefers the server summary so it matches the web receipt.
  Future<String> getTotalFees(String studentId) async {
    final summary = await getFeesSummary(studentId);
    if (summary != null && summary['balance_remaining'] != null) {
      return summary['balance_remaining'].toString();
    }

    final studentIdInt = int.tryParse(studentId) ?? 0;
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        "SELECT SUM(CAST(remained_amount AS REAL)) as total FROM fees_assignments WHERE student_id = ?",
        variables: [Variable.withInt(studentIdInt)],
        readsFrom: {driftDb.feesAssignments},
      );
      final rows = await query.get();
      final total = rows.isNotEmpty && rows.first.data['total'] != null
          ? rows.first.data['total'].toString()
          : "0.0";
      print(total);
      return total;
    } else {
      final db = await instance.database as Database;
      List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT SUM(remained_amount) as total FROM fees_assignments WHERE student_id = ?",
        [studentId],
      );
      String total = result.first["total"] != null
          ? result.first["total"].toString()
          : "0.0";
      print(total);
      return total;
    }
  }
  Future<Map<String, dynamic>?> getFeesDetails(int id) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.feesAssignments)..where((f) => f.id.equals(id));
      final fees = await query.get();
      if (fees.isEmpty) return null;
      final fee = fees.first;
      return {
        'id': fee.id,
        'fees_assign_id': fee.feesAssignId,
        'fees_master_id': fee.feesMasterId,
        'student_id': fee.studentId,
        'control_number': fee.controlNumber,
        'fees_amount': fee.feesAmount,
        'paid_amount': fee.paidAmount,
        'remained_amount': fee.remainedAmount,
        'quater_amount': fee.quaterAmount,
        'quater_one': fee.quaterOne,
        'quater_two': fee.quaterTwo,
        'quater_three': fee.quaterThree,
        'quater_four': fee.quaterFour,
        'comment': fee.comment,
        'outstandingbalance': fee.outstandingbalance,
        'fee_group': fee.feeGroup,
        'updated': fee.updated,
        'created_at': fee.createdAt,
        'updated_at': fee.updatedAt,
      };
    } else {
      final db = await instance.database as Database;
      final result = await db.query('fees_assignments', where: 'id = ?', whereArgs: [id]);
      return result.isNotEmpty ? result.first : null;
    }
  }

  // Function to update user status by ID
  Future<int> updateUserStatus(int userId) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.update(driftDb.users)..where((u) => u.id.equals(userId));
      await query.write(UsersCompanion(status: Value('2')));
      return 1;
    } else {
      final db = await database as Database;
      return await db.update(
        'users',
        {'status': 2},
        where: 'id = ?',
        whereArgs: [userId],
      );
    }
  }

  Future<List<exam_screen.Exam>> getExams() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               subjects.name as subject_name, sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        INNER JOIN subjects ON exams.subjectId = subjects.id
        ''',
        readsFrom: {driftDb.exams, driftDb.examTypes, driftDb.classes, driftDb.sections, driftDb.subjects},
      );
      final rows = await query.get();
      final maps = rows.map((row) => row.data).toList();
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               subjects.name as subject_name, sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        INNER JOIN subjects ON exams.subjectId = subjects.id
        '''
      );
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    }
  }


  Future<List<exam_screen.Exam>> getExamsTypes() async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        GROUP BY exams.sectionId
        ''',
        readsFrom: {driftDb.exams, driftDb.examTypes, driftDb.classes, driftDb.sections},
      );
      final rows = await query.get();
      final maps = rows.map((row) => row.data).toList();
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        GROUP BY exams.sectionId
        '''
      );
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    }
  }


  Future<List<exam_screen.Exam>> getExamsTypesWithStudentId(String student_id) async {
    final studentid = int.tryParse(student_id);
    if (studentid == null) {
      return [];
    }

    final student = await getStudentById(studentid);
    final sectionId = student?['section_id'] as int?;
    if (sectionId == null) {
      return [];
    }

    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        WHERE sections.id = ?
        GROUP BY exams.sectionId
        ''',
        variables: [Variable.withInt(sectionId)],
        readsFrom: {driftDb.exams, driftDb.examTypes, driftDb.classes, driftDb.sections},
      );
      final rows = await query.get();
      final maps = rows.map((row) => row.data).toList();
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''
        SELECT exams.*, exam_types.name AS examTypeName, classes.name AS class_name,
               sections.name as section_name
        FROM exams 
        INNER JOIN exam_types ON exams.examTypeId = exam_types.id
        INNER JOIN classes ON exams.classId = classes.id
        INNER JOIN sections ON exams.sectionId = sections.id
        WHERE sections.id = ?
        GROUP BY exams.sectionId
        ''',
        [sectionId],
      );
      return List.generate(maps.length, (i) {
        return exam_screen.Exam.fromMap(maps[i]);
      });
    }
  }


  // Fetch control number from students table by student ID
  Future<String?> getControlNumberByStudentId(String studentId) async {
    final studentIdInt = int.tryParse(studentId);
    if (studentIdInt == null) return null;
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.select(driftDb.students)..where((s) => s.id.equals(studentIdInt));
      final students = await query.get();
      return students.isNotEmpty ? students.first.controlNumber : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> results = await db.query(
        'students',
        columns: ['control_number'],
        where: 'id = ?',
        whereArgs: [studentId],
      );
      if (results.isNotEmpty) {
        return _toStr(results.first['control_number']);
      }
      return null;
    }
  }

  // Fetch unique fees group for a given student from joined tables
  Future<List<Map<String, dynamic>>> getFeesGroupsForStudent(String studentId) async {
    final studentIdInt = int.tryParse(studentId) ?? 0;
    
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT DISTINCT fees_assignments.id, fees_groups.name
        FROM fees_assignments
        INNER JOIN fees_masters ON fees_assignments.fees_master_id = fees_masters.id
        INNER JOIN fees_groups ON fees_masters.fees_group_id = fees_groups.id
        WHERE fees_assignments.student_id = ?
        ORDER BY fees_groups.name
        ''',
        variables: [Variable.withInt(studentIdInt)],
        readsFrom: {driftDb.feesAssignments, driftDb.feesMasters, driftDb.feesGroups},
      );
      final rows = await query.get();
      return rows.map((row) => row.data).toList();
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> result = await db.rawQuery(
        '''
        SELECT DISTINCT fees_assignments.id, fees_groups.name
        FROM fees_assignments
        INNER JOIN fees_masters ON fees_assignments.fees_master_id = fees_masters.id
        INNER JOIN fees_groups ON fees_masters.fees_group_id = fees_groups.id
        WHERE fees_assignments.student_id = ?
        ORDER BY fees_groups.name
        ''',
        [studentId]
      );
      return result;
    }
  }

  // Fetch a transaction and related info by transaction_id
  Future<Map<String, dynamic>?> getTransactionById(String transactionId) async {
    if (kIsWeb) {
      final driftDb = _driftDatabase ??= AppDatabase();
      final query = driftDb.customSelect(
        '''
        SELECT t.*, s.full_name, b.account_number 
        FROM transactions t 
        LEFT JOIN students s ON s.id = t.student_id 
        LEFT JOIN bank_accounts b ON b.id = t.account_id 
        WHERE t.transaction_id = ?
        LIMIT 1
        ''',
        variables: [Variable.withString(transactionId)],
        readsFrom: {driftDb.transactions, driftDb.students, driftDb.bankAccounts},
      );
      final rows = await query.get();
      return rows.isNotEmpty ? rows.first.data : null;
    } else {
      final db = await instance.database as Database;
      final List<Map<String, dynamic>> result = await db.rawQuery(
        '''
        SELECT t.*, s.full_name, b.account_number 
        FROM transactions t 
        LEFT JOIN students s ON s.id = t.student_id 
        LEFT JOIN bank_accounts b ON b.id = t.account_id 
        WHERE t.transaction_id = ?
        LIMIT 1
        ''',
        [transactionId]
      );
      return result.isNotEmpty ? result.first : null;
    }
  }

}
