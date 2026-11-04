import 'package:drift/drift.dart';
import 'drift_database_connection.dart';
import 'offline_scan_tables.dart';

part 'drift_database.g.dart';

// Fees Groups table
class FeesGroups extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get dashboardOrder => text().named('dashboard_order').nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get status => integer().nullable()();
  IntColumn get onlineAdmissionFees => integer().named('online_admission_fees').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Users table
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get password => text()();
  TextColumn get status => text()();
  TextColumn get roleId => text().named('role_id').nullable()();
}

// Students table
class Students extends Table {
  IntColumn get id => integer()();
  TextColumn get admissionNo => text().named('admission_no').nullable()();
  TextColumn get rollNo => text().named('roll_no').nullable()();
  TextColumn get firstName => text().named('first_name').nullable()();
  TextColumn get lastName => text().named('last_name').nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get dob => text().nullable()();
  TextColumn get admissionDate => text().named('admission_date').nullable()();
  IntColumn get studentCategoryId => integer().named('student_category_id').nullable()();
  IntColumn get religionId => integer().named('religion_id').nullable()();
  IntColumn get bloodGroupId => integer().named('blood_group_id').nullable()();
  IntColumn get genderId => integer().named('gender_id').nullable()();
  IntColumn get categoryId => integer().named('category_id').nullable()();
  IntColumn get imageId => integer().named('image_id').nullable()();
  IntColumn get parentGuardianId => integer().named('parent_guardian_id').nullable()();
  IntColumn get userId => integer().named('user_id').nullable()();
  TextColumn get uploadDocuments => text().named('upload_documents').nullable()();
  IntColumn get status => integer().nullable()();
  IntColumn get previousSchool => integer().named('previous_school').nullable()();
  TextColumn get previousSchoolInfo => text().named('previous_school_info').nullable()();
  IntColumn get previousSchoolImageId => integer().named('previous_school_image_id').nullable()();
  TextColumn get placeOfBirth => text().named('place_of_birth').nullable()();
  TextColumn get nationality => text().nullable()();
  TextColumn get cprNo => text().named('cpr_no').nullable()();
  TextColumn get spokenLangAtHome => text().named('spoken_lang_at_home').nullable()();
  TextColumn get residanceAddress => text().named('residance_address').nullable()();
  TextColumn get controlNumber => text().named('control_number').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
  TextColumn get fullName => text().named('full_name').nullable()();
  TextColumn get className => text().named('class_name').nullable()();
  TextColumn get sectionName => text().named('section_name').nullable()();
  TextColumn get available => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Fees Assignments table
class FeesAssignments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get feesAssignId => integer().named('fees_assign_id')();
  IntColumn get feesMasterId => integer().named('fees_master_id')();
  IntColumn get studentId => integer().named('student_id')();
  TextColumn get controlNumber => text().named('control_number')();
  TextColumn get feesAmount => text().named('fees_amount').withDefault(const Constant('0'))();
  TextColumn get paidAmount => text().named('paid_amount').withDefault(const Constant('0'))();
  TextColumn get remainedAmount => text().named('remained_amount').withDefault(const Constant('0'))();
  TextColumn get quaterAmount => text().named('quater_amount').nullable()();
  IntColumn get quaterOne => integer().named('quater_one').nullable()();
  IntColumn get quaterTwo => integer().named('quater_two').nullable()();
  IntColumn get quaterThree => integer().named('quater_three').nullable()();
  IntColumn get quaterFour => integer().named('quater_four').nullable()();
  TextColumn get comment => text().nullable()();
  TextColumn get outstandingbalance => text().nullable()();
  TextColumn get feeGroup => text().named('fee_group').nullable()();
  TextColumn get updated => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
}

// Fees Assign Children table
class FeesAssignChildren extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get feesAssignId => integer().named('fees_assign_id')();
  IntColumn get feesMasterId => integer().named('fees_master_id')();
  IntColumn get studentId => integer().named('student_id')();
  TextColumn get controlNumber => text().named('control_number')();
  TextColumn get feesAmount => text().named('fees_amount').withDefault(const Constant('0'))();
  TextColumn get paidAmount => text().named('paid_amount').withDefault(const Constant('0'))();
  TextColumn get remainedAmount => text().named('remained_amount').withDefault(const Constant('0'))();
  TextColumn get quaterAmount => text().named('quater_amount').nullable()();
  IntColumn get quaterOne => integer().named('quater_one').nullable()();
  IntColumn get quaterTwo => integer().named('quater_two').nullable()();
  IntColumn get quaterThree => integer().named('quater_three').nullable()();
  IntColumn get quaterFour => integer().named('quater_four').nullable()();
  TextColumn get comment => text().nullable()();
  TextColumn get outstandingbalance => text().nullable()();
  TextColumn get feeGroup => text().named('fee_group').nullable()();
  TextColumn get updated => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
}

// Exam Types table
class ExamTypes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get status => integer().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Classes table
class Classes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get status => integer()();
  IntColumn get orders => integer()();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  TextColumn get classTran => text().named('class_tran')();

  @override
  Set<Column> get primaryKey => {id};
}

// Subjects table
class Subjects extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get code => text().nullable()();
  IntColumn get type => integer()();
  IntColumn get status => integer()();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};
}

// Sections table
class Sections extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get status => integer()();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  TextColumn get sectionTran => text().named('section_tran')();

  @override
  Set<Column> get primaryKey => {id};
}

// Exams table
class Exams extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sectionId => integer().named('sectionId')();
  IntColumn get examTypeId => integer().named('examTypeId')();
  IntColumn get subjectId => integer().named('subjectId')();
  IntColumn get classId => integer().named('classId')();
  TextColumn get marks => text().nullable()();
  IntColumn get status => integer().nullable()();
}

// Marks Register Childrens table
class MarksRegisterChildrens extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get marksRegisterId => integer().named('marks_register_id')();
  IntColumn get studentId => integer().named('student_id')();
  TextColumn get title => text()();
  IntColumn get mark => integer()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
}

// Fees Masters table
class FeesMasters extends Table {
  IntColumn get id => integer()();
  IntColumn get sessionId => integer().named('session_id').nullable()();
  IntColumn get feesGroupId => integer().named('fees_group_id').nullable()();
  IntColumn get feesTypeId => integer().named('fees_type_id').nullable()();
  TextColumn get dueDate => text().named('due_date').nullable()();
  TextColumn get amount => text().nullable()();
  IntColumn get fineType => integer().named('fine_type').nullable()();
  IntColumn get percentage => integer().nullable()();
  TextColumn get fineAmount => text().named('fine_amount').nullable()();
  IntColumn get status => integer().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Fees Type table
class FeesType extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get status => integer().nullable()();
  IntColumn get classId => integer().named('class_id').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Transactions table
class Transactions extends Table {
  IntColumn get id => integer()();
  TextColumn get date => text().nullable()();
  IntColumn get paymentMethod => integer().named('payment_method').nullable()();
  TextColumn get paymentGateway => text().named('payment_gateway').nullable()();
  TextColumn get transactionId => text().named('transaction_id').nullable()();
  IntColumn get feesAssignChildrenId => integer().named('fees_assign_children_id').nullable()();
  IntColumn get feesCollectBy => integer().named('fees_collect_by').nullable()();
  IntColumn get studentId => integer().named('student_id').nullable()();
  IntColumn get sessionId => integer().named('session_id').nullable()();
  TextColumn get amount => text().nullable()();
  TextColumn get fineAmount => text().named('fine_amount').nullable()();
  IntColumn get accountId => integer().named('account_id').nullable()();
  TextColumn get comments => text().nullable()();
  IntColumn get printed => integer().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Bank Accounts table
class BankAccounts extends Table {
  IntColumn get id => integer()();
  TextColumn get bankName => text().named('bank_name')();
  TextColumn get accountName => text().named('account_name')();
  TextColumn get accountNumber => text().named('account_number')();
  TextColumn get accountType => text().named('account_type').nullable()();
  TextColumn get status => text().withDefault(const Constant('1'))();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Subject Assign Childrens table
class SubjectAssignChildrens extends Table {
  IntColumn get id => integer()();
  TextColumn get subjectAssignId => text().named('subject_assign_id')();
  TextColumn get subjectId => text().named('subject_id')();
  TextColumn get staffId => text().named('staff_id')();
  TextColumn get status => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Subject Assigns table
class SubjectAssigns extends Table {
  IntColumn get id => integer()();
  TextColumn get sessionId => text().named('session_id')();
  TextColumn get classesId => text().named('classes_id')();
  TextColumn get sectionId => text().named('section_id')();
  TextColumn get status => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Staff table
class Staff extends Table {
  IntColumn get id => integer()();
  TextColumn get userId => text().named('user_id')();
  TextColumn get staffId => text().named('staff_id')();
  TextColumn get roleId => text().named('role_id')();
  TextColumn get designationId => text().named('designation_id')();
  TextColumn get departmentId => text().named('department_id')();
  TextColumn get firstName => text().named('first_name').nullable()();
  TextColumn get lastName => text().named('last_name').nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get genderId => text().named('gender_id').nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Marks Grade table
class MarksGrade extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get percentFrom => real().named('percent_from')();
  RealColumn get percentUpto => real().named('percent_upto')();
  IntColumn get point => integer()();
  TextColumn get remarks => text().nullable()();
  IntColumn get sessionId => integer().named('session_id')();
  IntColumn get status => integer().withDefault(const Constant(1))();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
}

// Parent Details table
class ParentDetails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().named('user_id')();
  TextColumn get fatherName => text().named('father_name').nullable()();
  TextColumn get fatherMobile => text().named('father_mobile').nullable()();
  TextColumn get fatherProfession => text().named('father_profession').nullable()();
  TextColumn get fatherImage => text().named('father_image').nullable()();
  TextColumn get fatherNationality => text().named('father_nationality').nullable()();
  TextColumn get motherName => text().named('mother_name').nullable()();
  TextColumn get motherMobile => text().named('mother_mobile').nullable()();
  TextColumn get motherProfession => text().named('mother_profession').nullable()();
  TextColumn get motherImage => text().named('mother_image').nullable()();
  TextColumn get guardianName => text().named('guardian_name').nullable()();
  TextColumn get guardianEmail => text().named('guardian_email').nullable()();
  TextColumn get guardianMobile => text().named('guardian_mobile').nullable()();
  TextColumn get guardianImage => text().named('guardian_image').nullable()();
  TextColumn get guardianProfession => text().named('guardian_profession').nullable()();
  TextColumn get guardianRelation => text().named('guardian_relation').nullable()();
  TextColumn get guardianAddress => text().named('guardian_address').nullable()();
  IntColumn get status => integer().withDefault(const Constant(1))();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();
}

// Notice Boards table
class NoticeBoards extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get publishDate => text().named('publish_date').nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get attachment => text().nullable()();
  IntColumn get isVisibleWeb => integer().named('is_visible_web').nullable()();
  IntColumn get status => integer().nullable()();
  TextColumn get visibleTo => text().named('visible_to').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Students List table
class StudentsList extends Table {
  IntColumn get id => integer()();
  TextColumn get admissionNo => text().named('admission_no').nullable()();
  IntColumn get rollNo => integer().named('roll_no').nullable()();
  TextColumn get firstName => text().named('first_name').nullable()();
  TextColumn get lastName => text().named('last_name').nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get dob => text().nullable()();
  TextColumn get admissionDate => text().named('admission_date').nullable()();
  IntColumn get studentCategoryId => integer().named('student_category_id').nullable()();
  IntColumn get religionId => integer().named('religion_id').nullable()();
  IntColumn get bloodGroupId => integer().named('blood_group_id').nullable()();
  IntColumn get genderId => integer().named('gender_id').nullable()();
  IntColumn get categoryId => integer().named('category_id').nullable()();
  IntColumn get imageId => integer().named('image_id').nullable()();
  IntColumn get parentGuardianId => integer().named('parent_guardian_id').nullable()();
  IntColumn get userId => integer().named('user_id').nullable()();
  TextColumn get uploadDocuments => text().named('upload_documents').nullable()();
  IntColumn get status => integer().nullable()();
  IntColumn get previousSchool => integer().named('previous_school').nullable()();
  TextColumn get previousSchoolInfo => text().named('previous_school_info').nullable()();
  IntColumn get previousSchoolImageId => integer().named('previous_school_image_id').nullable()();
  TextColumn get placeOfBirth => text().named('place_of_birth').nullable()();
  TextColumn get nationality => text().nullable()();
  TextColumn get cprNo => text().named('cpr_no').nullable()();
  TextColumn get spokenLangAtHome => text().named('spoken_lang_at_home').nullable()();
  TextColumn get residanceAddress => text().named('residance_address').nullable()();
  TextColumn get controlNumber => text().named('control_number').nullable()();
  TextColumn get available => text().nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  FeesGroups,
  Users,
  Students,
  FeesAssignments,
  FeesAssignChildren,
  ExamTypes,
  Classes,
  Subjects,
  Sections,
  Exams,
  MarksRegisterChildrens,
  FeesMasters,
  FeesType,
  Transactions,
  BankAccounts,
  SubjectAssignChildrens,
  SubjectAssigns,
  Staff,
  MarksGrade,
  ParentDetails,
  NoticeBoards,
  StudentsList,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(createDriftConnection());

  @override
  int get schemaVersion => 4;

  Future<void> createOfflineScanTables() async {
    await customStatement(OfflineScanTables.students);
    await customStatement(OfflineScanTables.scans);
    await customStatement(OfflineScanTables.controlIndex);
    await OfflineScanTables.addMissingColumns(
      columnsOf: (table) async {
        final rows = await customSelect('PRAGMA table_info($table)').get();
        return rows.map((row) => row.data['name'].toString()).toList();
      },
      execute: customStatement,
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await createOfflineScanTables();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 4) {
          await createOfflineScanTables();
        }
      },
      beforeOpen: (_) async {
        await createOfflineScanTables();
      },
    );
  }
}

