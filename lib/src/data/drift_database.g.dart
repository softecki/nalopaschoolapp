// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $FeesGroupsTable extends FeesGroups
    with TableInfo<$FeesGroupsTable, FeesGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dashboardOrderMeta =
      const VerificationMeta('dashboardOrder');
  @override
  late final GeneratedColumn<String> dashboardOrder = GeneratedColumn<String>(
      'dashboard_order', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _onlineAdmissionFeesMeta =
      const VerificationMeta('onlineAdmissionFees');
  @override
  late final GeneratedColumn<int> onlineAdmissionFees = GeneratedColumn<int>(
      'online_admission_fees', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        dashboardOrder,
        description,
        status,
        onlineAdmissionFees,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees_groups';
  @override
  VerificationContext validateIntegrity(Insertable<FeesGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('dashboard_order')) {
      context.handle(
          _dashboardOrderMeta,
          dashboardOrder.isAcceptableOrUnknown(
              data['dashboard_order']!, _dashboardOrderMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('online_admission_fees')) {
      context.handle(
          _onlineAdmissionFeesMeta,
          onlineAdmissionFees.isAcceptableOrUnknown(
              data['online_admission_fees']!, _onlineAdmissionFeesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      dashboardOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dashboard_order']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      onlineAdmissionFees: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}online_admission_fees']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $FeesGroupsTable createAlias(String alias) {
    return $FeesGroupsTable(attachedDatabase, alias);
  }
}

class FeesGroup extends DataClass implements Insertable<FeesGroup> {
  final int id;
  final String? name;
  final String? dashboardOrder;
  final String? description;
  final int? status;
  final int? onlineAdmissionFees;
  final String? createdAt;
  final String? updatedAt;
  const FeesGroup(
      {required this.id,
      this.name,
      this.dashboardOrder,
      this.description,
      this.status,
      this.onlineAdmissionFees,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || dashboardOrder != null) {
      map['dashboard_order'] = Variable<String>(dashboardOrder);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || onlineAdmissionFees != null) {
      map['online_admission_fees'] = Variable<int>(onlineAdmissionFees);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  FeesGroupsCompanion toCompanion(bool nullToAbsent) {
    return FeesGroupsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dashboardOrder: dashboardOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(dashboardOrder),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      onlineAdmissionFees: onlineAdmissionFees == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineAdmissionFees),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeesGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesGroup(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      dashboardOrder: serializer.fromJson<String?>(json['dashboardOrder']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<int?>(json['status']),
      onlineAdmissionFees:
          serializer.fromJson<int?>(json['onlineAdmissionFees']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'dashboardOrder': serializer.toJson<String?>(dashboardOrder),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<int?>(status),
      'onlineAdmissionFees': serializer.toJson<int?>(onlineAdmissionFees),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  FeesGroup copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> dashboardOrder = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<int?> onlineAdmissionFees = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      FeesGroup(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        dashboardOrder:
            dashboardOrder.present ? dashboardOrder.value : this.dashboardOrder,
        description: description.present ? description.value : this.description,
        status: status.present ? status.value : this.status,
        onlineAdmissionFees: onlineAdmissionFees.present
            ? onlineAdmissionFees.value
            : this.onlineAdmissionFees,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  FeesGroup copyWithCompanion(FeesGroupsCompanion data) {
    return FeesGroup(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dashboardOrder: data.dashboardOrder.present
          ? data.dashboardOrder.value
          : this.dashboardOrder,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      onlineAdmissionFees: data.onlineAdmissionFees.present
          ? data.onlineAdmissionFees.value
          : this.onlineAdmissionFees,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesGroup(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dashboardOrder: $dashboardOrder, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('onlineAdmissionFees: $onlineAdmissionFees, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dashboardOrder, description, status,
      onlineAdmissionFees, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesGroup &&
          other.id == this.id &&
          other.name == this.name &&
          other.dashboardOrder == this.dashboardOrder &&
          other.description == this.description &&
          other.status == this.status &&
          other.onlineAdmissionFees == this.onlineAdmissionFees &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeesGroupsCompanion extends UpdateCompanion<FeesGroup> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> dashboardOrder;
  final Value<String?> description;
  final Value<int?> status;
  final Value<int?> onlineAdmissionFees;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const FeesGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dashboardOrder = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.onlineAdmissionFees = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeesGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dashboardOrder = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.onlineAdmissionFees = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<FeesGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? dashboardOrder,
    Expression<String>? description,
    Expression<int>? status,
    Expression<int>? onlineAdmissionFees,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dashboardOrder != null) 'dashboard_order': dashboardOrder,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (onlineAdmissionFees != null)
        'online_admission_fees': onlineAdmissionFees,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeesGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? dashboardOrder,
      Value<String?>? description,
      Value<int?>? status,
      Value<int?>? onlineAdmissionFees,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return FeesGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dashboardOrder: dashboardOrder ?? this.dashboardOrder,
      description: description ?? this.description,
      status: status ?? this.status,
      onlineAdmissionFees: onlineAdmissionFees ?? this.onlineAdmissionFees,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dashboardOrder.present) {
      map['dashboard_order'] = Variable<String>(dashboardOrder.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (onlineAdmissionFees.present) {
      map['online_admission_fees'] = Variable<int>(onlineAdmissionFees.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dashboardOrder: $dashboardOrder, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('onlineAdmissionFees: $onlineAdmissionFees, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
      'role_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phone, email, password, status, roleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_id']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String password;
  final String status;
  final String? roleId;
  const User(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      required this.password,
      required this.status,
      this.roleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['password'] = Variable<String>(password);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || roleId != null) {
      map['role_id'] = Variable<String>(roleId);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      password: Value(password),
      status: Value(status),
      roleId:
          roleId == null && nullToAbsent ? const Value.absent() : Value(roleId),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      status: serializer.fromJson<String>(json['status']),
      roleId: serializer.fromJson<String?>(json['roleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'password': serializer.toJson<String>(password),
      'status': serializer.toJson<String>(status),
      'roleId': serializer.toJson<String?>(roleId),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          String? password,
          String? status,
          Value<String?> roleId = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        roleId: roleId.present ? roleId.value : this.roleId,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      status: data.status.present ? data.status.value : this.status,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('status: $status, ')
          ..write('roleId: $roleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phone, email, password, status, roleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.password == this.password &&
          other.status == this.status &&
          other.roleId == this.roleId);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String> password;
  final Value<String> status;
  final Value<String?> roleId;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.status = const Value.absent(),
    this.roleId = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    required String password,
    required String status,
    this.roleId = const Value.absent(),
  })  : name = Value(name),
        password = Value(password),
        status = Value(status);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? status,
    Expression<String>? roleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (status != null) 'status': status,
      if (roleId != null) 'role_id': roleId,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String>? password,
      Value<String>? status,
      Value<String?>? roleId}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('status: $status, ')
          ..write('roleId: $roleId')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _admissionNoMeta =
      const VerificationMeta('admissionNo');
  @override
  late final GeneratedColumn<String> admissionNo = GeneratedColumn<String>(
      'admission_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rollNoMeta = const VerificationMeta('rollNo');
  @override
  late final GeneratedColumn<String> rollNo = GeneratedColumn<String>(
      'roll_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
      'mobile', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String> dob = GeneratedColumn<String>(
      'dob', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _admissionDateMeta =
      const VerificationMeta('admissionDate');
  @override
  late final GeneratedColumn<String> admissionDate = GeneratedColumn<String>(
      'admission_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _studentCategoryIdMeta =
      const VerificationMeta('studentCategoryId');
  @override
  late final GeneratedColumn<int> studentCategoryId = GeneratedColumn<int>(
      'student_category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _religionIdMeta =
      const VerificationMeta('religionId');
  @override
  late final GeneratedColumn<int> religionId = GeneratedColumn<int>(
      'religion_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bloodGroupIdMeta =
      const VerificationMeta('bloodGroupId');
  @override
  late final GeneratedColumn<int> bloodGroupId = GeneratedColumn<int>(
      'blood_group_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  @override
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imageIdMeta =
      const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<int> imageId = GeneratedColumn<int>(
      'image_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _parentGuardianIdMeta =
      const VerificationMeta('parentGuardianId');
  @override
  late final GeneratedColumn<int> parentGuardianId = GeneratedColumn<int>(
      'parent_guardian_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _uploadDocumentsMeta =
      const VerificationMeta('uploadDocuments');
  @override
  late final GeneratedColumn<String> uploadDocuments = GeneratedColumn<String>(
      'upload_documents', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolMeta =
      const VerificationMeta('previousSchool');
  @override
  late final GeneratedColumn<int> previousSchool = GeneratedColumn<int>(
      'previous_school', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolInfoMeta =
      const VerificationMeta('previousSchoolInfo');
  @override
  late final GeneratedColumn<String> previousSchoolInfo =
      GeneratedColumn<String>('previous_school_info', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolImageIdMeta =
      const VerificationMeta('previousSchoolImageId');
  @override
  late final GeneratedColumn<int> previousSchoolImageId = GeneratedColumn<int>(
      'previous_school_image_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _placeOfBirthMeta =
      const VerificationMeta('placeOfBirth');
  @override
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
      'place_of_birth', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nationalityMeta =
      const VerificationMeta('nationality');
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
      'nationality', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cprNoMeta = const VerificationMeta('cprNo');
  @override
  late final GeneratedColumn<String> cprNo = GeneratedColumn<String>(
      'cpr_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _spokenLangAtHomeMeta =
      const VerificationMeta('spokenLangAtHome');
  @override
  late final GeneratedColumn<String> spokenLangAtHome = GeneratedColumn<String>(
      'spoken_lang_at_home', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _residanceAddressMeta =
      const VerificationMeta('residanceAddress');
  @override
  late final GeneratedColumn<String> residanceAddress = GeneratedColumn<String>(
      'residance_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _controlNumberMeta =
      const VerificationMeta('controlNumber');
  @override
  late final GeneratedColumn<String> controlNumber = GeneratedColumn<String>(
      'control_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _classNameMeta =
      const VerificationMeta('className');
  @override
  late final GeneratedColumn<String> className = GeneratedColumn<String>(
      'class_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sectionNameMeta =
      const VerificationMeta('sectionName');
  @override
  late final GeneratedColumn<String> sectionName = GeneratedColumn<String>(
      'section_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _availableMeta =
      const VerificationMeta('available');
  @override
  late final GeneratedColumn<String> available = GeneratedColumn<String>(
      'available', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        admissionNo,
        rollNo,
        firstName,
        lastName,
        mobile,
        email,
        dob,
        admissionDate,
        studentCategoryId,
        religionId,
        bloodGroupId,
        genderId,
        categoryId,
        imageId,
        parentGuardianId,
        userId,
        uploadDocuments,
        status,
        previousSchool,
        previousSchoolInfo,
        previousSchoolImageId,
        placeOfBirth,
        nationality,
        cprNo,
        spokenLangAtHome,
        residanceAddress,
        controlNumber,
        createdAt,
        updatedAt,
        fullName,
        className,
        sectionName,
        available
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('admission_no')) {
      context.handle(
          _admissionNoMeta,
          admissionNo.isAcceptableOrUnknown(
              data['admission_no']!, _admissionNoMeta));
    }
    if (data.containsKey('roll_no')) {
      context.handle(_rollNoMeta,
          rollNo.isAcceptableOrUnknown(data['roll_no']!, _rollNoMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('admission_date')) {
      context.handle(
          _admissionDateMeta,
          admissionDate.isAcceptableOrUnknown(
              data['admission_date']!, _admissionDateMeta));
    }
    if (data.containsKey('student_category_id')) {
      context.handle(
          _studentCategoryIdMeta,
          studentCategoryId.isAcceptableOrUnknown(
              data['student_category_id']!, _studentCategoryIdMeta));
    }
    if (data.containsKey('religion_id')) {
      context.handle(
          _religionIdMeta,
          religionId.isAcceptableOrUnknown(
              data['religion_id']!, _religionIdMeta));
    }
    if (data.containsKey('blood_group_id')) {
      context.handle(
          _bloodGroupIdMeta,
          bloodGroupId.isAcceptableOrUnknown(
              data['blood_group_id']!, _bloodGroupIdMeta));
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    }
    if (data.containsKey('parent_guardian_id')) {
      context.handle(
          _parentGuardianIdMeta,
          parentGuardianId.isAcceptableOrUnknown(
              data['parent_guardian_id']!, _parentGuardianIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('upload_documents')) {
      context.handle(
          _uploadDocumentsMeta,
          uploadDocuments.isAcceptableOrUnknown(
              data['upload_documents']!, _uploadDocumentsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('previous_school')) {
      context.handle(
          _previousSchoolMeta,
          previousSchool.isAcceptableOrUnknown(
              data['previous_school']!, _previousSchoolMeta));
    }
    if (data.containsKey('previous_school_info')) {
      context.handle(
          _previousSchoolInfoMeta,
          previousSchoolInfo.isAcceptableOrUnknown(
              data['previous_school_info']!, _previousSchoolInfoMeta));
    }
    if (data.containsKey('previous_school_image_id')) {
      context.handle(
          _previousSchoolImageIdMeta,
          previousSchoolImageId.isAcceptableOrUnknown(
              data['previous_school_image_id']!, _previousSchoolImageIdMeta));
    }
    if (data.containsKey('place_of_birth')) {
      context.handle(
          _placeOfBirthMeta,
          placeOfBirth.isAcceptableOrUnknown(
              data['place_of_birth']!, _placeOfBirthMeta));
    }
    if (data.containsKey('nationality')) {
      context.handle(
          _nationalityMeta,
          nationality.isAcceptableOrUnknown(
              data['nationality']!, _nationalityMeta));
    }
    if (data.containsKey('cpr_no')) {
      context.handle(
          _cprNoMeta, cprNo.isAcceptableOrUnknown(data['cpr_no']!, _cprNoMeta));
    }
    if (data.containsKey('spoken_lang_at_home')) {
      context.handle(
          _spokenLangAtHomeMeta,
          spokenLangAtHome.isAcceptableOrUnknown(
              data['spoken_lang_at_home']!, _spokenLangAtHomeMeta));
    }
    if (data.containsKey('residance_address')) {
      context.handle(
          _residanceAddressMeta,
          residanceAddress.isAcceptableOrUnknown(
              data['residance_address']!, _residanceAddressMeta));
    }
    if (data.containsKey('control_number')) {
      context.handle(
          _controlNumberMeta,
          controlNumber.isAcceptableOrUnknown(
              data['control_number']!, _controlNumberMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('class_name')) {
      context.handle(_classNameMeta,
          className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta));
    }
    if (data.containsKey('section_name')) {
      context.handle(
          _sectionNameMeta,
          sectionName.isAcceptableOrUnknown(
              data['section_name']!, _sectionNameMeta));
    }
    if (data.containsKey('available')) {
      context.handle(_availableMeta,
          available.isAcceptableOrUnknown(data['available']!, _availableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      admissionNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admission_no']),
      rollNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}roll_no']),
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      mobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dob']),
      admissionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admission_date']),
      studentCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}student_category_id']),
      religionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}religion_id']),
      bloodGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}blood_group_id']),
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      imageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image_id']),
      parentGuardianId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_guardian_id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id']),
      uploadDocuments: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}upload_documents']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      previousSchool: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}previous_school']),
      previousSchoolInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}previous_school_info']),
      previousSchoolImageId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}previous_school_image_id']),
      placeOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place_of_birth']),
      nationality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality']),
      cprNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cpr_no']),
      spokenLangAtHome: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}spoken_lang_at_home']),
      residanceAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}residance_address']),
      controlNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}control_number']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name']),
      className: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}class_name']),
      sectionName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}section_name']),
      available: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}available']),
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String? admissionNo;
  final String? rollNo;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final String? dob;
  final String? admissionDate;
  final int? studentCategoryId;
  final int? religionId;
  final int? bloodGroupId;
  final int? genderId;
  final int? categoryId;
  final int? imageId;
  final int? parentGuardianId;
  final int? userId;
  final String? uploadDocuments;
  final int? status;
  final int? previousSchool;
  final String? previousSchoolInfo;
  final int? previousSchoolImageId;
  final String? placeOfBirth;
  final String? nationality;
  final String? cprNo;
  final String? spokenLangAtHome;
  final String? residanceAddress;
  final String? controlNumber;
  final String? createdAt;
  final String? updatedAt;
  final String? fullName;
  final String? className;
  final String? sectionName;
  final String? available;
  const Student(
      {required this.id,
      this.admissionNo,
      this.rollNo,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.dob,
      this.admissionDate,
      this.studentCategoryId,
      this.religionId,
      this.bloodGroupId,
      this.genderId,
      this.categoryId,
      this.imageId,
      this.parentGuardianId,
      this.userId,
      this.uploadDocuments,
      this.status,
      this.previousSchool,
      this.previousSchoolInfo,
      this.previousSchoolImageId,
      this.placeOfBirth,
      this.nationality,
      this.cprNo,
      this.spokenLangAtHome,
      this.residanceAddress,
      this.controlNumber,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.className,
      this.sectionName,
      this.available});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || admissionNo != null) {
      map['admission_no'] = Variable<String>(admissionNo);
    }
    if (!nullToAbsent || rollNo != null) {
      map['roll_no'] = Variable<String>(rollNo);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String>(dob);
    }
    if (!nullToAbsent || admissionDate != null) {
      map['admission_date'] = Variable<String>(admissionDate);
    }
    if (!nullToAbsent || studentCategoryId != null) {
      map['student_category_id'] = Variable<int>(studentCategoryId);
    }
    if (!nullToAbsent || religionId != null) {
      map['religion_id'] = Variable<int>(religionId);
    }
    if (!nullToAbsent || bloodGroupId != null) {
      map['blood_group_id'] = Variable<int>(bloodGroupId);
    }
    if (!nullToAbsent || genderId != null) {
      map['gender_id'] = Variable<int>(genderId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || imageId != null) {
      map['image_id'] = Variable<int>(imageId);
    }
    if (!nullToAbsent || parentGuardianId != null) {
      map['parent_guardian_id'] = Variable<int>(parentGuardianId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || uploadDocuments != null) {
      map['upload_documents'] = Variable<String>(uploadDocuments);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || previousSchool != null) {
      map['previous_school'] = Variable<int>(previousSchool);
    }
    if (!nullToAbsent || previousSchoolInfo != null) {
      map['previous_school_info'] = Variable<String>(previousSchoolInfo);
    }
    if (!nullToAbsent || previousSchoolImageId != null) {
      map['previous_school_image_id'] = Variable<int>(previousSchoolImageId);
    }
    if (!nullToAbsent || placeOfBirth != null) {
      map['place_of_birth'] = Variable<String>(placeOfBirth);
    }
    if (!nullToAbsent || nationality != null) {
      map['nationality'] = Variable<String>(nationality);
    }
    if (!nullToAbsent || cprNo != null) {
      map['cpr_no'] = Variable<String>(cprNo);
    }
    if (!nullToAbsent || spokenLangAtHome != null) {
      map['spoken_lang_at_home'] = Variable<String>(spokenLangAtHome);
    }
    if (!nullToAbsent || residanceAddress != null) {
      map['residance_address'] = Variable<String>(residanceAddress);
    }
    if (!nullToAbsent || controlNumber != null) {
      map['control_number'] = Variable<String>(controlNumber);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || className != null) {
      map['class_name'] = Variable<String>(className);
    }
    if (!nullToAbsent || sectionName != null) {
      map['section_name'] = Variable<String>(sectionName);
    }
    if (!nullToAbsent || available != null) {
      map['available'] = Variable<String>(available);
    }
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      admissionNo: admissionNo == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionNo),
      rollNo:
          rollNo == null && nullToAbsent ? const Value.absent() : Value(rollNo),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      mobile:
          mobile == null && nullToAbsent ? const Value.absent() : Value(mobile),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      admissionDate: admissionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionDate),
      studentCategoryId: studentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentCategoryId),
      religionId: religionId == null && nullToAbsent
          ? const Value.absent()
          : Value(religionId),
      bloodGroupId: bloodGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGroupId),
      genderId: genderId == null && nullToAbsent
          ? const Value.absent()
          : Value(genderId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      imageId: imageId == null && nullToAbsent
          ? const Value.absent()
          : Value(imageId),
      parentGuardianId: parentGuardianId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentGuardianId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      uploadDocuments: uploadDocuments == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadDocuments),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      previousSchool: previousSchool == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchool),
      previousSchoolInfo: previousSchoolInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchoolInfo),
      previousSchoolImageId: previousSchoolImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchoolImageId),
      placeOfBirth: placeOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfBirth),
      nationality: nationality == null && nullToAbsent
          ? const Value.absent()
          : Value(nationality),
      cprNo:
          cprNo == null && nullToAbsent ? const Value.absent() : Value(cprNo),
      spokenLangAtHome: spokenLangAtHome == null && nullToAbsent
          ? const Value.absent()
          : Value(spokenLangAtHome),
      residanceAddress: residanceAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(residanceAddress),
      controlNumber: controlNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(controlNumber),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      className: className == null && nullToAbsent
          ? const Value.absent()
          : Value(className),
      sectionName: sectionName == null && nullToAbsent
          ? const Value.absent()
          : Value(sectionName),
      available: available == null && nullToAbsent
          ? const Value.absent()
          : Value(available),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      admissionNo: serializer.fromJson<String?>(json['admissionNo']),
      rollNo: serializer.fromJson<String?>(json['rollNo']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      email: serializer.fromJson<String?>(json['email']),
      dob: serializer.fromJson<String?>(json['dob']),
      admissionDate: serializer.fromJson<String?>(json['admissionDate']),
      studentCategoryId: serializer.fromJson<int?>(json['studentCategoryId']),
      religionId: serializer.fromJson<int?>(json['religionId']),
      bloodGroupId: serializer.fromJson<int?>(json['bloodGroupId']),
      genderId: serializer.fromJson<int?>(json['genderId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      imageId: serializer.fromJson<int?>(json['imageId']),
      parentGuardianId: serializer.fromJson<int?>(json['parentGuardianId']),
      userId: serializer.fromJson<int?>(json['userId']),
      uploadDocuments: serializer.fromJson<String?>(json['uploadDocuments']),
      status: serializer.fromJson<int?>(json['status']),
      previousSchool: serializer.fromJson<int?>(json['previousSchool']),
      previousSchoolInfo:
          serializer.fromJson<String?>(json['previousSchoolInfo']),
      previousSchoolImageId:
          serializer.fromJson<int?>(json['previousSchoolImageId']),
      placeOfBirth: serializer.fromJson<String?>(json['placeOfBirth']),
      nationality: serializer.fromJson<String?>(json['nationality']),
      cprNo: serializer.fromJson<String?>(json['cprNo']),
      spokenLangAtHome: serializer.fromJson<String?>(json['spokenLangAtHome']),
      residanceAddress: serializer.fromJson<String?>(json['residanceAddress']),
      controlNumber: serializer.fromJson<String?>(json['controlNumber']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      className: serializer.fromJson<String?>(json['className']),
      sectionName: serializer.fromJson<String?>(json['sectionName']),
      available: serializer.fromJson<String?>(json['available']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'admissionNo': serializer.toJson<String?>(admissionNo),
      'rollNo': serializer.toJson<String?>(rollNo),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'mobile': serializer.toJson<String?>(mobile),
      'email': serializer.toJson<String?>(email),
      'dob': serializer.toJson<String?>(dob),
      'admissionDate': serializer.toJson<String?>(admissionDate),
      'studentCategoryId': serializer.toJson<int?>(studentCategoryId),
      'religionId': serializer.toJson<int?>(religionId),
      'bloodGroupId': serializer.toJson<int?>(bloodGroupId),
      'genderId': serializer.toJson<int?>(genderId),
      'categoryId': serializer.toJson<int?>(categoryId),
      'imageId': serializer.toJson<int?>(imageId),
      'parentGuardianId': serializer.toJson<int?>(parentGuardianId),
      'userId': serializer.toJson<int?>(userId),
      'uploadDocuments': serializer.toJson<String?>(uploadDocuments),
      'status': serializer.toJson<int?>(status),
      'previousSchool': serializer.toJson<int?>(previousSchool),
      'previousSchoolInfo': serializer.toJson<String?>(previousSchoolInfo),
      'previousSchoolImageId': serializer.toJson<int?>(previousSchoolImageId),
      'placeOfBirth': serializer.toJson<String?>(placeOfBirth),
      'nationality': serializer.toJson<String?>(nationality),
      'cprNo': serializer.toJson<String?>(cprNo),
      'spokenLangAtHome': serializer.toJson<String?>(spokenLangAtHome),
      'residanceAddress': serializer.toJson<String?>(residanceAddress),
      'controlNumber': serializer.toJson<String?>(controlNumber),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'fullName': serializer.toJson<String?>(fullName),
      'className': serializer.toJson<String?>(className),
      'sectionName': serializer.toJson<String?>(sectionName),
      'available': serializer.toJson<String?>(available),
    };
  }

  Student copyWith(
          {int? id,
          Value<String?> admissionNo = const Value.absent(),
          Value<String?> rollNo = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> mobile = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> dob = const Value.absent(),
          Value<String?> admissionDate = const Value.absent(),
          Value<int?> studentCategoryId = const Value.absent(),
          Value<int?> religionId = const Value.absent(),
          Value<int?> bloodGroupId = const Value.absent(),
          Value<int?> genderId = const Value.absent(),
          Value<int?> categoryId = const Value.absent(),
          Value<int?> imageId = const Value.absent(),
          Value<int?> parentGuardianId = const Value.absent(),
          Value<int?> userId = const Value.absent(),
          Value<String?> uploadDocuments = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<int?> previousSchool = const Value.absent(),
          Value<String?> previousSchoolInfo = const Value.absent(),
          Value<int?> previousSchoolImageId = const Value.absent(),
          Value<String?> placeOfBirth = const Value.absent(),
          Value<String?> nationality = const Value.absent(),
          Value<String?> cprNo = const Value.absent(),
          Value<String?> spokenLangAtHome = const Value.absent(),
          Value<String?> residanceAddress = const Value.absent(),
          Value<String?> controlNumber = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<String?> className = const Value.absent(),
          Value<String?> sectionName = const Value.absent(),
          Value<String?> available = const Value.absent()}) =>
      Student(
        id: id ?? this.id,
        admissionNo: admissionNo.present ? admissionNo.value : this.admissionNo,
        rollNo: rollNo.present ? rollNo.value : this.rollNo,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        mobile: mobile.present ? mobile.value : this.mobile,
        email: email.present ? email.value : this.email,
        dob: dob.present ? dob.value : this.dob,
        admissionDate:
            admissionDate.present ? admissionDate.value : this.admissionDate,
        studentCategoryId: studentCategoryId.present
            ? studentCategoryId.value
            : this.studentCategoryId,
        religionId: religionId.present ? religionId.value : this.religionId,
        bloodGroupId:
            bloodGroupId.present ? bloodGroupId.value : this.bloodGroupId,
        genderId: genderId.present ? genderId.value : this.genderId,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        imageId: imageId.present ? imageId.value : this.imageId,
        parentGuardianId: parentGuardianId.present
            ? parentGuardianId.value
            : this.parentGuardianId,
        userId: userId.present ? userId.value : this.userId,
        uploadDocuments: uploadDocuments.present
            ? uploadDocuments.value
            : this.uploadDocuments,
        status: status.present ? status.value : this.status,
        previousSchool:
            previousSchool.present ? previousSchool.value : this.previousSchool,
        previousSchoolInfo: previousSchoolInfo.present
            ? previousSchoolInfo.value
            : this.previousSchoolInfo,
        previousSchoolImageId: previousSchoolImageId.present
            ? previousSchoolImageId.value
            : this.previousSchoolImageId,
        placeOfBirth:
            placeOfBirth.present ? placeOfBirth.value : this.placeOfBirth,
        nationality: nationality.present ? nationality.value : this.nationality,
        cprNo: cprNo.present ? cprNo.value : this.cprNo,
        spokenLangAtHome: spokenLangAtHome.present
            ? spokenLangAtHome.value
            : this.spokenLangAtHome,
        residanceAddress: residanceAddress.present
            ? residanceAddress.value
            : this.residanceAddress,
        controlNumber:
            controlNumber.present ? controlNumber.value : this.controlNumber,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        fullName: fullName.present ? fullName.value : this.fullName,
        className: className.present ? className.value : this.className,
        sectionName: sectionName.present ? sectionName.value : this.sectionName,
        available: available.present ? available.value : this.available,
      );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      admissionNo:
          data.admissionNo.present ? data.admissionNo.value : this.admissionNo,
      rollNo: data.rollNo.present ? data.rollNo.value : this.rollNo,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      email: data.email.present ? data.email.value : this.email,
      dob: data.dob.present ? data.dob.value : this.dob,
      admissionDate: data.admissionDate.present
          ? data.admissionDate.value
          : this.admissionDate,
      studentCategoryId: data.studentCategoryId.present
          ? data.studentCategoryId.value
          : this.studentCategoryId,
      religionId:
          data.religionId.present ? data.religionId.value : this.religionId,
      bloodGroupId: data.bloodGroupId.present
          ? data.bloodGroupId.value
          : this.bloodGroupId,
      genderId: data.genderId.present ? data.genderId.value : this.genderId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      imageId: data.imageId.present ? data.imageId.value : this.imageId,
      parentGuardianId: data.parentGuardianId.present
          ? data.parentGuardianId.value
          : this.parentGuardianId,
      userId: data.userId.present ? data.userId.value : this.userId,
      uploadDocuments: data.uploadDocuments.present
          ? data.uploadDocuments.value
          : this.uploadDocuments,
      status: data.status.present ? data.status.value : this.status,
      previousSchool: data.previousSchool.present
          ? data.previousSchool.value
          : this.previousSchool,
      previousSchoolInfo: data.previousSchoolInfo.present
          ? data.previousSchoolInfo.value
          : this.previousSchoolInfo,
      previousSchoolImageId: data.previousSchoolImageId.present
          ? data.previousSchoolImageId.value
          : this.previousSchoolImageId,
      placeOfBirth: data.placeOfBirth.present
          ? data.placeOfBirth.value
          : this.placeOfBirth,
      nationality:
          data.nationality.present ? data.nationality.value : this.nationality,
      cprNo: data.cprNo.present ? data.cprNo.value : this.cprNo,
      spokenLangAtHome: data.spokenLangAtHome.present
          ? data.spokenLangAtHome.value
          : this.spokenLangAtHome,
      residanceAddress: data.residanceAddress.present
          ? data.residanceAddress.value
          : this.residanceAddress,
      controlNumber: data.controlNumber.present
          ? data.controlNumber.value
          : this.controlNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      className: data.className.present ? data.className.value : this.className,
      sectionName:
          data.sectionName.present ? data.sectionName.value : this.sectionName,
      available: data.available.present ? data.available.value : this.available,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('admissionNo: $admissionNo, ')
          ..write('rollNo: $rollNo, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('dob: $dob, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('studentCategoryId: $studentCategoryId, ')
          ..write('religionId: $religionId, ')
          ..write('bloodGroupId: $bloodGroupId, ')
          ..write('genderId: $genderId, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageId: $imageId, ')
          ..write('parentGuardianId: $parentGuardianId, ')
          ..write('userId: $userId, ')
          ..write('uploadDocuments: $uploadDocuments, ')
          ..write('status: $status, ')
          ..write('previousSchool: $previousSchool, ')
          ..write('previousSchoolInfo: $previousSchoolInfo, ')
          ..write('previousSchoolImageId: $previousSchoolImageId, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('nationality: $nationality, ')
          ..write('cprNo: $cprNo, ')
          ..write('spokenLangAtHome: $spokenLangAtHome, ')
          ..write('residanceAddress: $residanceAddress, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('fullName: $fullName, ')
          ..write('className: $className, ')
          ..write('sectionName: $sectionName, ')
          ..write('available: $available')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        admissionNo,
        rollNo,
        firstName,
        lastName,
        mobile,
        email,
        dob,
        admissionDate,
        studentCategoryId,
        religionId,
        bloodGroupId,
        genderId,
        categoryId,
        imageId,
        parentGuardianId,
        userId,
        uploadDocuments,
        status,
        previousSchool,
        previousSchoolInfo,
        previousSchoolImageId,
        placeOfBirth,
        nationality,
        cprNo,
        spokenLangAtHome,
        residanceAddress,
        controlNumber,
        createdAt,
        updatedAt,
        fullName,
        className,
        sectionName,
        available
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.admissionNo == this.admissionNo &&
          other.rollNo == this.rollNo &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.mobile == this.mobile &&
          other.email == this.email &&
          other.dob == this.dob &&
          other.admissionDate == this.admissionDate &&
          other.studentCategoryId == this.studentCategoryId &&
          other.religionId == this.religionId &&
          other.bloodGroupId == this.bloodGroupId &&
          other.genderId == this.genderId &&
          other.categoryId == this.categoryId &&
          other.imageId == this.imageId &&
          other.parentGuardianId == this.parentGuardianId &&
          other.userId == this.userId &&
          other.uploadDocuments == this.uploadDocuments &&
          other.status == this.status &&
          other.previousSchool == this.previousSchool &&
          other.previousSchoolInfo == this.previousSchoolInfo &&
          other.previousSchoolImageId == this.previousSchoolImageId &&
          other.placeOfBirth == this.placeOfBirth &&
          other.nationality == this.nationality &&
          other.cprNo == this.cprNo &&
          other.spokenLangAtHome == this.spokenLangAtHome &&
          other.residanceAddress == this.residanceAddress &&
          other.controlNumber == this.controlNumber &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.fullName == this.fullName &&
          other.className == this.className &&
          other.sectionName == this.sectionName &&
          other.available == this.available);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String?> admissionNo;
  final Value<String?> rollNo;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> mobile;
  final Value<String?> email;
  final Value<String?> dob;
  final Value<String?> admissionDate;
  final Value<int?> studentCategoryId;
  final Value<int?> religionId;
  final Value<int?> bloodGroupId;
  final Value<int?> genderId;
  final Value<int?> categoryId;
  final Value<int?> imageId;
  final Value<int?> parentGuardianId;
  final Value<int?> userId;
  final Value<String?> uploadDocuments;
  final Value<int?> status;
  final Value<int?> previousSchool;
  final Value<String?> previousSchoolInfo;
  final Value<int?> previousSchoolImageId;
  final Value<String?> placeOfBirth;
  final Value<String?> nationality;
  final Value<String?> cprNo;
  final Value<String?> spokenLangAtHome;
  final Value<String?> residanceAddress;
  final Value<String?> controlNumber;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> fullName;
  final Value<String?> className;
  final Value<String?> sectionName;
  final Value<String?> available;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.admissionNo = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.dob = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.studentCategoryId = const Value.absent(),
    this.religionId = const Value.absent(),
    this.bloodGroupId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imageId = const Value.absent(),
    this.parentGuardianId = const Value.absent(),
    this.userId = const Value.absent(),
    this.uploadDocuments = const Value.absent(),
    this.status = const Value.absent(),
    this.previousSchool = const Value.absent(),
    this.previousSchoolInfo = const Value.absent(),
    this.previousSchoolImageId = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.nationality = const Value.absent(),
    this.cprNo = const Value.absent(),
    this.spokenLangAtHome = const Value.absent(),
    this.residanceAddress = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.fullName = const Value.absent(),
    this.className = const Value.absent(),
    this.sectionName = const Value.absent(),
    this.available = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    this.admissionNo = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.dob = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.studentCategoryId = const Value.absent(),
    this.religionId = const Value.absent(),
    this.bloodGroupId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imageId = const Value.absent(),
    this.parentGuardianId = const Value.absent(),
    this.userId = const Value.absent(),
    this.uploadDocuments = const Value.absent(),
    this.status = const Value.absent(),
    this.previousSchool = const Value.absent(),
    this.previousSchoolInfo = const Value.absent(),
    this.previousSchoolImageId = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.nationality = const Value.absent(),
    this.cprNo = const Value.absent(),
    this.spokenLangAtHome = const Value.absent(),
    this.residanceAddress = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.fullName = const Value.absent(),
    this.className = const Value.absent(),
    this.sectionName = const Value.absent(),
    this.available = const Value.absent(),
  });
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? admissionNo,
    Expression<String>? rollNo,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? mobile,
    Expression<String>? email,
    Expression<String>? dob,
    Expression<String>? admissionDate,
    Expression<int>? studentCategoryId,
    Expression<int>? religionId,
    Expression<int>? bloodGroupId,
    Expression<int>? genderId,
    Expression<int>? categoryId,
    Expression<int>? imageId,
    Expression<int>? parentGuardianId,
    Expression<int>? userId,
    Expression<String>? uploadDocuments,
    Expression<int>? status,
    Expression<int>? previousSchool,
    Expression<String>? previousSchoolInfo,
    Expression<int>? previousSchoolImageId,
    Expression<String>? placeOfBirth,
    Expression<String>? nationality,
    Expression<String>? cprNo,
    Expression<String>? spokenLangAtHome,
    Expression<String>? residanceAddress,
    Expression<String>? controlNumber,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? fullName,
    Expression<String>? className,
    Expression<String>? sectionName,
    Expression<String>? available,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (admissionNo != null) 'admission_no': admissionNo,
      if (rollNo != null) 'roll_no': rollNo,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (dob != null) 'dob': dob,
      if (admissionDate != null) 'admission_date': admissionDate,
      if (studentCategoryId != null) 'student_category_id': studentCategoryId,
      if (religionId != null) 'religion_id': religionId,
      if (bloodGroupId != null) 'blood_group_id': bloodGroupId,
      if (genderId != null) 'gender_id': genderId,
      if (categoryId != null) 'category_id': categoryId,
      if (imageId != null) 'image_id': imageId,
      if (parentGuardianId != null) 'parent_guardian_id': parentGuardianId,
      if (userId != null) 'user_id': userId,
      if (uploadDocuments != null) 'upload_documents': uploadDocuments,
      if (status != null) 'status': status,
      if (previousSchool != null) 'previous_school': previousSchool,
      if (previousSchoolInfo != null)
        'previous_school_info': previousSchoolInfo,
      if (previousSchoolImageId != null)
        'previous_school_image_id': previousSchoolImageId,
      if (placeOfBirth != null) 'place_of_birth': placeOfBirth,
      if (nationality != null) 'nationality': nationality,
      if (cprNo != null) 'cpr_no': cprNo,
      if (spokenLangAtHome != null) 'spoken_lang_at_home': spokenLangAtHome,
      if (residanceAddress != null) 'residance_address': residanceAddress,
      if (controlNumber != null) 'control_number': controlNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (fullName != null) 'full_name': fullName,
      if (className != null) 'class_name': className,
      if (sectionName != null) 'section_name': sectionName,
      if (available != null) 'available': available,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? admissionNo,
      Value<String?>? rollNo,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? mobile,
      Value<String?>? email,
      Value<String?>? dob,
      Value<String?>? admissionDate,
      Value<int?>? studentCategoryId,
      Value<int?>? religionId,
      Value<int?>? bloodGroupId,
      Value<int?>? genderId,
      Value<int?>? categoryId,
      Value<int?>? imageId,
      Value<int?>? parentGuardianId,
      Value<int?>? userId,
      Value<String?>? uploadDocuments,
      Value<int?>? status,
      Value<int?>? previousSchool,
      Value<String?>? previousSchoolInfo,
      Value<int?>? previousSchoolImageId,
      Value<String?>? placeOfBirth,
      Value<String?>? nationality,
      Value<String?>? cprNo,
      Value<String?>? spokenLangAtHome,
      Value<String?>? residanceAddress,
      Value<String?>? controlNumber,
      Value<String?>? createdAt,
      Value<String?>? updatedAt,
      Value<String?>? fullName,
      Value<String?>? className,
      Value<String?>? sectionName,
      Value<String?>? available}) {
    return StudentsCompanion(
      id: id ?? this.id,
      admissionNo: admissionNo ?? this.admissionNo,
      rollNo: rollNo ?? this.rollNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      admissionDate: admissionDate ?? this.admissionDate,
      studentCategoryId: studentCategoryId ?? this.studentCategoryId,
      religionId: religionId ?? this.religionId,
      bloodGroupId: bloodGroupId ?? this.bloodGroupId,
      genderId: genderId ?? this.genderId,
      categoryId: categoryId ?? this.categoryId,
      imageId: imageId ?? this.imageId,
      parentGuardianId: parentGuardianId ?? this.parentGuardianId,
      userId: userId ?? this.userId,
      uploadDocuments: uploadDocuments ?? this.uploadDocuments,
      status: status ?? this.status,
      previousSchool: previousSchool ?? this.previousSchool,
      previousSchoolInfo: previousSchoolInfo ?? this.previousSchoolInfo,
      previousSchoolImageId:
          previousSchoolImageId ?? this.previousSchoolImageId,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      nationality: nationality ?? this.nationality,
      cprNo: cprNo ?? this.cprNo,
      spokenLangAtHome: spokenLangAtHome ?? this.spokenLangAtHome,
      residanceAddress: residanceAddress ?? this.residanceAddress,
      controlNumber: controlNumber ?? this.controlNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fullName: fullName ?? this.fullName,
      className: className ?? this.className,
      sectionName: sectionName ?? this.sectionName,
      available: available ?? this.available,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (admissionNo.present) {
      map['admission_no'] = Variable<String>(admissionNo.value);
    }
    if (rollNo.present) {
      map['roll_no'] = Variable<String>(rollNo.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String>(dob.value);
    }
    if (admissionDate.present) {
      map['admission_date'] = Variable<String>(admissionDate.value);
    }
    if (studentCategoryId.present) {
      map['student_category_id'] = Variable<int>(studentCategoryId.value);
    }
    if (religionId.present) {
      map['religion_id'] = Variable<int>(religionId.value);
    }
    if (bloodGroupId.present) {
      map['blood_group_id'] = Variable<int>(bloodGroupId.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<int>(imageId.value);
    }
    if (parentGuardianId.present) {
      map['parent_guardian_id'] = Variable<int>(parentGuardianId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (uploadDocuments.present) {
      map['upload_documents'] = Variable<String>(uploadDocuments.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (previousSchool.present) {
      map['previous_school'] = Variable<int>(previousSchool.value);
    }
    if (previousSchoolInfo.present) {
      map['previous_school_info'] = Variable<String>(previousSchoolInfo.value);
    }
    if (previousSchoolImageId.present) {
      map['previous_school_image_id'] =
          Variable<int>(previousSchoolImageId.value);
    }
    if (placeOfBirth.present) {
      map['place_of_birth'] = Variable<String>(placeOfBirth.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (cprNo.present) {
      map['cpr_no'] = Variable<String>(cprNo.value);
    }
    if (spokenLangAtHome.present) {
      map['spoken_lang_at_home'] = Variable<String>(spokenLangAtHome.value);
    }
    if (residanceAddress.present) {
      map['residance_address'] = Variable<String>(residanceAddress.value);
    }
    if (controlNumber.present) {
      map['control_number'] = Variable<String>(controlNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (sectionName.present) {
      map['section_name'] = Variable<String>(sectionName.value);
    }
    if (available.present) {
      map['available'] = Variable<String>(available.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('admissionNo: $admissionNo, ')
          ..write('rollNo: $rollNo, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('dob: $dob, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('studentCategoryId: $studentCategoryId, ')
          ..write('religionId: $religionId, ')
          ..write('bloodGroupId: $bloodGroupId, ')
          ..write('genderId: $genderId, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageId: $imageId, ')
          ..write('parentGuardianId: $parentGuardianId, ')
          ..write('userId: $userId, ')
          ..write('uploadDocuments: $uploadDocuments, ')
          ..write('status: $status, ')
          ..write('previousSchool: $previousSchool, ')
          ..write('previousSchoolInfo: $previousSchoolInfo, ')
          ..write('previousSchoolImageId: $previousSchoolImageId, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('nationality: $nationality, ')
          ..write('cprNo: $cprNo, ')
          ..write('spokenLangAtHome: $spokenLangAtHome, ')
          ..write('residanceAddress: $residanceAddress, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('fullName: $fullName, ')
          ..write('className: $className, ')
          ..write('sectionName: $sectionName, ')
          ..write('available: $available')
          ..write(')'))
        .toString();
  }
}

class $FeesAssignmentsTable extends FeesAssignments
    with TableInfo<$FeesAssignmentsTable, FeesAssignment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesAssignmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _feesAssignIdMeta =
      const VerificationMeta('feesAssignId');
  @override
  late final GeneratedColumn<int> feesAssignId = GeneratedColumn<int>(
      'fees_assign_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _feesMasterIdMeta =
      const VerificationMeta('feesMasterId');
  @override
  late final GeneratedColumn<int> feesMasterId = GeneratedColumn<int>(
      'fees_master_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _controlNumberMeta =
      const VerificationMeta('controlNumber');
  @override
  late final GeneratedColumn<String> controlNumber = GeneratedColumn<String>(
      'control_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feesAmountMeta =
      const VerificationMeta('feesAmount');
  @override
  late final GeneratedColumn<String> feesAmount = GeneratedColumn<String>(
      'fees_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<String> paidAmount = GeneratedColumn<String>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _remainedAmountMeta =
      const VerificationMeta('remainedAmount');
  @override
  late final GeneratedColumn<String> remainedAmount = GeneratedColumn<String>(
      'remained_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _quaterAmountMeta =
      const VerificationMeta('quaterAmount');
  @override
  late final GeneratedColumn<String> quaterAmount = GeneratedColumn<String>(
      'quater_amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quaterOneMeta =
      const VerificationMeta('quaterOne');
  @override
  late final GeneratedColumn<int> quaterOne = GeneratedColumn<int>(
      'quater_one', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterTwoMeta =
      const VerificationMeta('quaterTwo');
  @override
  late final GeneratedColumn<int> quaterTwo = GeneratedColumn<int>(
      'quater_two', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterThreeMeta =
      const VerificationMeta('quaterThree');
  @override
  late final GeneratedColumn<int> quaterThree = GeneratedColumn<int>(
      'quater_three', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterFourMeta =
      const VerificationMeta('quaterFour');
  @override
  late final GeneratedColumn<int> quaterFour = GeneratedColumn<int>(
      'quater_four', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _outstandingbalanceMeta =
      const VerificationMeta('outstandingbalance');
  @override
  late final GeneratedColumn<String> outstandingbalance =
      GeneratedColumn<String>('outstandingbalance', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _feeGroupMeta =
      const VerificationMeta('feeGroup');
  @override
  late final GeneratedColumn<String> feeGroup = GeneratedColumn<String>(
      'fee_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  @override
  late final GeneratedColumn<String> updated = GeneratedColumn<String>(
      'updated', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        feesAssignId,
        feesMasterId,
        studentId,
        controlNumber,
        feesAmount,
        paidAmount,
        remainedAmount,
        quaterAmount,
        quaterOne,
        quaterTwo,
        quaterThree,
        quaterFour,
        comment,
        outstandingbalance,
        feeGroup,
        updated,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees_assignments';
  @override
  VerificationContext validateIntegrity(Insertable<FeesAssignment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fees_assign_id')) {
      context.handle(
          _feesAssignIdMeta,
          feesAssignId.isAcceptableOrUnknown(
              data['fees_assign_id']!, _feesAssignIdMeta));
    } else if (isInserting) {
      context.missing(_feesAssignIdMeta);
    }
    if (data.containsKey('fees_master_id')) {
      context.handle(
          _feesMasterIdMeta,
          feesMasterId.isAcceptableOrUnknown(
              data['fees_master_id']!, _feesMasterIdMeta));
    } else if (isInserting) {
      context.missing(_feesMasterIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('control_number')) {
      context.handle(
          _controlNumberMeta,
          controlNumber.isAcceptableOrUnknown(
              data['control_number']!, _controlNumberMeta));
    } else if (isInserting) {
      context.missing(_controlNumberMeta);
    }
    if (data.containsKey('fees_amount')) {
      context.handle(
          _feesAmountMeta,
          feesAmount.isAcceptableOrUnknown(
              data['fees_amount']!, _feesAmountMeta));
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('remained_amount')) {
      context.handle(
          _remainedAmountMeta,
          remainedAmount.isAcceptableOrUnknown(
              data['remained_amount']!, _remainedAmountMeta));
    }
    if (data.containsKey('quater_amount')) {
      context.handle(
          _quaterAmountMeta,
          quaterAmount.isAcceptableOrUnknown(
              data['quater_amount']!, _quaterAmountMeta));
    }
    if (data.containsKey('quater_one')) {
      context.handle(_quaterOneMeta,
          quaterOne.isAcceptableOrUnknown(data['quater_one']!, _quaterOneMeta));
    }
    if (data.containsKey('quater_two')) {
      context.handle(_quaterTwoMeta,
          quaterTwo.isAcceptableOrUnknown(data['quater_two']!, _quaterTwoMeta));
    }
    if (data.containsKey('quater_three')) {
      context.handle(
          _quaterThreeMeta,
          quaterThree.isAcceptableOrUnknown(
              data['quater_three']!, _quaterThreeMeta));
    }
    if (data.containsKey('quater_four')) {
      context.handle(
          _quaterFourMeta,
          quaterFour.isAcceptableOrUnknown(
              data['quater_four']!, _quaterFourMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('outstandingbalance')) {
      context.handle(
          _outstandingbalanceMeta,
          outstandingbalance.isAcceptableOrUnknown(
              data['outstandingbalance']!, _outstandingbalanceMeta));
    }
    if (data.containsKey('fee_group')) {
      context.handle(_feeGroupMeta,
          feeGroup.isAcceptableOrUnknown(data['fee_group']!, _feeGroupMeta));
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesAssignment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesAssignment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      feesAssignId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_assign_id'])!,
      feesMasterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_master_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      controlNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}control_number'])!,
      feesAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fees_amount'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}paid_amount'])!,
      remainedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}remained_amount'])!,
      quaterAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quater_amount']),
      quaterOne: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_one']),
      quaterTwo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_two']),
      quaterThree: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_three']),
      quaterFour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_four']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      outstandingbalance: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}outstandingbalance']),
      feeGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fee_group']),
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $FeesAssignmentsTable createAlias(String alias) {
    return $FeesAssignmentsTable(attachedDatabase, alias);
  }
}

class FeesAssignment extends DataClass implements Insertable<FeesAssignment> {
  final int id;
  final int feesAssignId;
  final int feesMasterId;
  final int studentId;
  final String controlNumber;
  final String feesAmount;
  final String paidAmount;
  final String remainedAmount;
  final String? quaterAmount;
  final int? quaterOne;
  final int? quaterTwo;
  final int? quaterThree;
  final int? quaterFour;
  final String? comment;
  final String? outstandingbalance;
  final String? feeGroup;
  final String? updated;
  final String? createdAt;
  final String? updatedAt;
  const FeesAssignment(
      {required this.id,
      required this.feesAssignId,
      required this.feesMasterId,
      required this.studentId,
      required this.controlNumber,
      required this.feesAmount,
      required this.paidAmount,
      required this.remainedAmount,
      this.quaterAmount,
      this.quaterOne,
      this.quaterTwo,
      this.quaterThree,
      this.quaterFour,
      this.comment,
      this.outstandingbalance,
      this.feeGroup,
      this.updated,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fees_assign_id'] = Variable<int>(feesAssignId);
    map['fees_master_id'] = Variable<int>(feesMasterId);
    map['student_id'] = Variable<int>(studentId);
    map['control_number'] = Variable<String>(controlNumber);
    map['fees_amount'] = Variable<String>(feesAmount);
    map['paid_amount'] = Variable<String>(paidAmount);
    map['remained_amount'] = Variable<String>(remainedAmount);
    if (!nullToAbsent || quaterAmount != null) {
      map['quater_amount'] = Variable<String>(quaterAmount);
    }
    if (!nullToAbsent || quaterOne != null) {
      map['quater_one'] = Variable<int>(quaterOne);
    }
    if (!nullToAbsent || quaterTwo != null) {
      map['quater_two'] = Variable<int>(quaterTwo);
    }
    if (!nullToAbsent || quaterThree != null) {
      map['quater_three'] = Variable<int>(quaterThree);
    }
    if (!nullToAbsent || quaterFour != null) {
      map['quater_four'] = Variable<int>(quaterFour);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || outstandingbalance != null) {
      map['outstandingbalance'] = Variable<String>(outstandingbalance);
    }
    if (!nullToAbsent || feeGroup != null) {
      map['fee_group'] = Variable<String>(feeGroup);
    }
    if (!nullToAbsent || updated != null) {
      map['updated'] = Variable<String>(updated);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  FeesAssignmentsCompanion toCompanion(bool nullToAbsent) {
    return FeesAssignmentsCompanion(
      id: Value(id),
      feesAssignId: Value(feesAssignId),
      feesMasterId: Value(feesMasterId),
      studentId: Value(studentId),
      controlNumber: Value(controlNumber),
      feesAmount: Value(feesAmount),
      paidAmount: Value(paidAmount),
      remainedAmount: Value(remainedAmount),
      quaterAmount: quaterAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterAmount),
      quaterOne: quaterOne == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterOne),
      quaterTwo: quaterTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterTwo),
      quaterThree: quaterThree == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterThree),
      quaterFour: quaterFour == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterFour),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      outstandingbalance: outstandingbalance == null && nullToAbsent
          ? const Value.absent()
          : Value(outstandingbalance),
      feeGroup: feeGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(feeGroup),
      updated: updated == null && nullToAbsent
          ? const Value.absent()
          : Value(updated),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeesAssignment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesAssignment(
      id: serializer.fromJson<int>(json['id']),
      feesAssignId: serializer.fromJson<int>(json['feesAssignId']),
      feesMasterId: serializer.fromJson<int>(json['feesMasterId']),
      studentId: serializer.fromJson<int>(json['studentId']),
      controlNumber: serializer.fromJson<String>(json['controlNumber']),
      feesAmount: serializer.fromJson<String>(json['feesAmount']),
      paidAmount: serializer.fromJson<String>(json['paidAmount']),
      remainedAmount: serializer.fromJson<String>(json['remainedAmount']),
      quaterAmount: serializer.fromJson<String?>(json['quaterAmount']),
      quaterOne: serializer.fromJson<int?>(json['quaterOne']),
      quaterTwo: serializer.fromJson<int?>(json['quaterTwo']),
      quaterThree: serializer.fromJson<int?>(json['quaterThree']),
      quaterFour: serializer.fromJson<int?>(json['quaterFour']),
      comment: serializer.fromJson<String?>(json['comment']),
      outstandingbalance:
          serializer.fromJson<String?>(json['outstandingbalance']),
      feeGroup: serializer.fromJson<String?>(json['feeGroup']),
      updated: serializer.fromJson<String?>(json['updated']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'feesAssignId': serializer.toJson<int>(feesAssignId),
      'feesMasterId': serializer.toJson<int>(feesMasterId),
      'studentId': serializer.toJson<int>(studentId),
      'controlNumber': serializer.toJson<String>(controlNumber),
      'feesAmount': serializer.toJson<String>(feesAmount),
      'paidAmount': serializer.toJson<String>(paidAmount),
      'remainedAmount': serializer.toJson<String>(remainedAmount),
      'quaterAmount': serializer.toJson<String?>(quaterAmount),
      'quaterOne': serializer.toJson<int?>(quaterOne),
      'quaterTwo': serializer.toJson<int?>(quaterTwo),
      'quaterThree': serializer.toJson<int?>(quaterThree),
      'quaterFour': serializer.toJson<int?>(quaterFour),
      'comment': serializer.toJson<String?>(comment),
      'outstandingbalance': serializer.toJson<String?>(outstandingbalance),
      'feeGroup': serializer.toJson<String?>(feeGroup),
      'updated': serializer.toJson<String?>(updated),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  FeesAssignment copyWith(
          {int? id,
          int? feesAssignId,
          int? feesMasterId,
          int? studentId,
          String? controlNumber,
          String? feesAmount,
          String? paidAmount,
          String? remainedAmount,
          Value<String?> quaterAmount = const Value.absent(),
          Value<int?> quaterOne = const Value.absent(),
          Value<int?> quaterTwo = const Value.absent(),
          Value<int?> quaterThree = const Value.absent(),
          Value<int?> quaterFour = const Value.absent(),
          Value<String?> comment = const Value.absent(),
          Value<String?> outstandingbalance = const Value.absent(),
          Value<String?> feeGroup = const Value.absent(),
          Value<String?> updated = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      FeesAssignment(
        id: id ?? this.id,
        feesAssignId: feesAssignId ?? this.feesAssignId,
        feesMasterId: feesMasterId ?? this.feesMasterId,
        studentId: studentId ?? this.studentId,
        controlNumber: controlNumber ?? this.controlNumber,
        feesAmount: feesAmount ?? this.feesAmount,
        paidAmount: paidAmount ?? this.paidAmount,
        remainedAmount: remainedAmount ?? this.remainedAmount,
        quaterAmount:
            quaterAmount.present ? quaterAmount.value : this.quaterAmount,
        quaterOne: quaterOne.present ? quaterOne.value : this.quaterOne,
        quaterTwo: quaterTwo.present ? quaterTwo.value : this.quaterTwo,
        quaterThree: quaterThree.present ? quaterThree.value : this.quaterThree,
        quaterFour: quaterFour.present ? quaterFour.value : this.quaterFour,
        comment: comment.present ? comment.value : this.comment,
        outstandingbalance: outstandingbalance.present
            ? outstandingbalance.value
            : this.outstandingbalance,
        feeGroup: feeGroup.present ? feeGroup.value : this.feeGroup,
        updated: updated.present ? updated.value : this.updated,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  FeesAssignment copyWithCompanion(FeesAssignmentsCompanion data) {
    return FeesAssignment(
      id: data.id.present ? data.id.value : this.id,
      feesAssignId: data.feesAssignId.present
          ? data.feesAssignId.value
          : this.feesAssignId,
      feesMasterId: data.feesMasterId.present
          ? data.feesMasterId.value
          : this.feesMasterId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      controlNumber: data.controlNumber.present
          ? data.controlNumber.value
          : this.controlNumber,
      feesAmount:
          data.feesAmount.present ? data.feesAmount.value : this.feesAmount,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      remainedAmount: data.remainedAmount.present
          ? data.remainedAmount.value
          : this.remainedAmount,
      quaterAmount: data.quaterAmount.present
          ? data.quaterAmount.value
          : this.quaterAmount,
      quaterOne: data.quaterOne.present ? data.quaterOne.value : this.quaterOne,
      quaterTwo: data.quaterTwo.present ? data.quaterTwo.value : this.quaterTwo,
      quaterThree:
          data.quaterThree.present ? data.quaterThree.value : this.quaterThree,
      quaterFour:
          data.quaterFour.present ? data.quaterFour.value : this.quaterFour,
      comment: data.comment.present ? data.comment.value : this.comment,
      outstandingbalance: data.outstandingbalance.present
          ? data.outstandingbalance.value
          : this.outstandingbalance,
      feeGroup: data.feeGroup.present ? data.feeGroup.value : this.feeGroup,
      updated: data.updated.present ? data.updated.value : this.updated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesAssignment(')
          ..write('id: $id, ')
          ..write('feesAssignId: $feesAssignId, ')
          ..write('feesMasterId: $feesMasterId, ')
          ..write('studentId: $studentId, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('feesAmount: $feesAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainedAmount: $remainedAmount, ')
          ..write('quaterAmount: $quaterAmount, ')
          ..write('quaterOne: $quaterOne, ')
          ..write('quaterTwo: $quaterTwo, ')
          ..write('quaterThree: $quaterThree, ')
          ..write('quaterFour: $quaterFour, ')
          ..write('comment: $comment, ')
          ..write('outstandingbalance: $outstandingbalance, ')
          ..write('feeGroup: $feeGroup, ')
          ..write('updated: $updated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      feesAssignId,
      feesMasterId,
      studentId,
      controlNumber,
      feesAmount,
      paidAmount,
      remainedAmount,
      quaterAmount,
      quaterOne,
      quaterTwo,
      quaterThree,
      quaterFour,
      comment,
      outstandingbalance,
      feeGroup,
      updated,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesAssignment &&
          other.id == this.id &&
          other.feesAssignId == this.feesAssignId &&
          other.feesMasterId == this.feesMasterId &&
          other.studentId == this.studentId &&
          other.controlNumber == this.controlNumber &&
          other.feesAmount == this.feesAmount &&
          other.paidAmount == this.paidAmount &&
          other.remainedAmount == this.remainedAmount &&
          other.quaterAmount == this.quaterAmount &&
          other.quaterOne == this.quaterOne &&
          other.quaterTwo == this.quaterTwo &&
          other.quaterThree == this.quaterThree &&
          other.quaterFour == this.quaterFour &&
          other.comment == this.comment &&
          other.outstandingbalance == this.outstandingbalance &&
          other.feeGroup == this.feeGroup &&
          other.updated == this.updated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeesAssignmentsCompanion extends UpdateCompanion<FeesAssignment> {
  final Value<int> id;
  final Value<int> feesAssignId;
  final Value<int> feesMasterId;
  final Value<int> studentId;
  final Value<String> controlNumber;
  final Value<String> feesAmount;
  final Value<String> paidAmount;
  final Value<String> remainedAmount;
  final Value<String?> quaterAmount;
  final Value<int?> quaterOne;
  final Value<int?> quaterTwo;
  final Value<int?> quaterThree;
  final Value<int?> quaterFour;
  final Value<String?> comment;
  final Value<String?> outstandingbalance;
  final Value<String?> feeGroup;
  final Value<String?> updated;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const FeesAssignmentsCompanion({
    this.id = const Value.absent(),
    this.feesAssignId = const Value.absent(),
    this.feesMasterId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.feesAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainedAmount = const Value.absent(),
    this.quaterAmount = const Value.absent(),
    this.quaterOne = const Value.absent(),
    this.quaterTwo = const Value.absent(),
    this.quaterThree = const Value.absent(),
    this.quaterFour = const Value.absent(),
    this.comment = const Value.absent(),
    this.outstandingbalance = const Value.absent(),
    this.feeGroup = const Value.absent(),
    this.updated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeesAssignmentsCompanion.insert({
    this.id = const Value.absent(),
    required int feesAssignId,
    required int feesMasterId,
    required int studentId,
    required String controlNumber,
    this.feesAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainedAmount = const Value.absent(),
    this.quaterAmount = const Value.absent(),
    this.quaterOne = const Value.absent(),
    this.quaterTwo = const Value.absent(),
    this.quaterThree = const Value.absent(),
    this.quaterFour = const Value.absent(),
    this.comment = const Value.absent(),
    this.outstandingbalance = const Value.absent(),
    this.feeGroup = const Value.absent(),
    this.updated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : feesAssignId = Value(feesAssignId),
        feesMasterId = Value(feesMasterId),
        studentId = Value(studentId),
        controlNumber = Value(controlNumber);
  static Insertable<FeesAssignment> custom({
    Expression<int>? id,
    Expression<int>? feesAssignId,
    Expression<int>? feesMasterId,
    Expression<int>? studentId,
    Expression<String>? controlNumber,
    Expression<String>? feesAmount,
    Expression<String>? paidAmount,
    Expression<String>? remainedAmount,
    Expression<String>? quaterAmount,
    Expression<int>? quaterOne,
    Expression<int>? quaterTwo,
    Expression<int>? quaterThree,
    Expression<int>? quaterFour,
    Expression<String>? comment,
    Expression<String>? outstandingbalance,
    Expression<String>? feeGroup,
    Expression<String>? updated,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feesAssignId != null) 'fees_assign_id': feesAssignId,
      if (feesMasterId != null) 'fees_master_id': feesMasterId,
      if (studentId != null) 'student_id': studentId,
      if (controlNumber != null) 'control_number': controlNumber,
      if (feesAmount != null) 'fees_amount': feesAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (remainedAmount != null) 'remained_amount': remainedAmount,
      if (quaterAmount != null) 'quater_amount': quaterAmount,
      if (quaterOne != null) 'quater_one': quaterOne,
      if (quaterTwo != null) 'quater_two': quaterTwo,
      if (quaterThree != null) 'quater_three': quaterThree,
      if (quaterFour != null) 'quater_four': quaterFour,
      if (comment != null) 'comment': comment,
      if (outstandingbalance != null) 'outstandingbalance': outstandingbalance,
      if (feeGroup != null) 'fee_group': feeGroup,
      if (updated != null) 'updated': updated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeesAssignmentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? feesAssignId,
      Value<int>? feesMasterId,
      Value<int>? studentId,
      Value<String>? controlNumber,
      Value<String>? feesAmount,
      Value<String>? paidAmount,
      Value<String>? remainedAmount,
      Value<String?>? quaterAmount,
      Value<int?>? quaterOne,
      Value<int?>? quaterTwo,
      Value<int?>? quaterThree,
      Value<int?>? quaterFour,
      Value<String?>? comment,
      Value<String?>? outstandingbalance,
      Value<String?>? feeGroup,
      Value<String?>? updated,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return FeesAssignmentsCompanion(
      id: id ?? this.id,
      feesAssignId: feesAssignId ?? this.feesAssignId,
      feesMasterId: feesMasterId ?? this.feesMasterId,
      studentId: studentId ?? this.studentId,
      controlNumber: controlNumber ?? this.controlNumber,
      feesAmount: feesAmount ?? this.feesAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      remainedAmount: remainedAmount ?? this.remainedAmount,
      quaterAmount: quaterAmount ?? this.quaterAmount,
      quaterOne: quaterOne ?? this.quaterOne,
      quaterTwo: quaterTwo ?? this.quaterTwo,
      quaterThree: quaterThree ?? this.quaterThree,
      quaterFour: quaterFour ?? this.quaterFour,
      comment: comment ?? this.comment,
      outstandingbalance: outstandingbalance ?? this.outstandingbalance,
      feeGroup: feeGroup ?? this.feeGroup,
      updated: updated ?? this.updated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (feesAssignId.present) {
      map['fees_assign_id'] = Variable<int>(feesAssignId.value);
    }
    if (feesMasterId.present) {
      map['fees_master_id'] = Variable<int>(feesMasterId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (controlNumber.present) {
      map['control_number'] = Variable<String>(controlNumber.value);
    }
    if (feesAmount.present) {
      map['fees_amount'] = Variable<String>(feesAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<String>(paidAmount.value);
    }
    if (remainedAmount.present) {
      map['remained_amount'] = Variable<String>(remainedAmount.value);
    }
    if (quaterAmount.present) {
      map['quater_amount'] = Variable<String>(quaterAmount.value);
    }
    if (quaterOne.present) {
      map['quater_one'] = Variable<int>(quaterOne.value);
    }
    if (quaterTwo.present) {
      map['quater_two'] = Variable<int>(quaterTwo.value);
    }
    if (quaterThree.present) {
      map['quater_three'] = Variable<int>(quaterThree.value);
    }
    if (quaterFour.present) {
      map['quater_four'] = Variable<int>(quaterFour.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (outstandingbalance.present) {
      map['outstandingbalance'] = Variable<String>(outstandingbalance.value);
    }
    if (feeGroup.present) {
      map['fee_group'] = Variable<String>(feeGroup.value);
    }
    if (updated.present) {
      map['updated'] = Variable<String>(updated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesAssignmentsCompanion(')
          ..write('id: $id, ')
          ..write('feesAssignId: $feesAssignId, ')
          ..write('feesMasterId: $feesMasterId, ')
          ..write('studentId: $studentId, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('feesAmount: $feesAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainedAmount: $remainedAmount, ')
          ..write('quaterAmount: $quaterAmount, ')
          ..write('quaterOne: $quaterOne, ')
          ..write('quaterTwo: $quaterTwo, ')
          ..write('quaterThree: $quaterThree, ')
          ..write('quaterFour: $quaterFour, ')
          ..write('comment: $comment, ')
          ..write('outstandingbalance: $outstandingbalance, ')
          ..write('feeGroup: $feeGroup, ')
          ..write('updated: $updated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FeesAssignChildrenTable extends FeesAssignChildren
    with TableInfo<$FeesAssignChildrenTable, FeesAssignChildrenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesAssignChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _feesAssignIdMeta =
      const VerificationMeta('feesAssignId');
  @override
  late final GeneratedColumn<int> feesAssignId = GeneratedColumn<int>(
      'fees_assign_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _feesMasterIdMeta =
      const VerificationMeta('feesMasterId');
  @override
  late final GeneratedColumn<int> feesMasterId = GeneratedColumn<int>(
      'fees_master_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _controlNumberMeta =
      const VerificationMeta('controlNumber');
  @override
  late final GeneratedColumn<String> controlNumber = GeneratedColumn<String>(
      'control_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feesAmountMeta =
      const VerificationMeta('feesAmount');
  @override
  late final GeneratedColumn<String> feesAmount = GeneratedColumn<String>(
      'fees_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<String> paidAmount = GeneratedColumn<String>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _remainedAmountMeta =
      const VerificationMeta('remainedAmount');
  @override
  late final GeneratedColumn<String> remainedAmount = GeneratedColumn<String>(
      'remained_amount', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('0'));
  static const VerificationMeta _quaterAmountMeta =
      const VerificationMeta('quaterAmount');
  @override
  late final GeneratedColumn<String> quaterAmount = GeneratedColumn<String>(
      'quater_amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quaterOneMeta =
      const VerificationMeta('quaterOne');
  @override
  late final GeneratedColumn<int> quaterOne = GeneratedColumn<int>(
      'quater_one', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterTwoMeta =
      const VerificationMeta('quaterTwo');
  @override
  late final GeneratedColumn<int> quaterTwo = GeneratedColumn<int>(
      'quater_two', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterThreeMeta =
      const VerificationMeta('quaterThree');
  @override
  late final GeneratedColumn<int> quaterThree = GeneratedColumn<int>(
      'quater_three', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quaterFourMeta =
      const VerificationMeta('quaterFour');
  @override
  late final GeneratedColumn<int> quaterFour = GeneratedColumn<int>(
      'quater_four', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _outstandingbalanceMeta =
      const VerificationMeta('outstandingbalance');
  @override
  late final GeneratedColumn<String> outstandingbalance =
      GeneratedColumn<String>('outstandingbalance', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _feeGroupMeta =
      const VerificationMeta('feeGroup');
  @override
  late final GeneratedColumn<String> feeGroup = GeneratedColumn<String>(
      'fee_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  @override
  late final GeneratedColumn<String> updated = GeneratedColumn<String>(
      'updated', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        feesAssignId,
        feesMasterId,
        studentId,
        controlNumber,
        feesAmount,
        paidAmount,
        remainedAmount,
        quaterAmount,
        quaterOne,
        quaterTwo,
        quaterThree,
        quaterFour,
        comment,
        outstandingbalance,
        feeGroup,
        updated,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees_assign_children';
  @override
  VerificationContext validateIntegrity(
      Insertable<FeesAssignChildrenData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fees_assign_id')) {
      context.handle(
          _feesAssignIdMeta,
          feesAssignId.isAcceptableOrUnknown(
              data['fees_assign_id']!, _feesAssignIdMeta));
    } else if (isInserting) {
      context.missing(_feesAssignIdMeta);
    }
    if (data.containsKey('fees_master_id')) {
      context.handle(
          _feesMasterIdMeta,
          feesMasterId.isAcceptableOrUnknown(
              data['fees_master_id']!, _feesMasterIdMeta));
    } else if (isInserting) {
      context.missing(_feesMasterIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('control_number')) {
      context.handle(
          _controlNumberMeta,
          controlNumber.isAcceptableOrUnknown(
              data['control_number']!, _controlNumberMeta));
    } else if (isInserting) {
      context.missing(_controlNumberMeta);
    }
    if (data.containsKey('fees_amount')) {
      context.handle(
          _feesAmountMeta,
          feesAmount.isAcceptableOrUnknown(
              data['fees_amount']!, _feesAmountMeta));
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('remained_amount')) {
      context.handle(
          _remainedAmountMeta,
          remainedAmount.isAcceptableOrUnknown(
              data['remained_amount']!, _remainedAmountMeta));
    }
    if (data.containsKey('quater_amount')) {
      context.handle(
          _quaterAmountMeta,
          quaterAmount.isAcceptableOrUnknown(
              data['quater_amount']!, _quaterAmountMeta));
    }
    if (data.containsKey('quater_one')) {
      context.handle(_quaterOneMeta,
          quaterOne.isAcceptableOrUnknown(data['quater_one']!, _quaterOneMeta));
    }
    if (data.containsKey('quater_two')) {
      context.handle(_quaterTwoMeta,
          quaterTwo.isAcceptableOrUnknown(data['quater_two']!, _quaterTwoMeta));
    }
    if (data.containsKey('quater_three')) {
      context.handle(
          _quaterThreeMeta,
          quaterThree.isAcceptableOrUnknown(
              data['quater_three']!, _quaterThreeMeta));
    }
    if (data.containsKey('quater_four')) {
      context.handle(
          _quaterFourMeta,
          quaterFour.isAcceptableOrUnknown(
              data['quater_four']!, _quaterFourMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('outstandingbalance')) {
      context.handle(
          _outstandingbalanceMeta,
          outstandingbalance.isAcceptableOrUnknown(
              data['outstandingbalance']!, _outstandingbalanceMeta));
    }
    if (data.containsKey('fee_group')) {
      context.handle(_feeGroupMeta,
          feeGroup.isAcceptableOrUnknown(data['fee_group']!, _feeGroupMeta));
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesAssignChildrenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesAssignChildrenData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      feesAssignId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_assign_id'])!,
      feesMasterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_master_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      controlNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}control_number'])!,
      feesAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fees_amount'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}paid_amount'])!,
      remainedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}remained_amount'])!,
      quaterAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quater_amount']),
      quaterOne: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_one']),
      quaterTwo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_two']),
      quaterThree: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_three']),
      quaterFour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quater_four']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      outstandingbalance: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}outstandingbalance']),
      feeGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fee_group']),
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $FeesAssignChildrenTable createAlias(String alias) {
    return $FeesAssignChildrenTable(attachedDatabase, alias);
  }
}

class FeesAssignChildrenData extends DataClass
    implements Insertable<FeesAssignChildrenData> {
  final int id;
  final int feesAssignId;
  final int feesMasterId;
  final int studentId;
  final String controlNumber;
  final String feesAmount;
  final String paidAmount;
  final String remainedAmount;
  final String? quaterAmount;
  final int? quaterOne;
  final int? quaterTwo;
  final int? quaterThree;
  final int? quaterFour;
  final String? comment;
  final String? outstandingbalance;
  final String? feeGroup;
  final String? updated;
  final String? createdAt;
  final String? updatedAt;
  const FeesAssignChildrenData(
      {required this.id,
      required this.feesAssignId,
      required this.feesMasterId,
      required this.studentId,
      required this.controlNumber,
      required this.feesAmount,
      required this.paidAmount,
      required this.remainedAmount,
      this.quaterAmount,
      this.quaterOne,
      this.quaterTwo,
      this.quaterThree,
      this.quaterFour,
      this.comment,
      this.outstandingbalance,
      this.feeGroup,
      this.updated,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fees_assign_id'] = Variable<int>(feesAssignId);
    map['fees_master_id'] = Variable<int>(feesMasterId);
    map['student_id'] = Variable<int>(studentId);
    map['control_number'] = Variable<String>(controlNumber);
    map['fees_amount'] = Variable<String>(feesAmount);
    map['paid_amount'] = Variable<String>(paidAmount);
    map['remained_amount'] = Variable<String>(remainedAmount);
    if (!nullToAbsent || quaterAmount != null) {
      map['quater_amount'] = Variable<String>(quaterAmount);
    }
    if (!nullToAbsent || quaterOne != null) {
      map['quater_one'] = Variable<int>(quaterOne);
    }
    if (!nullToAbsent || quaterTwo != null) {
      map['quater_two'] = Variable<int>(quaterTwo);
    }
    if (!nullToAbsent || quaterThree != null) {
      map['quater_three'] = Variable<int>(quaterThree);
    }
    if (!nullToAbsent || quaterFour != null) {
      map['quater_four'] = Variable<int>(quaterFour);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || outstandingbalance != null) {
      map['outstandingbalance'] = Variable<String>(outstandingbalance);
    }
    if (!nullToAbsent || feeGroup != null) {
      map['fee_group'] = Variable<String>(feeGroup);
    }
    if (!nullToAbsent || updated != null) {
      map['updated'] = Variable<String>(updated);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  FeesAssignChildrenCompanion toCompanion(bool nullToAbsent) {
    return FeesAssignChildrenCompanion(
      id: Value(id),
      feesAssignId: Value(feesAssignId),
      feesMasterId: Value(feesMasterId),
      studentId: Value(studentId),
      controlNumber: Value(controlNumber),
      feesAmount: Value(feesAmount),
      paidAmount: Value(paidAmount),
      remainedAmount: Value(remainedAmount),
      quaterAmount: quaterAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterAmount),
      quaterOne: quaterOne == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterOne),
      quaterTwo: quaterTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterTwo),
      quaterThree: quaterThree == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterThree),
      quaterFour: quaterFour == null && nullToAbsent
          ? const Value.absent()
          : Value(quaterFour),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      outstandingbalance: outstandingbalance == null && nullToAbsent
          ? const Value.absent()
          : Value(outstandingbalance),
      feeGroup: feeGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(feeGroup),
      updated: updated == null && nullToAbsent
          ? const Value.absent()
          : Value(updated),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeesAssignChildrenData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesAssignChildrenData(
      id: serializer.fromJson<int>(json['id']),
      feesAssignId: serializer.fromJson<int>(json['feesAssignId']),
      feesMasterId: serializer.fromJson<int>(json['feesMasterId']),
      studentId: serializer.fromJson<int>(json['studentId']),
      controlNumber: serializer.fromJson<String>(json['controlNumber']),
      feesAmount: serializer.fromJson<String>(json['feesAmount']),
      paidAmount: serializer.fromJson<String>(json['paidAmount']),
      remainedAmount: serializer.fromJson<String>(json['remainedAmount']),
      quaterAmount: serializer.fromJson<String?>(json['quaterAmount']),
      quaterOne: serializer.fromJson<int?>(json['quaterOne']),
      quaterTwo: serializer.fromJson<int?>(json['quaterTwo']),
      quaterThree: serializer.fromJson<int?>(json['quaterThree']),
      quaterFour: serializer.fromJson<int?>(json['quaterFour']),
      comment: serializer.fromJson<String?>(json['comment']),
      outstandingbalance:
          serializer.fromJson<String?>(json['outstandingbalance']),
      feeGroup: serializer.fromJson<String?>(json['feeGroup']),
      updated: serializer.fromJson<String?>(json['updated']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'feesAssignId': serializer.toJson<int>(feesAssignId),
      'feesMasterId': serializer.toJson<int>(feesMasterId),
      'studentId': serializer.toJson<int>(studentId),
      'controlNumber': serializer.toJson<String>(controlNumber),
      'feesAmount': serializer.toJson<String>(feesAmount),
      'paidAmount': serializer.toJson<String>(paidAmount),
      'remainedAmount': serializer.toJson<String>(remainedAmount),
      'quaterAmount': serializer.toJson<String?>(quaterAmount),
      'quaterOne': serializer.toJson<int?>(quaterOne),
      'quaterTwo': serializer.toJson<int?>(quaterTwo),
      'quaterThree': serializer.toJson<int?>(quaterThree),
      'quaterFour': serializer.toJson<int?>(quaterFour),
      'comment': serializer.toJson<String?>(comment),
      'outstandingbalance': serializer.toJson<String?>(outstandingbalance),
      'feeGroup': serializer.toJson<String?>(feeGroup),
      'updated': serializer.toJson<String?>(updated),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  FeesAssignChildrenData copyWith(
          {int? id,
          int? feesAssignId,
          int? feesMasterId,
          int? studentId,
          String? controlNumber,
          String? feesAmount,
          String? paidAmount,
          String? remainedAmount,
          Value<String?> quaterAmount = const Value.absent(),
          Value<int?> quaterOne = const Value.absent(),
          Value<int?> quaterTwo = const Value.absent(),
          Value<int?> quaterThree = const Value.absent(),
          Value<int?> quaterFour = const Value.absent(),
          Value<String?> comment = const Value.absent(),
          Value<String?> outstandingbalance = const Value.absent(),
          Value<String?> feeGroup = const Value.absent(),
          Value<String?> updated = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      FeesAssignChildrenData(
        id: id ?? this.id,
        feesAssignId: feesAssignId ?? this.feesAssignId,
        feesMasterId: feesMasterId ?? this.feesMasterId,
        studentId: studentId ?? this.studentId,
        controlNumber: controlNumber ?? this.controlNumber,
        feesAmount: feesAmount ?? this.feesAmount,
        paidAmount: paidAmount ?? this.paidAmount,
        remainedAmount: remainedAmount ?? this.remainedAmount,
        quaterAmount:
            quaterAmount.present ? quaterAmount.value : this.quaterAmount,
        quaterOne: quaterOne.present ? quaterOne.value : this.quaterOne,
        quaterTwo: quaterTwo.present ? quaterTwo.value : this.quaterTwo,
        quaterThree: quaterThree.present ? quaterThree.value : this.quaterThree,
        quaterFour: quaterFour.present ? quaterFour.value : this.quaterFour,
        comment: comment.present ? comment.value : this.comment,
        outstandingbalance: outstandingbalance.present
            ? outstandingbalance.value
            : this.outstandingbalance,
        feeGroup: feeGroup.present ? feeGroup.value : this.feeGroup,
        updated: updated.present ? updated.value : this.updated,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  FeesAssignChildrenData copyWithCompanion(FeesAssignChildrenCompanion data) {
    return FeesAssignChildrenData(
      id: data.id.present ? data.id.value : this.id,
      feesAssignId: data.feesAssignId.present
          ? data.feesAssignId.value
          : this.feesAssignId,
      feesMasterId: data.feesMasterId.present
          ? data.feesMasterId.value
          : this.feesMasterId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      controlNumber: data.controlNumber.present
          ? data.controlNumber.value
          : this.controlNumber,
      feesAmount:
          data.feesAmount.present ? data.feesAmount.value : this.feesAmount,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      remainedAmount: data.remainedAmount.present
          ? data.remainedAmount.value
          : this.remainedAmount,
      quaterAmount: data.quaterAmount.present
          ? data.quaterAmount.value
          : this.quaterAmount,
      quaterOne: data.quaterOne.present ? data.quaterOne.value : this.quaterOne,
      quaterTwo: data.quaterTwo.present ? data.quaterTwo.value : this.quaterTwo,
      quaterThree:
          data.quaterThree.present ? data.quaterThree.value : this.quaterThree,
      quaterFour:
          data.quaterFour.present ? data.quaterFour.value : this.quaterFour,
      comment: data.comment.present ? data.comment.value : this.comment,
      outstandingbalance: data.outstandingbalance.present
          ? data.outstandingbalance.value
          : this.outstandingbalance,
      feeGroup: data.feeGroup.present ? data.feeGroup.value : this.feeGroup,
      updated: data.updated.present ? data.updated.value : this.updated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesAssignChildrenData(')
          ..write('id: $id, ')
          ..write('feesAssignId: $feesAssignId, ')
          ..write('feesMasterId: $feesMasterId, ')
          ..write('studentId: $studentId, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('feesAmount: $feesAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainedAmount: $remainedAmount, ')
          ..write('quaterAmount: $quaterAmount, ')
          ..write('quaterOne: $quaterOne, ')
          ..write('quaterTwo: $quaterTwo, ')
          ..write('quaterThree: $quaterThree, ')
          ..write('quaterFour: $quaterFour, ')
          ..write('comment: $comment, ')
          ..write('outstandingbalance: $outstandingbalance, ')
          ..write('feeGroup: $feeGroup, ')
          ..write('updated: $updated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      feesAssignId,
      feesMasterId,
      studentId,
      controlNumber,
      feesAmount,
      paidAmount,
      remainedAmount,
      quaterAmount,
      quaterOne,
      quaterTwo,
      quaterThree,
      quaterFour,
      comment,
      outstandingbalance,
      feeGroup,
      updated,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesAssignChildrenData &&
          other.id == this.id &&
          other.feesAssignId == this.feesAssignId &&
          other.feesMasterId == this.feesMasterId &&
          other.studentId == this.studentId &&
          other.controlNumber == this.controlNumber &&
          other.feesAmount == this.feesAmount &&
          other.paidAmount == this.paidAmount &&
          other.remainedAmount == this.remainedAmount &&
          other.quaterAmount == this.quaterAmount &&
          other.quaterOne == this.quaterOne &&
          other.quaterTwo == this.quaterTwo &&
          other.quaterThree == this.quaterThree &&
          other.quaterFour == this.quaterFour &&
          other.comment == this.comment &&
          other.outstandingbalance == this.outstandingbalance &&
          other.feeGroup == this.feeGroup &&
          other.updated == this.updated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeesAssignChildrenCompanion
    extends UpdateCompanion<FeesAssignChildrenData> {
  final Value<int> id;
  final Value<int> feesAssignId;
  final Value<int> feesMasterId;
  final Value<int> studentId;
  final Value<String> controlNumber;
  final Value<String> feesAmount;
  final Value<String> paidAmount;
  final Value<String> remainedAmount;
  final Value<String?> quaterAmount;
  final Value<int?> quaterOne;
  final Value<int?> quaterTwo;
  final Value<int?> quaterThree;
  final Value<int?> quaterFour;
  final Value<String?> comment;
  final Value<String?> outstandingbalance;
  final Value<String?> feeGroup;
  final Value<String?> updated;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const FeesAssignChildrenCompanion({
    this.id = const Value.absent(),
    this.feesAssignId = const Value.absent(),
    this.feesMasterId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.feesAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainedAmount = const Value.absent(),
    this.quaterAmount = const Value.absent(),
    this.quaterOne = const Value.absent(),
    this.quaterTwo = const Value.absent(),
    this.quaterThree = const Value.absent(),
    this.quaterFour = const Value.absent(),
    this.comment = const Value.absent(),
    this.outstandingbalance = const Value.absent(),
    this.feeGroup = const Value.absent(),
    this.updated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeesAssignChildrenCompanion.insert({
    this.id = const Value.absent(),
    required int feesAssignId,
    required int feesMasterId,
    required int studentId,
    required String controlNumber,
    this.feesAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainedAmount = const Value.absent(),
    this.quaterAmount = const Value.absent(),
    this.quaterOne = const Value.absent(),
    this.quaterTwo = const Value.absent(),
    this.quaterThree = const Value.absent(),
    this.quaterFour = const Value.absent(),
    this.comment = const Value.absent(),
    this.outstandingbalance = const Value.absent(),
    this.feeGroup = const Value.absent(),
    this.updated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : feesAssignId = Value(feesAssignId),
        feesMasterId = Value(feesMasterId),
        studentId = Value(studentId),
        controlNumber = Value(controlNumber);
  static Insertable<FeesAssignChildrenData> custom({
    Expression<int>? id,
    Expression<int>? feesAssignId,
    Expression<int>? feesMasterId,
    Expression<int>? studentId,
    Expression<String>? controlNumber,
    Expression<String>? feesAmount,
    Expression<String>? paidAmount,
    Expression<String>? remainedAmount,
    Expression<String>? quaterAmount,
    Expression<int>? quaterOne,
    Expression<int>? quaterTwo,
    Expression<int>? quaterThree,
    Expression<int>? quaterFour,
    Expression<String>? comment,
    Expression<String>? outstandingbalance,
    Expression<String>? feeGroup,
    Expression<String>? updated,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feesAssignId != null) 'fees_assign_id': feesAssignId,
      if (feesMasterId != null) 'fees_master_id': feesMasterId,
      if (studentId != null) 'student_id': studentId,
      if (controlNumber != null) 'control_number': controlNumber,
      if (feesAmount != null) 'fees_amount': feesAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (remainedAmount != null) 'remained_amount': remainedAmount,
      if (quaterAmount != null) 'quater_amount': quaterAmount,
      if (quaterOne != null) 'quater_one': quaterOne,
      if (quaterTwo != null) 'quater_two': quaterTwo,
      if (quaterThree != null) 'quater_three': quaterThree,
      if (quaterFour != null) 'quater_four': quaterFour,
      if (comment != null) 'comment': comment,
      if (outstandingbalance != null) 'outstandingbalance': outstandingbalance,
      if (feeGroup != null) 'fee_group': feeGroup,
      if (updated != null) 'updated': updated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeesAssignChildrenCompanion copyWith(
      {Value<int>? id,
      Value<int>? feesAssignId,
      Value<int>? feesMasterId,
      Value<int>? studentId,
      Value<String>? controlNumber,
      Value<String>? feesAmount,
      Value<String>? paidAmount,
      Value<String>? remainedAmount,
      Value<String?>? quaterAmount,
      Value<int?>? quaterOne,
      Value<int?>? quaterTwo,
      Value<int?>? quaterThree,
      Value<int?>? quaterFour,
      Value<String?>? comment,
      Value<String?>? outstandingbalance,
      Value<String?>? feeGroup,
      Value<String?>? updated,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return FeesAssignChildrenCompanion(
      id: id ?? this.id,
      feesAssignId: feesAssignId ?? this.feesAssignId,
      feesMasterId: feesMasterId ?? this.feesMasterId,
      studentId: studentId ?? this.studentId,
      controlNumber: controlNumber ?? this.controlNumber,
      feesAmount: feesAmount ?? this.feesAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      remainedAmount: remainedAmount ?? this.remainedAmount,
      quaterAmount: quaterAmount ?? this.quaterAmount,
      quaterOne: quaterOne ?? this.quaterOne,
      quaterTwo: quaterTwo ?? this.quaterTwo,
      quaterThree: quaterThree ?? this.quaterThree,
      quaterFour: quaterFour ?? this.quaterFour,
      comment: comment ?? this.comment,
      outstandingbalance: outstandingbalance ?? this.outstandingbalance,
      feeGroup: feeGroup ?? this.feeGroup,
      updated: updated ?? this.updated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (feesAssignId.present) {
      map['fees_assign_id'] = Variable<int>(feesAssignId.value);
    }
    if (feesMasterId.present) {
      map['fees_master_id'] = Variable<int>(feesMasterId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (controlNumber.present) {
      map['control_number'] = Variable<String>(controlNumber.value);
    }
    if (feesAmount.present) {
      map['fees_amount'] = Variable<String>(feesAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<String>(paidAmount.value);
    }
    if (remainedAmount.present) {
      map['remained_amount'] = Variable<String>(remainedAmount.value);
    }
    if (quaterAmount.present) {
      map['quater_amount'] = Variable<String>(quaterAmount.value);
    }
    if (quaterOne.present) {
      map['quater_one'] = Variable<int>(quaterOne.value);
    }
    if (quaterTwo.present) {
      map['quater_two'] = Variable<int>(quaterTwo.value);
    }
    if (quaterThree.present) {
      map['quater_three'] = Variable<int>(quaterThree.value);
    }
    if (quaterFour.present) {
      map['quater_four'] = Variable<int>(quaterFour.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (outstandingbalance.present) {
      map['outstandingbalance'] = Variable<String>(outstandingbalance.value);
    }
    if (feeGroup.present) {
      map['fee_group'] = Variable<String>(feeGroup.value);
    }
    if (updated.present) {
      map['updated'] = Variable<String>(updated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesAssignChildrenCompanion(')
          ..write('id: $id, ')
          ..write('feesAssignId: $feesAssignId, ')
          ..write('feesMasterId: $feesMasterId, ')
          ..write('studentId: $studentId, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('feesAmount: $feesAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainedAmount: $remainedAmount, ')
          ..write('quaterAmount: $quaterAmount, ')
          ..write('quaterOne: $quaterOne, ')
          ..write('quaterTwo: $quaterTwo, ')
          ..write('quaterThree: $quaterThree, ')
          ..write('quaterFour: $quaterFour, ')
          ..write('comment: $comment, ')
          ..write('outstandingbalance: $outstandingbalance, ')
          ..write('feeGroup: $feeGroup, ')
          ..write('updated: $updated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ExamTypesTable extends ExamTypes
    with TableInfo<$ExamTypesTable, ExamType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_types';
  @override
  VerificationContext validateIntegrity(Insertable<ExamType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ExamTypesTable createAlias(String alias) {
    return $ExamTypesTable(attachedDatabase, alias);
  }
}

class ExamType extends DataClass implements Insertable<ExamType> {
  final int id;
  final String? name;
  final String? type;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  const ExamType(
      {required this.id,
      this.name,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  ExamTypesCompanion toCompanion(bool nullToAbsent) {
    return ExamTypesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ExamType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      status: serializer.fromJson<int?>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'type': serializer.toJson<String?>(type),
      'status': serializer.toJson<int?>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  ExamType copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      ExamType(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        type: type.present ? type.value : this.type,
        status: status.present ? status.value : this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  ExamType copyWithCompanion(ExamTypesCompanion data) {
    return ExamType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamType &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExamTypesCompanion extends UpdateCompanion<ExamType> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> type;
  final Value<int?> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const ExamTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ExamTypesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<ExamType> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ExamTypesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? type,
      Value<int?>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return ExamTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ClassesTable extends Classes with TableInfo<$ClassesTable, ClassesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClassesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ordersMeta = const VerificationMeta('orders');
  @override
  late final GeneratedColumn<int> orders = GeneratedColumn<int>(
      'orders', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _classTranMeta =
      const VerificationMeta('classTran');
  @override
  late final GeneratedColumn<String> classTran = GeneratedColumn<String>(
      'class_tran', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, status, orders, createdAt, updatedAt, classTran];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classes';
  @override
  VerificationContext validateIntegrity(Insertable<ClassesData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('orders')) {
      context.handle(_ordersMeta,
          orders.isAcceptableOrUnknown(data['orders']!, _ordersMeta));
    } else if (isInserting) {
      context.missing(_ordersMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('class_tran')) {
      context.handle(_classTranMeta,
          classTran.isAcceptableOrUnknown(data['class_tran']!, _classTranMeta));
    } else if (isInserting) {
      context.missing(_classTranMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClassesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClassesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      orders: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}orders'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      classTran: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}class_tran'])!,
    );
  }

  @override
  $ClassesTable createAlias(String alias) {
    return $ClassesTable(attachedDatabase, alias);
  }
}

class ClassesData extends DataClass implements Insertable<ClassesData> {
  final int id;
  final String name;
  final int status;
  final int orders;
  final String createdAt;
  final String updatedAt;
  final String classTran;
  const ClassesData(
      {required this.id,
      required this.name,
      required this.status,
      required this.orders,
      required this.createdAt,
      required this.updatedAt,
      required this.classTran});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<int>(status);
    map['orders'] = Variable<int>(orders);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['class_tran'] = Variable<String>(classTran);
    return map;
  }

  ClassesCompanion toCompanion(bool nullToAbsent) {
    return ClassesCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      orders: Value(orders),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      classTran: Value(classTran),
    );
  }

  factory ClassesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClassesData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<int>(json['status']),
      orders: serializer.fromJson<int>(json['orders']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      classTran: serializer.fromJson<String>(json['classTran']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<int>(status),
      'orders': serializer.toJson<int>(orders),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'classTran': serializer.toJson<String>(classTran),
    };
  }

  ClassesData copyWith(
          {int? id,
          String? name,
          int? status,
          int? orders,
          String? createdAt,
          String? updatedAt,
          String? classTran}) =>
      ClassesData(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        orders: orders ?? this.orders,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        classTran: classTran ?? this.classTran,
      );
  ClassesData copyWithCompanion(ClassesCompanion data) {
    return ClassesData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      orders: data.orders.present ? data.orders.value : this.orders,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      classTran: data.classTran.present ? data.classTran.value : this.classTran,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClassesData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('orders: $orders, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('classTran: $classTran')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, status, orders, createdAt, updatedAt, classTran);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClassesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.orders == this.orders &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.classTran == this.classTran);
}

class ClassesCompanion extends UpdateCompanion<ClassesData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> status;
  final Value<int> orders;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String> classTran;
  const ClassesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.orders = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.classTran = const Value.absent(),
  });
  ClassesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int status,
    required int orders,
    required String createdAt,
    required String updatedAt,
    required String classTran,
  })  : name = Value(name),
        status = Value(status),
        orders = Value(orders),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        classTran = Value(classTran);
  static Insertable<ClassesData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? status,
    Expression<int>? orders,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? classTran,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (orders != null) 'orders': orders,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (classTran != null) 'class_tran': classTran,
    });
  }

  ClassesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? status,
      Value<int>? orders,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String>? classTran}) {
    return ClassesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      orders: orders ?? this.orders,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      classTran: classTran ?? this.classTran,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (orders.present) {
      map['orders'] = Variable<int>(orders.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (classTran.present) {
      map['class_tran'] = Variable<String>(classTran.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('orders: $orders, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('classTran: $classTran')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, code, type, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<Subject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String name;
  final String? code;
  final int type;
  final int status;
  final String createdAt;
  final String updatedAt;
  const Subject(
      {required this.id,
      required this.name,
      this.code,
      required this.type,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    map['type'] = Variable<int>(type);
    map['status'] = Variable<int>(status);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      type: Value(type),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      type: serializer.fromJson<int>(json['type']),
      status: serializer.fromJson<int>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'type': serializer.toJson<int>(type),
      'status': serializer.toJson<int>(status),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Subject copyWith(
          {int? id,
          String? name,
          Value<String?> code = const Value.absent(),
          int? type,
          int? status,
          String? createdAt,
          String? updatedAt}) =>
      Subject(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code.present ? code.value : this.code,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, code, type, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.type == this.type &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> code;
  final Value<int> type;
  final Value<int> status;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    required int type,
    required int status,
    required String createdAt,
    required String updatedAt,
  })  : name = Value(name),
        type = Value(type),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<int>? type,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? code,
      Value<int>? type,
      Value<int>? status,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sectionTranMeta =
      const VerificationMeta('sectionTran');
  @override
  late final GeneratedColumn<String> sectionTran = GeneratedColumn<String>(
      'section_tran', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, status, createdAt, updatedAt, sectionTran];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(Insertable<Section> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('section_tran')) {
      context.handle(
          _sectionTranMeta,
          sectionTran.isAcceptableOrUnknown(
              data['section_tran']!, _sectionTranMeta));
    } else if (isInserting) {
      context.missing(_sectionTranMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      sectionTran: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}section_tran'])!,
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final int id;
  final String name;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String sectionTran;
  const Section(
      {required this.id,
      required this.name,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.sectionTran});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<int>(status);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['section_tran'] = Variable<String>(sectionTran);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      sectionTran: Value(sectionTran),
    );
  }

  factory Section.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<int>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      sectionTran: serializer.fromJson<String>(json['sectionTran']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<int>(status),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'sectionTran': serializer.toJson<String>(sectionTran),
    };
  }

  Section copyWith(
          {int? id,
          String? name,
          int? status,
          String? createdAt,
          String? updatedAt,
          String? sectionTran}) =>
      Section(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        sectionTran: sectionTran ?? this.sectionTran,
      );
  Section copyWithCompanion(SectionsCompanion data) {
    return Section(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      sectionTran:
          data.sectionTran.present ? data.sectionTran.value : this.sectionTran,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sectionTran: $sectionTran')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, status, createdAt, updatedAt, sectionTran);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.sectionTran == this.sectionTran);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> status;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String> sectionTran;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sectionTran = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int status,
    required String createdAt,
    required String updatedAt,
    required String sectionTran,
  })  : name = Value(name),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        sectionTran = Value(sectionTran);
  static Insertable<Section> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? sectionTran,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sectionTran != null) 'section_tran': sectionTran,
    });
  }

  SectionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? status,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String>? sectionTran}) {
    return SectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sectionTran: sectionTran ?? this.sectionTran,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (sectionTran.present) {
      map['section_tran'] = Variable<String>(sectionTran.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sectionTran: $sectionTran')
          ..write(')'))
        .toString();
  }
}

class $ExamsTable extends Exams with TableInfo<$ExamsTable, Exam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sectionIdMeta =
      const VerificationMeta('sectionId');
  @override
  late final GeneratedColumn<int> sectionId = GeneratedColumn<int>(
      'sectionId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _examTypeIdMeta =
      const VerificationMeta('examTypeId');
  @override
  late final GeneratedColumn<int> examTypeId = GeneratedColumn<int>(
      'examTypeId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subjectId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _classIdMeta =
      const VerificationMeta('classId');
  @override
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
      'classId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _marksMeta = const VerificationMeta('marks');
  @override
  late final GeneratedColumn<String> marks = GeneratedColumn<String>(
      'marks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sectionId, examTypeId, subjectId, classId, marks, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exams';
  @override
  VerificationContext validateIntegrity(Insertable<Exam> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sectionId')) {
      context.handle(_sectionIdMeta,
          sectionId.isAcceptableOrUnknown(data['sectionId']!, _sectionIdMeta));
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('examTypeId')) {
      context.handle(
          _examTypeIdMeta,
          examTypeId.isAcceptableOrUnknown(
              data['examTypeId']!, _examTypeIdMeta));
    } else if (isInserting) {
      context.missing(_examTypeIdMeta);
    }
    if (data.containsKey('subjectId')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subjectId']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('classId')) {
      context.handle(_classIdMeta,
          classId.isAcceptableOrUnknown(data['classId']!, _classIdMeta));
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('marks')) {
      context.handle(
          _marksMeta, marks.isAcceptableOrUnknown(data['marks']!, _marksMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exam(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sectionId'])!,
      examTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}examTypeId'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjectId'])!,
      classId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}classId'])!,
      marks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}marks']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
    );
  }

  @override
  $ExamsTable createAlias(String alias) {
    return $ExamsTable(attachedDatabase, alias);
  }
}

class Exam extends DataClass implements Insertable<Exam> {
  final int id;
  final int sectionId;
  final int examTypeId;
  final int subjectId;
  final int classId;
  final String? marks;
  final int? status;
  const Exam(
      {required this.id,
      required this.sectionId,
      required this.examTypeId,
      required this.subjectId,
      required this.classId,
      this.marks,
      this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sectionId'] = Variable<int>(sectionId);
    map['examTypeId'] = Variable<int>(examTypeId);
    map['subjectId'] = Variable<int>(subjectId);
    map['classId'] = Variable<int>(classId);
    if (!nullToAbsent || marks != null) {
      map['marks'] = Variable<String>(marks);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    return map;
  }

  ExamsCompanion toCompanion(bool nullToAbsent) {
    return ExamsCompanion(
      id: Value(id),
      sectionId: Value(sectionId),
      examTypeId: Value(examTypeId),
      subjectId: Value(subjectId),
      classId: Value(classId),
      marks:
          marks == null && nullToAbsent ? const Value.absent() : Value(marks),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Exam.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exam(
      id: serializer.fromJson<int>(json['id']),
      sectionId: serializer.fromJson<int>(json['sectionId']),
      examTypeId: serializer.fromJson<int>(json['examTypeId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      classId: serializer.fromJson<int>(json['classId']),
      marks: serializer.fromJson<String?>(json['marks']),
      status: serializer.fromJson<int?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sectionId': serializer.toJson<int>(sectionId),
      'examTypeId': serializer.toJson<int>(examTypeId),
      'subjectId': serializer.toJson<int>(subjectId),
      'classId': serializer.toJson<int>(classId),
      'marks': serializer.toJson<String?>(marks),
      'status': serializer.toJson<int?>(status),
    };
  }

  Exam copyWith(
          {int? id,
          int? sectionId,
          int? examTypeId,
          int? subjectId,
          int? classId,
          Value<String?> marks = const Value.absent(),
          Value<int?> status = const Value.absent()}) =>
      Exam(
        id: id ?? this.id,
        sectionId: sectionId ?? this.sectionId,
        examTypeId: examTypeId ?? this.examTypeId,
        subjectId: subjectId ?? this.subjectId,
        classId: classId ?? this.classId,
        marks: marks.present ? marks.value : this.marks,
        status: status.present ? status.value : this.status,
      );
  Exam copyWithCompanion(ExamsCompanion data) {
    return Exam(
      id: data.id.present ? data.id.value : this.id,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      examTypeId:
          data.examTypeId.present ? data.examTypeId.value : this.examTypeId,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      classId: data.classId.present ? data.classId.value : this.classId,
      marks: data.marks.present ? data.marks.value : this.marks,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exam(')
          ..write('id: $id, ')
          ..write('sectionId: $sectionId, ')
          ..write('examTypeId: $examTypeId, ')
          ..write('subjectId: $subjectId, ')
          ..write('classId: $classId, ')
          ..write('marks: $marks, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sectionId, examTypeId, subjectId, classId, marks, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exam &&
          other.id == this.id &&
          other.sectionId == this.sectionId &&
          other.examTypeId == this.examTypeId &&
          other.subjectId == this.subjectId &&
          other.classId == this.classId &&
          other.marks == this.marks &&
          other.status == this.status);
}

class ExamsCompanion extends UpdateCompanion<Exam> {
  final Value<int> id;
  final Value<int> sectionId;
  final Value<int> examTypeId;
  final Value<int> subjectId;
  final Value<int> classId;
  final Value<String?> marks;
  final Value<int?> status;
  const ExamsCompanion({
    this.id = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.examTypeId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.classId = const Value.absent(),
    this.marks = const Value.absent(),
    this.status = const Value.absent(),
  });
  ExamsCompanion.insert({
    this.id = const Value.absent(),
    required int sectionId,
    required int examTypeId,
    required int subjectId,
    required int classId,
    this.marks = const Value.absent(),
    this.status = const Value.absent(),
  })  : sectionId = Value(sectionId),
        examTypeId = Value(examTypeId),
        subjectId = Value(subjectId),
        classId = Value(classId);
  static Insertable<Exam> custom({
    Expression<int>? id,
    Expression<int>? sectionId,
    Expression<int>? examTypeId,
    Expression<int>? subjectId,
    Expression<int>? classId,
    Expression<String>? marks,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sectionId != null) 'sectionId': sectionId,
      if (examTypeId != null) 'examTypeId': examTypeId,
      if (subjectId != null) 'subjectId': subjectId,
      if (classId != null) 'classId': classId,
      if (marks != null) 'marks': marks,
      if (status != null) 'status': status,
    });
  }

  ExamsCompanion copyWith(
      {Value<int>? id,
      Value<int>? sectionId,
      Value<int>? examTypeId,
      Value<int>? subjectId,
      Value<int>? classId,
      Value<String?>? marks,
      Value<int?>? status}) {
    return ExamsCompanion(
      id: id ?? this.id,
      sectionId: sectionId ?? this.sectionId,
      examTypeId: examTypeId ?? this.examTypeId,
      subjectId: subjectId ?? this.subjectId,
      classId: classId ?? this.classId,
      marks: marks ?? this.marks,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sectionId.present) {
      map['sectionId'] = Variable<int>(sectionId.value);
    }
    if (examTypeId.present) {
      map['examTypeId'] = Variable<int>(examTypeId.value);
    }
    if (subjectId.present) {
      map['subjectId'] = Variable<int>(subjectId.value);
    }
    if (classId.present) {
      map['classId'] = Variable<int>(classId.value);
    }
    if (marks.present) {
      map['marks'] = Variable<String>(marks.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamsCompanion(')
          ..write('id: $id, ')
          ..write('sectionId: $sectionId, ')
          ..write('examTypeId: $examTypeId, ')
          ..write('subjectId: $subjectId, ')
          ..write('classId: $classId, ')
          ..write('marks: $marks, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $MarksRegisterChildrensTable extends MarksRegisterChildrens
    with TableInfo<$MarksRegisterChildrensTable, MarksRegisterChildren> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarksRegisterChildrensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _marksRegisterIdMeta =
      const VerificationMeta('marksRegisterId');
  @override
  late final GeneratedColumn<int> marksRegisterId = GeneratedColumn<int>(
      'marks_register_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _markMeta = const VerificationMeta('mark');
  @override
  late final GeneratedColumn<int> mark = GeneratedColumn<int>(
      'mark', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, marksRegisterId, studentId, title, mark, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'marks_register_childrens';
  @override
  VerificationContext validateIntegrity(
      Insertable<MarksRegisterChildren> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('marks_register_id')) {
      context.handle(
          _marksRegisterIdMeta,
          marksRegisterId.isAcceptableOrUnknown(
              data['marks_register_id']!, _marksRegisterIdMeta));
    } else if (isInserting) {
      context.missing(_marksRegisterIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('mark')) {
      context.handle(
          _markMeta, mark.isAcceptableOrUnknown(data['mark']!, _markMeta));
    } else if (isInserting) {
      context.missing(_markMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarksRegisterChildren map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarksRegisterChildren(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      marksRegisterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}marks_register_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      mark: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mark'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $MarksRegisterChildrensTable createAlias(String alias) {
    return $MarksRegisterChildrensTable(attachedDatabase, alias);
  }
}

class MarksRegisterChildren extends DataClass
    implements Insertable<MarksRegisterChildren> {
  final int id;
  final int marksRegisterId;
  final int studentId;
  final String title;
  final int mark;
  final String? createdAt;
  final String? updatedAt;
  const MarksRegisterChildren(
      {required this.id,
      required this.marksRegisterId,
      required this.studentId,
      required this.title,
      required this.mark,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['marks_register_id'] = Variable<int>(marksRegisterId);
    map['student_id'] = Variable<int>(studentId);
    map['title'] = Variable<String>(title);
    map['mark'] = Variable<int>(mark);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  MarksRegisterChildrensCompanion toCompanion(bool nullToAbsent) {
    return MarksRegisterChildrensCompanion(
      id: Value(id),
      marksRegisterId: Value(marksRegisterId),
      studentId: Value(studentId),
      title: Value(title),
      mark: Value(mark),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory MarksRegisterChildren.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarksRegisterChildren(
      id: serializer.fromJson<int>(json['id']),
      marksRegisterId: serializer.fromJson<int>(json['marksRegisterId']),
      studentId: serializer.fromJson<int>(json['studentId']),
      title: serializer.fromJson<String>(json['title']),
      mark: serializer.fromJson<int>(json['mark']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'marksRegisterId': serializer.toJson<int>(marksRegisterId),
      'studentId': serializer.toJson<int>(studentId),
      'title': serializer.toJson<String>(title),
      'mark': serializer.toJson<int>(mark),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  MarksRegisterChildren copyWith(
          {int? id,
          int? marksRegisterId,
          int? studentId,
          String? title,
          int? mark,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      MarksRegisterChildren(
        id: id ?? this.id,
        marksRegisterId: marksRegisterId ?? this.marksRegisterId,
        studentId: studentId ?? this.studentId,
        title: title ?? this.title,
        mark: mark ?? this.mark,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  MarksRegisterChildren copyWithCompanion(
      MarksRegisterChildrensCompanion data) {
    return MarksRegisterChildren(
      id: data.id.present ? data.id.value : this.id,
      marksRegisterId: data.marksRegisterId.present
          ? data.marksRegisterId.value
          : this.marksRegisterId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      title: data.title.present ? data.title.value : this.title,
      mark: data.mark.present ? data.mark.value : this.mark,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarksRegisterChildren(')
          ..write('id: $id, ')
          ..write('marksRegisterId: $marksRegisterId, ')
          ..write('studentId: $studentId, ')
          ..write('title: $title, ')
          ..write('mark: $mark, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, marksRegisterId, studentId, title, mark, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarksRegisterChildren &&
          other.id == this.id &&
          other.marksRegisterId == this.marksRegisterId &&
          other.studentId == this.studentId &&
          other.title == this.title &&
          other.mark == this.mark &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MarksRegisterChildrensCompanion
    extends UpdateCompanion<MarksRegisterChildren> {
  final Value<int> id;
  final Value<int> marksRegisterId;
  final Value<int> studentId;
  final Value<String> title;
  final Value<int> mark;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const MarksRegisterChildrensCompanion({
    this.id = const Value.absent(),
    this.marksRegisterId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.title = const Value.absent(),
    this.mark = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MarksRegisterChildrensCompanion.insert({
    this.id = const Value.absent(),
    required int marksRegisterId,
    required int studentId,
    required String title,
    required int mark,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : marksRegisterId = Value(marksRegisterId),
        studentId = Value(studentId),
        title = Value(title),
        mark = Value(mark);
  static Insertable<MarksRegisterChildren> custom({
    Expression<int>? id,
    Expression<int>? marksRegisterId,
    Expression<int>? studentId,
    Expression<String>? title,
    Expression<int>? mark,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (marksRegisterId != null) 'marks_register_id': marksRegisterId,
      if (studentId != null) 'student_id': studentId,
      if (title != null) 'title': title,
      if (mark != null) 'mark': mark,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MarksRegisterChildrensCompanion copyWith(
      {Value<int>? id,
      Value<int>? marksRegisterId,
      Value<int>? studentId,
      Value<String>? title,
      Value<int>? mark,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return MarksRegisterChildrensCompanion(
      id: id ?? this.id,
      marksRegisterId: marksRegisterId ?? this.marksRegisterId,
      studentId: studentId ?? this.studentId,
      title: title ?? this.title,
      mark: mark ?? this.mark,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (marksRegisterId.present) {
      map['marks_register_id'] = Variable<int>(marksRegisterId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (mark.present) {
      map['mark'] = Variable<int>(mark.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarksRegisterChildrensCompanion(')
          ..write('id: $id, ')
          ..write('marksRegisterId: $marksRegisterId, ')
          ..write('studentId: $studentId, ')
          ..write('title: $title, ')
          ..write('mark: $mark, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FeesMastersTable extends FeesMasters
    with TableInfo<$FeesMastersTable, FeesMaster> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesMastersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _feesGroupIdMeta =
      const VerificationMeta('feesGroupId');
  @override
  late final GeneratedColumn<int> feesGroupId = GeneratedColumn<int>(
      'fees_group_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _feesTypeIdMeta =
      const VerificationMeta('feesTypeId');
  @override
  late final GeneratedColumn<int> feesTypeId = GeneratedColumn<int>(
      'fees_type_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
      'due_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fineTypeMeta =
      const VerificationMeta('fineType');
  @override
  late final GeneratedColumn<int> fineType = GeneratedColumn<int>(
      'fine_type', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
      'percentage', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fineAmountMeta =
      const VerificationMeta('fineAmount');
  @override
  late final GeneratedColumn<String> fineAmount = GeneratedColumn<String>(
      'fine_amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        feesGroupId,
        feesTypeId,
        dueDate,
        amount,
        fineType,
        percentage,
        fineAmount,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees_masters';
  @override
  VerificationContext validateIntegrity(Insertable<FeesMaster> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('fees_group_id')) {
      context.handle(
          _feesGroupIdMeta,
          feesGroupId.isAcceptableOrUnknown(
              data['fees_group_id']!, _feesGroupIdMeta));
    }
    if (data.containsKey('fees_type_id')) {
      context.handle(
          _feesTypeIdMeta,
          feesTypeId.isAcceptableOrUnknown(
              data['fees_type_id']!, _feesTypeIdMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('fine_type')) {
      context.handle(_fineTypeMeta,
          fineType.isAcceptableOrUnknown(data['fine_type']!, _fineTypeMeta));
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    }
    if (data.containsKey('fine_amount')) {
      context.handle(
          _fineAmountMeta,
          fineAmount.isAcceptableOrUnknown(
              data['fine_amount']!, _fineAmountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesMaster map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesMaster(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id']),
      feesGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_group_id']),
      feesTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_type_id']),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}due_date']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount']),
      fineType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fine_type']),
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}percentage']),
      fineAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fine_amount']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $FeesMastersTable createAlias(String alias) {
    return $FeesMastersTable(attachedDatabase, alias);
  }
}

class FeesMaster extends DataClass implements Insertable<FeesMaster> {
  final int id;
  final int? sessionId;
  final int? feesGroupId;
  final int? feesTypeId;
  final String? dueDate;
  final String? amount;
  final int? fineType;
  final int? percentage;
  final String? fineAmount;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  const FeesMaster(
      {required this.id,
      this.sessionId,
      this.feesGroupId,
      this.feesTypeId,
      this.dueDate,
      this.amount,
      this.fineType,
      this.percentage,
      this.fineAmount,
      this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int>(sessionId);
    }
    if (!nullToAbsent || feesGroupId != null) {
      map['fees_group_id'] = Variable<int>(feesGroupId);
    }
    if (!nullToAbsent || feesTypeId != null) {
      map['fees_type_id'] = Variable<int>(feesTypeId);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<String>(dueDate);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String>(amount);
    }
    if (!nullToAbsent || fineType != null) {
      map['fine_type'] = Variable<int>(fineType);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<int>(percentage);
    }
    if (!nullToAbsent || fineAmount != null) {
      map['fine_amount'] = Variable<String>(fineAmount);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  FeesMastersCompanion toCompanion(bool nullToAbsent) {
    return FeesMastersCompanion(
      id: Value(id),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      feesGroupId: feesGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(feesGroupId),
      feesTypeId: feesTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(feesTypeId),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      fineType: fineType == null && nullToAbsent
          ? const Value.absent()
          : Value(fineType),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      fineAmount: fineAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(fineAmount),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeesMaster.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesMaster(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int?>(json['sessionId']),
      feesGroupId: serializer.fromJson<int?>(json['feesGroupId']),
      feesTypeId: serializer.fromJson<int?>(json['feesTypeId']),
      dueDate: serializer.fromJson<String?>(json['dueDate']),
      amount: serializer.fromJson<String?>(json['amount']),
      fineType: serializer.fromJson<int?>(json['fineType']),
      percentage: serializer.fromJson<int?>(json['percentage']),
      fineAmount: serializer.fromJson<String?>(json['fineAmount']),
      status: serializer.fromJson<int?>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int?>(sessionId),
      'feesGroupId': serializer.toJson<int?>(feesGroupId),
      'feesTypeId': serializer.toJson<int?>(feesTypeId),
      'dueDate': serializer.toJson<String?>(dueDate),
      'amount': serializer.toJson<String?>(amount),
      'fineType': serializer.toJson<int?>(fineType),
      'percentage': serializer.toJson<int?>(percentage),
      'fineAmount': serializer.toJson<String?>(fineAmount),
      'status': serializer.toJson<int?>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  FeesMaster copyWith(
          {int? id,
          Value<int?> sessionId = const Value.absent(),
          Value<int?> feesGroupId = const Value.absent(),
          Value<int?> feesTypeId = const Value.absent(),
          Value<String?> dueDate = const Value.absent(),
          Value<String?> amount = const Value.absent(),
          Value<int?> fineType = const Value.absent(),
          Value<int?> percentage = const Value.absent(),
          Value<String?> fineAmount = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      FeesMaster(
        id: id ?? this.id,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        feesGroupId: feesGroupId.present ? feesGroupId.value : this.feesGroupId,
        feesTypeId: feesTypeId.present ? feesTypeId.value : this.feesTypeId,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        amount: amount.present ? amount.value : this.amount,
        fineType: fineType.present ? fineType.value : this.fineType,
        percentage: percentage.present ? percentage.value : this.percentage,
        fineAmount: fineAmount.present ? fineAmount.value : this.fineAmount,
        status: status.present ? status.value : this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  FeesMaster copyWithCompanion(FeesMastersCompanion data) {
    return FeesMaster(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      feesGroupId:
          data.feesGroupId.present ? data.feesGroupId.value : this.feesGroupId,
      feesTypeId:
          data.feesTypeId.present ? data.feesTypeId.value : this.feesTypeId,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      amount: data.amount.present ? data.amount.value : this.amount,
      fineType: data.fineType.present ? data.fineType.value : this.fineType,
      percentage:
          data.percentage.present ? data.percentage.value : this.percentage,
      fineAmount:
          data.fineAmount.present ? data.fineAmount.value : this.fineAmount,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesMaster(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('feesGroupId: $feesGroupId, ')
          ..write('feesTypeId: $feesTypeId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amount: $amount, ')
          ..write('fineType: $fineType, ')
          ..write('percentage: $percentage, ')
          ..write('fineAmount: $fineAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sessionId,
      feesGroupId,
      feesTypeId,
      dueDate,
      amount,
      fineType,
      percentage,
      fineAmount,
      status,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesMaster &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.feesGroupId == this.feesGroupId &&
          other.feesTypeId == this.feesTypeId &&
          other.dueDate == this.dueDate &&
          other.amount == this.amount &&
          other.fineType == this.fineType &&
          other.percentage == this.percentage &&
          other.fineAmount == this.fineAmount &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeesMastersCompanion extends UpdateCompanion<FeesMaster> {
  final Value<int> id;
  final Value<int?> sessionId;
  final Value<int?> feesGroupId;
  final Value<int?> feesTypeId;
  final Value<String?> dueDate;
  final Value<String?> amount;
  final Value<int?> fineType;
  final Value<int?> percentage;
  final Value<String?> fineAmount;
  final Value<int?> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const FeesMastersCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.feesGroupId = const Value.absent(),
    this.feesTypeId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.fineType = const Value.absent(),
    this.percentage = const Value.absent(),
    this.fineAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeesMastersCompanion.insert({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.feesGroupId = const Value.absent(),
    this.feesTypeId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.fineType = const Value.absent(),
    this.percentage = const Value.absent(),
    this.fineAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<FeesMaster> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<int>? feesGroupId,
    Expression<int>? feesTypeId,
    Expression<String>? dueDate,
    Expression<String>? amount,
    Expression<int>? fineType,
    Expression<int>? percentage,
    Expression<String>? fineAmount,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (feesGroupId != null) 'fees_group_id': feesGroupId,
      if (feesTypeId != null) 'fees_type_id': feesTypeId,
      if (dueDate != null) 'due_date': dueDate,
      if (amount != null) 'amount': amount,
      if (fineType != null) 'fine_type': fineType,
      if (percentage != null) 'percentage': percentage,
      if (fineAmount != null) 'fine_amount': fineAmount,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeesMastersCompanion copyWith(
      {Value<int>? id,
      Value<int?>? sessionId,
      Value<int?>? feesGroupId,
      Value<int?>? feesTypeId,
      Value<String?>? dueDate,
      Value<String?>? amount,
      Value<int?>? fineType,
      Value<int?>? percentage,
      Value<String?>? fineAmount,
      Value<int?>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return FeesMastersCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      feesGroupId: feesGroupId ?? this.feesGroupId,
      feesTypeId: feesTypeId ?? this.feesTypeId,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      fineType: fineType ?? this.fineType,
      percentage: percentage ?? this.percentage,
      fineAmount: fineAmount ?? this.fineAmount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (feesGroupId.present) {
      map['fees_group_id'] = Variable<int>(feesGroupId.value);
    }
    if (feesTypeId.present) {
      map['fees_type_id'] = Variable<int>(feesTypeId.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(dueDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (fineType.present) {
      map['fine_type'] = Variable<int>(fineType.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    if (fineAmount.present) {
      map['fine_amount'] = Variable<String>(fineAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesMastersCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('feesGroupId: $feesGroupId, ')
          ..write('feesTypeId: $feesTypeId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amount: $amount, ')
          ..write('fineType: $fineType, ')
          ..write('percentage: $percentage, ')
          ..write('fineAmount: $fineAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FeesTypeTable extends FeesType
    with TableInfo<$FeesTypeTable, FeesTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _classIdMeta =
      const VerificationMeta('classId');
  @override
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
      'class_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, code, description, status, classId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees_type';
  @override
  VerificationContext validateIntegrity(Insertable<FeesTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('class_id')) {
      context.handle(_classIdMeta,
          classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesTypeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      classId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}class_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $FeesTypeTable createAlias(String alias) {
    return $FeesTypeTable(attachedDatabase, alias);
  }
}

class FeesTypeData extends DataClass implements Insertable<FeesTypeData> {
  final int id;
  final String? name;
  final String? code;
  final String? description;
  final int? status;
  final int? classId;
  final String? createdAt;
  final String? updatedAt;
  const FeesTypeData(
      {required this.id,
      this.name,
      this.code,
      this.description,
      this.status,
      this.classId,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || classId != null) {
      map['class_id'] = Variable<int>(classId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  FeesTypeCompanion toCompanion(bool nullToAbsent) {
    return FeesTypeCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      classId: classId == null && nullToAbsent
          ? const Value.absent()
          : Value(classId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FeesTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesTypeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<int?>(json['status']),
      classId: serializer.fromJson<int?>(json['classId']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'code': serializer.toJson<String?>(code),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<int?>(status),
      'classId': serializer.toJson<int?>(classId),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  FeesTypeData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> code = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<int?> classId = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      FeesTypeData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        code: code.present ? code.value : this.code,
        description: description.present ? description.value : this.description,
        status: status.present ? status.value : this.status,
        classId: classId.present ? classId.value : this.classId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  FeesTypeData copyWithCompanion(FeesTypeCompanion data) {
    return FeesTypeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      classId: data.classId.present ? data.classId.value : this.classId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesTypeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('classId: $classId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, code, description, status, classId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesTypeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.description == this.description &&
          other.status == this.status &&
          other.classId == this.classId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeesTypeCompanion extends UpdateCompanion<FeesTypeData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> code;
  final Value<String?> description;
  final Value<int?> status;
  final Value<int?> classId;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const FeesTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.classId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeesTypeCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.classId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<FeesTypeData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? description,
    Expression<int>? status,
    Expression<int>? classId,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (classId != null) 'class_id': classId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeesTypeCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? code,
      Value<String?>? description,
      Value<int?>? status,
      Value<int?>? classId,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return FeesTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      status: status ?? this.status,
      classId: classId ?? this.classId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('classId: $classId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<int> paymentMethod = GeneratedColumn<int>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _paymentGatewayMeta =
      const VerificationMeta('paymentGateway');
  @override
  late final GeneratedColumn<String> paymentGateway = GeneratedColumn<String>(
      'payment_gateway', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
      'transaction_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _feesAssignChildrenIdMeta =
      const VerificationMeta('feesAssignChildrenId');
  @override
  late final GeneratedColumn<int> feesAssignChildrenId = GeneratedColumn<int>(
      'fees_assign_children_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _feesCollectByMeta =
      const VerificationMeta('feesCollectBy');
  @override
  late final GeneratedColumn<int> feesCollectBy = GeneratedColumn<int>(
      'fees_collect_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fineAmountMeta =
      const VerificationMeta('fineAmount');
  @override
  late final GeneratedColumn<String> fineAmount = GeneratedColumn<String>(
      'fine_amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _commentsMeta =
      const VerificationMeta('comments');
  @override
  late final GeneratedColumn<String> comments = GeneratedColumn<String>(
      'comments', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _printedMeta =
      const VerificationMeta('printed');
  @override
  late final GeneratedColumn<int> printed = GeneratedColumn<int>(
      'printed', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        paymentMethod,
        paymentGateway,
        transactionId,
        feesAssignChildrenId,
        feesCollectBy,
        studentId,
        sessionId,
        amount,
        fineAmount,
        accountId,
        comments,
        printed,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('payment_gateway')) {
      context.handle(
          _paymentGatewayMeta,
          paymentGateway.isAcceptableOrUnknown(
              data['payment_gateway']!, _paymentGatewayMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('fees_assign_children_id')) {
      context.handle(
          _feesAssignChildrenIdMeta,
          feesAssignChildrenId.isAcceptableOrUnknown(
              data['fees_assign_children_id']!, _feesAssignChildrenIdMeta));
    }
    if (data.containsKey('fees_collect_by')) {
      context.handle(
          _feesCollectByMeta,
          feesCollectBy.isAcceptableOrUnknown(
              data['fees_collect_by']!, _feesCollectByMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('fine_amount')) {
      context.handle(
          _fineAmountMeta,
          fineAmount.isAcceptableOrUnknown(
              data['fine_amount']!, _fineAmountMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta));
    }
    if (data.containsKey('printed')) {
      context.handle(_printedMeta,
          printed.isAcceptableOrUnknown(data['printed']!, _printedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_method']),
      paymentGateway: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_gateway']),
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transaction_id']),
      feesAssignChildrenId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}fees_assign_children_id']),
      feesCollectBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fees_collect_by']),
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount']),
      fineAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fine_amount']),
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id']),
      comments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comments']),
      printed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}printed']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String? date;
  final int? paymentMethod;
  final String? paymentGateway;
  final String? transactionId;
  final int? feesAssignChildrenId;
  final int? feesCollectBy;
  final int? studentId;
  final int? sessionId;
  final String? amount;
  final String? fineAmount;
  final int? accountId;
  final String? comments;
  final int? printed;
  final String? createdAt;
  final String? updatedAt;
  const Transaction(
      {required this.id,
      this.date,
      this.paymentMethod,
      this.paymentGateway,
      this.transactionId,
      this.feesAssignChildrenId,
      this.feesCollectBy,
      this.studentId,
      this.sessionId,
      this.amount,
      this.fineAmount,
      this.accountId,
      this.comments,
      this.printed,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<int>(paymentMethod);
    }
    if (!nullToAbsent || paymentGateway != null) {
      map['payment_gateway'] = Variable<String>(paymentGateway);
    }
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<String>(transactionId);
    }
    if (!nullToAbsent || feesAssignChildrenId != null) {
      map['fees_assign_children_id'] = Variable<int>(feesAssignChildrenId);
    }
    if (!nullToAbsent || feesCollectBy != null) {
      map['fees_collect_by'] = Variable<int>(feesCollectBy);
    }
    if (!nullToAbsent || studentId != null) {
      map['student_id'] = Variable<int>(studentId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int>(sessionId);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String>(amount);
    }
    if (!nullToAbsent || fineAmount != null) {
      map['fine_amount'] = Variable<String>(fineAmount);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<int>(accountId);
    }
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<String>(comments);
    }
    if (!nullToAbsent || printed != null) {
      map['printed'] = Variable<int>(printed);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      paymentGateway: paymentGateway == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentGateway),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      feesAssignChildrenId: feesAssignChildrenId == null && nullToAbsent
          ? const Value.absent()
          : Value(feesAssignChildrenId),
      feesCollectBy: feesCollectBy == null && nullToAbsent
          ? const Value.absent()
          : Value(feesCollectBy),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      fineAmount: fineAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(fineAmount),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      printed: printed == null && nullToAbsent
          ? const Value.absent()
          : Value(printed),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String?>(json['date']),
      paymentMethod: serializer.fromJson<int?>(json['paymentMethod']),
      paymentGateway: serializer.fromJson<String?>(json['paymentGateway']),
      transactionId: serializer.fromJson<String?>(json['transactionId']),
      feesAssignChildrenId:
          serializer.fromJson<int?>(json['feesAssignChildrenId']),
      feesCollectBy: serializer.fromJson<int?>(json['feesCollectBy']),
      studentId: serializer.fromJson<int?>(json['studentId']),
      sessionId: serializer.fromJson<int?>(json['sessionId']),
      amount: serializer.fromJson<String?>(json['amount']),
      fineAmount: serializer.fromJson<String?>(json['fineAmount']),
      accountId: serializer.fromJson<int?>(json['accountId']),
      comments: serializer.fromJson<String?>(json['comments']),
      printed: serializer.fromJson<int?>(json['printed']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String?>(date),
      'paymentMethod': serializer.toJson<int?>(paymentMethod),
      'paymentGateway': serializer.toJson<String?>(paymentGateway),
      'transactionId': serializer.toJson<String?>(transactionId),
      'feesAssignChildrenId': serializer.toJson<int?>(feesAssignChildrenId),
      'feesCollectBy': serializer.toJson<int?>(feesCollectBy),
      'studentId': serializer.toJson<int?>(studentId),
      'sessionId': serializer.toJson<int?>(sessionId),
      'amount': serializer.toJson<String?>(amount),
      'fineAmount': serializer.toJson<String?>(fineAmount),
      'accountId': serializer.toJson<int?>(accountId),
      'comments': serializer.toJson<String?>(comments),
      'printed': serializer.toJson<int?>(printed),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  Transaction copyWith(
          {int? id,
          Value<String?> date = const Value.absent(),
          Value<int?> paymentMethod = const Value.absent(),
          Value<String?> paymentGateway = const Value.absent(),
          Value<String?> transactionId = const Value.absent(),
          Value<int?> feesAssignChildrenId = const Value.absent(),
          Value<int?> feesCollectBy = const Value.absent(),
          Value<int?> studentId = const Value.absent(),
          Value<int?> sessionId = const Value.absent(),
          Value<String?> amount = const Value.absent(),
          Value<String?> fineAmount = const Value.absent(),
          Value<int?> accountId = const Value.absent(),
          Value<String?> comments = const Value.absent(),
          Value<int?> printed = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        date: date.present ? date.value : this.date,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        paymentGateway:
            paymentGateway.present ? paymentGateway.value : this.paymentGateway,
        transactionId:
            transactionId.present ? transactionId.value : this.transactionId,
        feesAssignChildrenId: feesAssignChildrenId.present
            ? feesAssignChildrenId.value
            : this.feesAssignChildrenId,
        feesCollectBy:
            feesCollectBy.present ? feesCollectBy.value : this.feesCollectBy,
        studentId: studentId.present ? studentId.value : this.studentId,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        amount: amount.present ? amount.value : this.amount,
        fineAmount: fineAmount.present ? fineAmount.value : this.fineAmount,
        accountId: accountId.present ? accountId.value : this.accountId,
        comments: comments.present ? comments.value : this.comments,
        printed: printed.present ? printed.value : this.printed,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentGateway: data.paymentGateway.present
          ? data.paymentGateway.value
          : this.paymentGateway,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      feesAssignChildrenId: data.feesAssignChildrenId.present
          ? data.feesAssignChildrenId.value
          : this.feesAssignChildrenId,
      feesCollectBy: data.feesCollectBy.present
          ? data.feesCollectBy.value
          : this.feesCollectBy,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      amount: data.amount.present ? data.amount.value : this.amount,
      fineAmount:
          data.fineAmount.present ? data.fineAmount.value : this.fineAmount,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      comments: data.comments.present ? data.comments.value : this.comments,
      printed: data.printed.present ? data.printed.value : this.printed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentGateway: $paymentGateway, ')
          ..write('transactionId: $transactionId, ')
          ..write('feesAssignChildrenId: $feesAssignChildrenId, ')
          ..write('feesCollectBy: $feesCollectBy, ')
          ..write('studentId: $studentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('amount: $amount, ')
          ..write('fineAmount: $fineAmount, ')
          ..write('accountId: $accountId, ')
          ..write('comments: $comments, ')
          ..write('printed: $printed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      paymentMethod,
      paymentGateway,
      transactionId,
      feesAssignChildrenId,
      feesCollectBy,
      studentId,
      sessionId,
      amount,
      fineAmount,
      accountId,
      comments,
      printed,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.date == this.date &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentGateway == this.paymentGateway &&
          other.transactionId == this.transactionId &&
          other.feesAssignChildrenId == this.feesAssignChildrenId &&
          other.feesCollectBy == this.feesCollectBy &&
          other.studentId == this.studentId &&
          other.sessionId == this.sessionId &&
          other.amount == this.amount &&
          other.fineAmount == this.fineAmount &&
          other.accountId == this.accountId &&
          other.comments == this.comments &&
          other.printed == this.printed &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String?> date;
  final Value<int?> paymentMethod;
  final Value<String?> paymentGateway;
  final Value<String?> transactionId;
  final Value<int?> feesAssignChildrenId;
  final Value<int?> feesCollectBy;
  final Value<int?> studentId;
  final Value<int?> sessionId;
  final Value<String?> amount;
  final Value<String?> fineAmount;
  final Value<int?> accountId;
  final Value<String?> comments;
  final Value<int?> printed;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentGateway = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.feesAssignChildrenId = const Value.absent(),
    this.feesCollectBy = const Value.absent(),
    this.studentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.amount = const Value.absent(),
    this.fineAmount = const Value.absent(),
    this.accountId = const Value.absent(),
    this.comments = const Value.absent(),
    this.printed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentGateway = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.feesAssignChildrenId = const Value.absent(),
    this.feesCollectBy = const Value.absent(),
    this.studentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.amount = const Value.absent(),
    this.fineAmount = const Value.absent(),
    this.accountId = const Value.absent(),
    this.comments = const Value.absent(),
    this.printed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<int>? paymentMethod,
    Expression<String>? paymentGateway,
    Expression<String>? transactionId,
    Expression<int>? feesAssignChildrenId,
    Expression<int>? feesCollectBy,
    Expression<int>? studentId,
    Expression<int>? sessionId,
    Expression<String>? amount,
    Expression<String>? fineAmount,
    Expression<int>? accountId,
    Expression<String>? comments,
    Expression<int>? printed,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentGateway != null) 'payment_gateway': paymentGateway,
      if (transactionId != null) 'transaction_id': transactionId,
      if (feesAssignChildrenId != null)
        'fees_assign_children_id': feesAssignChildrenId,
      if (feesCollectBy != null) 'fees_collect_by': feesCollectBy,
      if (studentId != null) 'student_id': studentId,
      if (sessionId != null) 'session_id': sessionId,
      if (amount != null) 'amount': amount,
      if (fineAmount != null) 'fine_amount': fineAmount,
      if (accountId != null) 'account_id': accountId,
      if (comments != null) 'comments': comments,
      if (printed != null) 'printed': printed,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? date,
      Value<int?>? paymentMethod,
      Value<String?>? paymentGateway,
      Value<String?>? transactionId,
      Value<int?>? feesAssignChildrenId,
      Value<int?>? feesCollectBy,
      Value<int?>? studentId,
      Value<int?>? sessionId,
      Value<String?>? amount,
      Value<String?>? fineAmount,
      Value<int?>? accountId,
      Value<String?>? comments,
      Value<int?>? printed,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentGateway: paymentGateway ?? this.paymentGateway,
      transactionId: transactionId ?? this.transactionId,
      feesAssignChildrenId: feesAssignChildrenId ?? this.feesAssignChildrenId,
      feesCollectBy: feesCollectBy ?? this.feesCollectBy,
      studentId: studentId ?? this.studentId,
      sessionId: sessionId ?? this.sessionId,
      amount: amount ?? this.amount,
      fineAmount: fineAmount ?? this.fineAmount,
      accountId: accountId ?? this.accountId,
      comments: comments ?? this.comments,
      printed: printed ?? this.printed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<int>(paymentMethod.value);
    }
    if (paymentGateway.present) {
      map['payment_gateway'] = Variable<String>(paymentGateway.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (feesAssignChildrenId.present) {
      map['fees_assign_children_id'] =
          Variable<int>(feesAssignChildrenId.value);
    }
    if (feesCollectBy.present) {
      map['fees_collect_by'] = Variable<int>(feesCollectBy.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (fineAmount.present) {
      map['fine_amount'] = Variable<String>(fineAmount.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    if (printed.present) {
      map['printed'] = Variable<int>(printed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentGateway: $paymentGateway, ')
          ..write('transactionId: $transactionId, ')
          ..write('feesAssignChildrenId: $feesAssignChildrenId, ')
          ..write('feesCollectBy: $feesCollectBy, ')
          ..write('studentId: $studentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('amount: $amount, ')
          ..write('fineAmount: $fineAmount, ')
          ..write('accountId: $accountId, ')
          ..write('comments: $comments, ')
          ..write('printed: $printed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BankAccountsTable extends BankAccounts
    with TableInfo<$BankAccountsTable, BankAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNameMeta =
      const VerificationMeta('accountName');
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
      'account_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
      'account_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('1'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        bankName,
        accountName,
        accountNumber,
        accountType,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<BankAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('account_name')) {
      context.handle(
          _accountNameMeta,
          accountName.isAcceptableOrUnknown(
              data['account_name']!, _accountNameMeta));
    } else if (isInserting) {
      context.missing(_accountNameMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name'])!,
      accountName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_name'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_number'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $BankAccountsTable createAlias(String alias) {
    return $BankAccountsTable(attachedDatabase, alias);
  }
}

class BankAccount extends DataClass implements Insertable<BankAccount> {
  final int id;
  final String bankName;
  final String accountName;
  final String accountNumber;
  final String? accountType;
  final String status;
  final String? createdAt;
  final String? updatedAt;
  const BankAccount(
      {required this.id,
      required this.bankName,
      required this.accountName,
      required this.accountNumber,
      this.accountType,
      required this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bank_name'] = Variable<String>(bankName);
    map['account_name'] = Variable<String>(accountName);
    map['account_number'] = Variable<String>(accountNumber);
    if (!nullToAbsent || accountType != null) {
      map['account_type'] = Variable<String>(accountType);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  BankAccountsCompanion toCompanion(bool nullToAbsent) {
    return BankAccountsCompanion(
      id: Value(id),
      bankName: Value(bankName),
      accountName: Value(accountName),
      accountNumber: Value(accountNumber),
      accountType: accountType == null && nullToAbsent
          ? const Value.absent()
          : Value(accountType),
      status: Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory BankAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankAccount(
      id: serializer.fromJson<int>(json['id']),
      bankName: serializer.fromJson<String>(json['bankName']),
      accountName: serializer.fromJson<String>(json['accountName']),
      accountNumber: serializer.fromJson<String>(json['accountNumber']),
      accountType: serializer.fromJson<String?>(json['accountType']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bankName': serializer.toJson<String>(bankName),
      'accountName': serializer.toJson<String>(accountName),
      'accountNumber': serializer.toJson<String>(accountNumber),
      'accountType': serializer.toJson<String?>(accountType),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  BankAccount copyWith(
          {int? id,
          String? bankName,
          String? accountName,
          String? accountNumber,
          Value<String?> accountType = const Value.absent(),
          String? status,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      BankAccount(
        id: id ?? this.id,
        bankName: bankName ?? this.bankName,
        accountName: accountName ?? this.accountName,
        accountNumber: accountNumber ?? this.accountNumber,
        accountType: accountType.present ? accountType.value : this.accountType,
        status: status ?? this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  BankAccount copyWithCompanion(BankAccountsCompanion data) {
    return BankAccount(
      id: data.id.present ? data.id.value : this.id,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      accountName:
          data.accountName.present ? data.accountName.value : this.accountName,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankAccount(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('accountName: $accountName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountType: $accountType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bankName, accountName, accountNumber,
      accountType, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankAccount &&
          other.id == this.id &&
          other.bankName == this.bankName &&
          other.accountName == this.accountName &&
          other.accountNumber == this.accountNumber &&
          other.accountType == this.accountType &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BankAccountsCompanion extends UpdateCompanion<BankAccount> {
  final Value<int> id;
  final Value<String> bankName;
  final Value<String> accountName;
  final Value<String> accountNumber;
  final Value<String?> accountType;
  final Value<String> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const BankAccountsCompanion({
    this.id = const Value.absent(),
    this.bankName = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.accountType = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BankAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String bankName,
    required String accountName,
    required String accountNumber,
    this.accountType = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : bankName = Value(bankName),
        accountName = Value(accountName),
        accountNumber = Value(accountNumber);
  static Insertable<BankAccount> custom({
    Expression<int>? id,
    Expression<String>? bankName,
    Expression<String>? accountName,
    Expression<String>? accountNumber,
    Expression<String>? accountType,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bankName != null) 'bank_name': bankName,
      if (accountName != null) 'account_name': accountName,
      if (accountNumber != null) 'account_number': accountNumber,
      if (accountType != null) 'account_type': accountType,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BankAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? bankName,
      Value<String>? accountName,
      Value<String>? accountNumber,
      Value<String?>? accountType,
      Value<String>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return BankAccountsCompanion(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountType: accountType ?? this.accountType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankAccountsCompanion(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('accountName: $accountName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountType: $accountType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubjectAssignChildrensTable extends SubjectAssignChildrens
    with TableInfo<$SubjectAssignChildrensTable, SubjectAssignChildren> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectAssignChildrensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectAssignIdMeta =
      const VerificationMeta('subjectAssignId');
  @override
  late final GeneratedColumn<String> subjectAssignId = GeneratedColumn<String>(
      'subject_assign_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, subjectAssignId, subjectId, staffId, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_assign_childrens';
  @override
  VerificationContext validateIntegrity(
      Insertable<SubjectAssignChildren> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_assign_id')) {
      context.handle(
          _subjectAssignIdMeta,
          subjectAssignId.isAcceptableOrUnknown(
              data['subject_assign_id']!, _subjectAssignIdMeta));
    } else if (isInserting) {
      context.missing(_subjectAssignIdMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectAssignChildren map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectAssignChildren(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectAssignId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subject_assign_id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_id'])!,
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $SubjectAssignChildrensTable createAlias(String alias) {
    return $SubjectAssignChildrensTable(attachedDatabase, alias);
  }
}

class SubjectAssignChildren extends DataClass
    implements Insertable<SubjectAssignChildren> {
  final int id;
  final String subjectAssignId;
  final String subjectId;
  final String staffId;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  const SubjectAssignChildren(
      {required this.id,
      required this.subjectAssignId,
      required this.subjectId,
      required this.staffId,
      this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_assign_id'] = Variable<String>(subjectAssignId);
    map['subject_id'] = Variable<String>(subjectId);
    map['staff_id'] = Variable<String>(staffId);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SubjectAssignChildrensCompanion toCompanion(bool nullToAbsent) {
    return SubjectAssignChildrensCompanion(
      id: Value(id),
      subjectAssignId: Value(subjectAssignId),
      subjectId: Value(subjectId),
      staffId: Value(staffId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SubjectAssignChildren.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectAssignChildren(
      id: serializer.fromJson<int>(json['id']),
      subjectAssignId: serializer.fromJson<String>(json['subjectAssignId']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      staffId: serializer.fromJson<String>(json['staffId']),
      status: serializer.fromJson<String?>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectAssignId': serializer.toJson<String>(subjectAssignId),
      'subjectId': serializer.toJson<String>(subjectId),
      'staffId': serializer.toJson<String>(staffId),
      'status': serializer.toJson<String?>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  SubjectAssignChildren copyWith(
          {int? id,
          String? subjectAssignId,
          String? subjectId,
          String? staffId,
          Value<String?> status = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      SubjectAssignChildren(
        id: id ?? this.id,
        subjectAssignId: subjectAssignId ?? this.subjectAssignId,
        subjectId: subjectId ?? this.subjectId,
        staffId: staffId ?? this.staffId,
        status: status.present ? status.value : this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  SubjectAssignChildren copyWithCompanion(
      SubjectAssignChildrensCompanion data) {
    return SubjectAssignChildren(
      id: data.id.present ? data.id.value : this.id,
      subjectAssignId: data.subjectAssignId.present
          ? data.subjectAssignId.value
          : this.subjectAssignId,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectAssignChildren(')
          ..write('id: $id, ')
          ..write('subjectAssignId: $subjectAssignId, ')
          ..write('subjectId: $subjectId, ')
          ..write('staffId: $staffId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, subjectAssignId, subjectId, staffId, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectAssignChildren &&
          other.id == this.id &&
          other.subjectAssignId == this.subjectAssignId &&
          other.subjectId == this.subjectId &&
          other.staffId == this.staffId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubjectAssignChildrensCompanion
    extends UpdateCompanion<SubjectAssignChildren> {
  final Value<int> id;
  final Value<String> subjectAssignId;
  final Value<String> subjectId;
  final Value<String> staffId;
  final Value<String?> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const SubjectAssignChildrensCompanion({
    this.id = const Value.absent(),
    this.subjectAssignId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.staffId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubjectAssignChildrensCompanion.insert({
    this.id = const Value.absent(),
    required String subjectAssignId,
    required String subjectId,
    required String staffId,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : subjectAssignId = Value(subjectAssignId),
        subjectId = Value(subjectId),
        staffId = Value(staffId);
  static Insertable<SubjectAssignChildren> custom({
    Expression<int>? id,
    Expression<String>? subjectAssignId,
    Expression<String>? subjectId,
    Expression<String>? staffId,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectAssignId != null) 'subject_assign_id': subjectAssignId,
      if (subjectId != null) 'subject_id': subjectId,
      if (staffId != null) 'staff_id': staffId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubjectAssignChildrensCompanion copyWith(
      {Value<int>? id,
      Value<String>? subjectAssignId,
      Value<String>? subjectId,
      Value<String>? staffId,
      Value<String?>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return SubjectAssignChildrensCompanion(
      id: id ?? this.id,
      subjectAssignId: subjectAssignId ?? this.subjectAssignId,
      subjectId: subjectId ?? this.subjectId,
      staffId: staffId ?? this.staffId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectAssignId.present) {
      map['subject_assign_id'] = Variable<String>(subjectAssignId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectAssignChildrensCompanion(')
          ..write('id: $id, ')
          ..write('subjectAssignId: $subjectAssignId, ')
          ..write('subjectId: $subjectId, ')
          ..write('staffId: $staffId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubjectAssignsTable extends SubjectAssigns
    with TableInfo<$SubjectAssignsTable, SubjectAssign> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectAssignsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _classesIdMeta =
      const VerificationMeta('classesId');
  @override
  late final GeneratedColumn<String> classesId = GeneratedColumn<String>(
      'classes_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sectionIdMeta =
      const VerificationMeta('sectionId');
  @override
  late final GeneratedColumn<String> sectionId = GeneratedColumn<String>(
      'section_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sessionId, classesId, sectionId, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_assigns';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectAssign> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('classes_id')) {
      context.handle(_classesIdMeta,
          classesId.isAcceptableOrUnknown(data['classes_id']!, _classesIdMeta));
    } else if (isInserting) {
      context.missing(_classesIdMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(_sectionIdMeta,
          sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta));
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectAssign map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectAssign(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      classesId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}classes_id'])!,
      sectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}section_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $SubjectAssignsTable createAlias(String alias) {
    return $SubjectAssignsTable(attachedDatabase, alias);
  }
}

class SubjectAssign extends DataClass implements Insertable<SubjectAssign> {
  final int id;
  final String sessionId;
  final String classesId;
  final String sectionId;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  const SubjectAssign(
      {required this.id,
      required this.sessionId,
      required this.classesId,
      required this.sectionId,
      this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['classes_id'] = Variable<String>(classesId);
    map['section_id'] = Variable<String>(sectionId);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SubjectAssignsCompanion toCompanion(bool nullToAbsent) {
    return SubjectAssignsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      classesId: Value(classesId),
      sectionId: Value(sectionId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SubjectAssign.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectAssign(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      classesId: serializer.fromJson<String>(json['classesId']),
      sectionId: serializer.fromJson<String>(json['sectionId']),
      status: serializer.fromJson<String?>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'classesId': serializer.toJson<String>(classesId),
      'sectionId': serializer.toJson<String>(sectionId),
      'status': serializer.toJson<String?>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  SubjectAssign copyWith(
          {int? id,
          String? sessionId,
          String? classesId,
          String? sectionId,
          Value<String?> status = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      SubjectAssign(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        classesId: classesId ?? this.classesId,
        sectionId: sectionId ?? this.sectionId,
        status: status.present ? status.value : this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  SubjectAssign copyWithCompanion(SubjectAssignsCompanion data) {
    return SubjectAssign(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      classesId: data.classesId.present ? data.classesId.value : this.classesId,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectAssign(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('classesId: $classesId, ')
          ..write('sectionId: $sectionId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, sessionId, classesId, sectionId, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectAssign &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.classesId == this.classesId &&
          other.sectionId == this.sectionId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubjectAssignsCompanion extends UpdateCompanion<SubjectAssign> {
  final Value<int> id;
  final Value<String> sessionId;
  final Value<String> classesId;
  final Value<String> sectionId;
  final Value<String?> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const SubjectAssignsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.classesId = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubjectAssignsCompanion.insert({
    this.id = const Value.absent(),
    required String sessionId,
    required String classesId,
    required String sectionId,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : sessionId = Value(sessionId),
        classesId = Value(classesId),
        sectionId = Value(sectionId);
  static Insertable<SubjectAssign> custom({
    Expression<int>? id,
    Expression<String>? sessionId,
    Expression<String>? classesId,
    Expression<String>? sectionId,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (classesId != null) 'classes_id': classesId,
      if (sectionId != null) 'section_id': sectionId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubjectAssignsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sessionId,
      Value<String>? classesId,
      Value<String>? sectionId,
      Value<String?>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return SubjectAssignsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      classesId: classesId ?? this.classesId,
      sectionId: sectionId ?? this.sectionId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (classesId.present) {
      map['classes_id'] = Variable<String>(classesId.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<String>(sectionId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectAssignsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('classesId: $classesId, ')
          ..write('sectionId: $sectionId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StaffTable extends Staff with TableInfo<$StaffTable, StaffData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
      'role_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _designationIdMeta =
      const VerificationMeta('designationId');
  @override
  late final GeneratedColumn<String> designationId = GeneratedColumn<String>(
      'designation_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _departmentIdMeta =
      const VerificationMeta('departmentId');
  @override
  late final GeneratedColumn<String> departmentId = GeneratedColumn<String>(
      'department_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  @override
  late final GeneratedColumn<String> genderId = GeneratedColumn<String>(
      'gender_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        staffId,
        roleId,
        designationId,
        departmentId,
        firstName,
        lastName,
        email,
        genderId,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff';
  @override
  VerificationContext validateIntegrity(Insertable<StaffData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('designation_id')) {
      context.handle(
          _designationIdMeta,
          designationId.isAcceptableOrUnknown(
              data['designation_id']!, _designationIdMeta));
    } else if (isInserting) {
      context.missing(_designationIdMeta);
    }
    if (data.containsKey('department_id')) {
      context.handle(
          _departmentIdMeta,
          departmentId.isAcceptableOrUnknown(
              data['department_id']!, _departmentIdMeta));
    } else if (isInserting) {
      context.missing(_departmentIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_id'])!,
      designationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation_id'])!,
      departmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender_id']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $StaffTable createAlias(String alias) {
    return $StaffTable(attachedDatabase, alias);
  }
}

class StaffData extends DataClass implements Insertable<StaffData> {
  final int id;
  final String userId;
  final String staffId;
  final String roleId;
  final String designationId;
  final String departmentId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? genderId;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  const StaffData(
      {required this.id,
      required this.userId,
      required this.staffId,
      required this.roleId,
      required this.designationId,
      required this.departmentId,
      this.firstName,
      this.lastName,
      this.email,
      this.genderId,
      this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['staff_id'] = Variable<String>(staffId);
    map['role_id'] = Variable<String>(roleId);
    map['designation_id'] = Variable<String>(designationId);
    map['department_id'] = Variable<String>(departmentId);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || genderId != null) {
      map['gender_id'] = Variable<String>(genderId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  StaffCompanion toCompanion(bool nullToAbsent) {
    return StaffCompanion(
      id: Value(id),
      userId: Value(userId),
      staffId: Value(staffId),
      roleId: Value(roleId),
      designationId: Value(designationId),
      departmentId: Value(departmentId),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      genderId: genderId == null && nullToAbsent
          ? const Value.absent()
          : Value(genderId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory StaffData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      staffId: serializer.fromJson<String>(json['staffId']),
      roleId: serializer.fromJson<String>(json['roleId']),
      designationId: serializer.fromJson<String>(json['designationId']),
      departmentId: serializer.fromJson<String>(json['departmentId']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      genderId: serializer.fromJson<String?>(json['genderId']),
      status: serializer.fromJson<String?>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'staffId': serializer.toJson<String>(staffId),
      'roleId': serializer.toJson<String>(roleId),
      'designationId': serializer.toJson<String>(designationId),
      'departmentId': serializer.toJson<String>(departmentId),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'email': serializer.toJson<String?>(email),
      'genderId': serializer.toJson<String?>(genderId),
      'status': serializer.toJson<String?>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  StaffData copyWith(
          {int? id,
          String? userId,
          String? staffId,
          String? roleId,
          String? designationId,
          String? departmentId,
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> genderId = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      StaffData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        staffId: staffId ?? this.staffId,
        roleId: roleId ?? this.roleId,
        designationId: designationId ?? this.designationId,
        departmentId: departmentId ?? this.departmentId,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        email: email.present ? email.value : this.email,
        genderId: genderId.present ? genderId.value : this.genderId,
        status: status.present ? status.value : this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  StaffData copyWithCompanion(StaffCompanion data) {
    return StaffData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      designationId: data.designationId.present
          ? data.designationId.value
          : this.designationId,
      departmentId: data.departmentId.present
          ? data.departmentId.value
          : this.departmentId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      genderId: data.genderId.present ? data.genderId.value : this.genderId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('staffId: $staffId, ')
          ..write('roleId: $roleId, ')
          ..write('designationId: $designationId, ')
          ..write('departmentId: $departmentId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('genderId: $genderId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      staffId,
      roleId,
      designationId,
      departmentId,
      firstName,
      lastName,
      email,
      genderId,
      status,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.staffId == this.staffId &&
          other.roleId == this.roleId &&
          other.designationId == this.designationId &&
          other.departmentId == this.departmentId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.genderId == this.genderId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StaffCompanion extends UpdateCompanion<StaffData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> staffId;
  final Value<String> roleId;
  final Value<String> designationId;
  final Value<String> departmentId;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> email;
  final Value<String?> genderId;
  final Value<String?> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const StaffCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.staffId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.designationId = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.genderId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StaffCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String staffId,
    required String roleId,
    required String designationId,
    required String departmentId,
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.genderId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : userId = Value(userId),
        staffId = Value(staffId),
        roleId = Value(roleId),
        designationId = Value(designationId),
        departmentId = Value(departmentId);
  static Insertable<StaffData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? staffId,
    Expression<String>? roleId,
    Expression<String>? designationId,
    Expression<String>? departmentId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? genderId,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (staffId != null) 'staff_id': staffId,
      if (roleId != null) 'role_id': roleId,
      if (designationId != null) 'designation_id': designationId,
      if (departmentId != null) 'department_id': departmentId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (genderId != null) 'gender_id': genderId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StaffCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? staffId,
      Value<String>? roleId,
      Value<String>? designationId,
      Value<String>? departmentId,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? email,
      Value<String?>? genderId,
      Value<String?>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return StaffCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      staffId: staffId ?? this.staffId,
      roleId: roleId ?? this.roleId,
      designationId: designationId ?? this.designationId,
      departmentId: departmentId ?? this.departmentId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      genderId: genderId ?? this.genderId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    if (designationId.present) {
      map['designation_id'] = Variable<String>(designationId.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<String>(departmentId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<String>(genderId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('staffId: $staffId, ')
          ..write('roleId: $roleId, ')
          ..write('designationId: $designationId, ')
          ..write('departmentId: $departmentId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('genderId: $genderId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MarksGradeTable extends MarksGrade
    with TableInfo<$MarksGradeTable, MarksGradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarksGradeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _percentFromMeta =
      const VerificationMeta('percentFrom');
  @override
  late final GeneratedColumn<double> percentFrom = GeneratedColumn<double>(
      'percent_from', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _percentUptoMeta =
      const VerificationMeta('percentUpto');
  @override
  late final GeneratedColumn<double> percentUpto = GeneratedColumn<double>(
      'percent_upto', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
      'point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        percentFrom,
        percentUpto,
        point,
        remarks,
        sessionId,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'marks_grade';
  @override
  VerificationContext validateIntegrity(Insertable<MarksGradeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('percent_from')) {
      context.handle(
          _percentFromMeta,
          percentFrom.isAcceptableOrUnknown(
              data['percent_from']!, _percentFromMeta));
    } else if (isInserting) {
      context.missing(_percentFromMeta);
    }
    if (data.containsKey('percent_upto')) {
      context.handle(
          _percentUptoMeta,
          percentUpto.isAcceptableOrUnknown(
              data['percent_upto']!, _percentUptoMeta));
    } else if (isInserting) {
      context.missing(_percentUptoMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarksGradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarksGradeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      percentFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percent_from'])!,
      percentUpto: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percent_upto'])!,
      point: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}point'])!,
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $MarksGradeTable createAlias(String alias) {
    return $MarksGradeTable(attachedDatabase, alias);
  }
}

class MarksGradeData extends DataClass implements Insertable<MarksGradeData> {
  final int id;
  final String name;
  final double percentFrom;
  final double percentUpto;
  final int point;
  final String? remarks;
  final int sessionId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  const MarksGradeData(
      {required this.id,
      required this.name,
      required this.percentFrom,
      required this.percentUpto,
      required this.point,
      this.remarks,
      required this.sessionId,
      required this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['percent_from'] = Variable<double>(percentFrom);
    map['percent_upto'] = Variable<double>(percentUpto);
    map['point'] = Variable<int>(point);
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    map['session_id'] = Variable<int>(sessionId);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  MarksGradeCompanion toCompanion(bool nullToAbsent) {
    return MarksGradeCompanion(
      id: Value(id),
      name: Value(name),
      percentFrom: Value(percentFrom),
      percentUpto: Value(percentUpto),
      point: Value(point),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
      sessionId: Value(sessionId),
      status: Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory MarksGradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarksGradeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      percentFrom: serializer.fromJson<double>(json['percentFrom']),
      percentUpto: serializer.fromJson<double>(json['percentUpto']),
      point: serializer.fromJson<int>(json['point']),
      remarks: serializer.fromJson<String?>(json['remarks']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      status: serializer.fromJson<int>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'percentFrom': serializer.toJson<double>(percentFrom),
      'percentUpto': serializer.toJson<double>(percentUpto),
      'point': serializer.toJson<int>(point),
      'remarks': serializer.toJson<String?>(remarks),
      'sessionId': serializer.toJson<int>(sessionId),
      'status': serializer.toJson<int>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  MarksGradeData copyWith(
          {int? id,
          String? name,
          double? percentFrom,
          double? percentUpto,
          int? point,
          Value<String?> remarks = const Value.absent(),
          int? sessionId,
          int? status,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      MarksGradeData(
        id: id ?? this.id,
        name: name ?? this.name,
        percentFrom: percentFrom ?? this.percentFrom,
        percentUpto: percentUpto ?? this.percentUpto,
        point: point ?? this.point,
        remarks: remarks.present ? remarks.value : this.remarks,
        sessionId: sessionId ?? this.sessionId,
        status: status ?? this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  MarksGradeData copyWithCompanion(MarksGradeCompanion data) {
    return MarksGradeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      percentFrom:
          data.percentFrom.present ? data.percentFrom.value : this.percentFrom,
      percentUpto:
          data.percentUpto.present ? data.percentUpto.value : this.percentUpto,
      point: data.point.present ? data.point.value : this.point,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarksGradeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('percentFrom: $percentFrom, ')
          ..write('percentUpto: $percentUpto, ')
          ..write('point: $point, ')
          ..write('remarks: $remarks, ')
          ..write('sessionId: $sessionId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, percentFrom, percentUpto, point,
      remarks, sessionId, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarksGradeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.percentFrom == this.percentFrom &&
          other.percentUpto == this.percentUpto &&
          other.point == this.point &&
          other.remarks == this.remarks &&
          other.sessionId == this.sessionId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MarksGradeCompanion extends UpdateCompanion<MarksGradeData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> percentFrom;
  final Value<double> percentUpto;
  final Value<int> point;
  final Value<String?> remarks;
  final Value<int> sessionId;
  final Value<int> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const MarksGradeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.percentFrom = const Value.absent(),
    this.percentUpto = const Value.absent(),
    this.point = const Value.absent(),
    this.remarks = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MarksGradeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double percentFrom,
    required double percentUpto,
    required int point,
    this.remarks = const Value.absent(),
    required int sessionId,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        percentFrom = Value(percentFrom),
        percentUpto = Value(percentUpto),
        point = Value(point),
        sessionId = Value(sessionId);
  static Insertable<MarksGradeData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? percentFrom,
    Expression<double>? percentUpto,
    Expression<int>? point,
    Expression<String>? remarks,
    Expression<int>? sessionId,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (percentFrom != null) 'percent_from': percentFrom,
      if (percentUpto != null) 'percent_upto': percentUpto,
      if (point != null) 'point': point,
      if (remarks != null) 'remarks': remarks,
      if (sessionId != null) 'session_id': sessionId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MarksGradeCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? percentFrom,
      Value<double>? percentUpto,
      Value<int>? point,
      Value<String?>? remarks,
      Value<int>? sessionId,
      Value<int>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return MarksGradeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      percentFrom: percentFrom ?? this.percentFrom,
      percentUpto: percentUpto ?? this.percentUpto,
      point: point ?? this.point,
      remarks: remarks ?? this.remarks,
      sessionId: sessionId ?? this.sessionId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (percentFrom.present) {
      map['percent_from'] = Variable<double>(percentFrom.value);
    }
    if (percentUpto.present) {
      map['percent_upto'] = Variable<double>(percentUpto.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarksGradeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('percentFrom: $percentFrom, ')
          ..write('percentUpto: $percentUpto, ')
          ..write('point: $point, ')
          ..write('remarks: $remarks, ')
          ..write('sessionId: $sessionId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ParentDetailsTable extends ParentDetails
    with TableInfo<$ParentDetailsTable, ParentDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fatherNameMeta =
      const VerificationMeta('fatherName');
  @override
  late final GeneratedColumn<String> fatherName = GeneratedColumn<String>(
      'father_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherMobileMeta =
      const VerificationMeta('fatherMobile');
  @override
  late final GeneratedColumn<String> fatherMobile = GeneratedColumn<String>(
      'father_mobile', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherProfessionMeta =
      const VerificationMeta('fatherProfession');
  @override
  late final GeneratedColumn<String> fatherProfession = GeneratedColumn<String>(
      'father_profession', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherImageMeta =
      const VerificationMeta('fatherImage');
  @override
  late final GeneratedColumn<String> fatherImage = GeneratedColumn<String>(
      'father_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherNationalityMeta =
      const VerificationMeta('fatherNationality');
  @override
  late final GeneratedColumn<String> fatherNationality =
      GeneratedColumn<String>('father_nationality', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _motherNameMeta =
      const VerificationMeta('motherName');
  @override
  late final GeneratedColumn<String> motherName = GeneratedColumn<String>(
      'mother_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _motherMobileMeta =
      const VerificationMeta('motherMobile');
  @override
  late final GeneratedColumn<String> motherMobile = GeneratedColumn<String>(
      'mother_mobile', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _motherProfessionMeta =
      const VerificationMeta('motherProfession');
  @override
  late final GeneratedColumn<String> motherProfession = GeneratedColumn<String>(
      'mother_profession', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _motherImageMeta =
      const VerificationMeta('motherImage');
  @override
  late final GeneratedColumn<String> motherImage = GeneratedColumn<String>(
      'mother_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianNameMeta =
      const VerificationMeta('guardianName');
  @override
  late final GeneratedColumn<String> guardianName = GeneratedColumn<String>(
      'guardian_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianEmailMeta =
      const VerificationMeta('guardianEmail');
  @override
  late final GeneratedColumn<String> guardianEmail = GeneratedColumn<String>(
      'guardian_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianMobileMeta =
      const VerificationMeta('guardianMobile');
  @override
  late final GeneratedColumn<String> guardianMobile = GeneratedColumn<String>(
      'guardian_mobile', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianImageMeta =
      const VerificationMeta('guardianImage');
  @override
  late final GeneratedColumn<String> guardianImage = GeneratedColumn<String>(
      'guardian_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianProfessionMeta =
      const VerificationMeta('guardianProfession');
  @override
  late final GeneratedColumn<String> guardianProfession =
      GeneratedColumn<String>('guardian_profession', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianRelationMeta =
      const VerificationMeta('guardianRelation');
  @override
  late final GeneratedColumn<String> guardianRelation = GeneratedColumn<String>(
      'guardian_relation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianAddressMeta =
      const VerificationMeta('guardianAddress');
  @override
  late final GeneratedColumn<String> guardianAddress = GeneratedColumn<String>(
      'guardian_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        fatherName,
        fatherMobile,
        fatherProfession,
        fatherImage,
        fatherNationality,
        motherName,
        motherMobile,
        motherProfession,
        motherImage,
        guardianName,
        guardianEmail,
        guardianMobile,
        guardianImage,
        guardianProfession,
        guardianRelation,
        guardianAddress,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent_details';
  @override
  VerificationContext validateIntegrity(Insertable<ParentDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('father_name')) {
      context.handle(
          _fatherNameMeta,
          fatherName.isAcceptableOrUnknown(
              data['father_name']!, _fatherNameMeta));
    }
    if (data.containsKey('father_mobile')) {
      context.handle(
          _fatherMobileMeta,
          fatherMobile.isAcceptableOrUnknown(
              data['father_mobile']!, _fatherMobileMeta));
    }
    if (data.containsKey('father_profession')) {
      context.handle(
          _fatherProfessionMeta,
          fatherProfession.isAcceptableOrUnknown(
              data['father_profession']!, _fatherProfessionMeta));
    }
    if (data.containsKey('father_image')) {
      context.handle(
          _fatherImageMeta,
          fatherImage.isAcceptableOrUnknown(
              data['father_image']!, _fatherImageMeta));
    }
    if (data.containsKey('father_nationality')) {
      context.handle(
          _fatherNationalityMeta,
          fatherNationality.isAcceptableOrUnknown(
              data['father_nationality']!, _fatherNationalityMeta));
    }
    if (data.containsKey('mother_name')) {
      context.handle(
          _motherNameMeta,
          motherName.isAcceptableOrUnknown(
              data['mother_name']!, _motherNameMeta));
    }
    if (data.containsKey('mother_mobile')) {
      context.handle(
          _motherMobileMeta,
          motherMobile.isAcceptableOrUnknown(
              data['mother_mobile']!, _motherMobileMeta));
    }
    if (data.containsKey('mother_profession')) {
      context.handle(
          _motherProfessionMeta,
          motherProfession.isAcceptableOrUnknown(
              data['mother_profession']!, _motherProfessionMeta));
    }
    if (data.containsKey('mother_image')) {
      context.handle(
          _motherImageMeta,
          motherImage.isAcceptableOrUnknown(
              data['mother_image']!, _motherImageMeta));
    }
    if (data.containsKey('guardian_name')) {
      context.handle(
          _guardianNameMeta,
          guardianName.isAcceptableOrUnknown(
              data['guardian_name']!, _guardianNameMeta));
    }
    if (data.containsKey('guardian_email')) {
      context.handle(
          _guardianEmailMeta,
          guardianEmail.isAcceptableOrUnknown(
              data['guardian_email']!, _guardianEmailMeta));
    }
    if (data.containsKey('guardian_mobile')) {
      context.handle(
          _guardianMobileMeta,
          guardianMobile.isAcceptableOrUnknown(
              data['guardian_mobile']!, _guardianMobileMeta));
    }
    if (data.containsKey('guardian_image')) {
      context.handle(
          _guardianImageMeta,
          guardianImage.isAcceptableOrUnknown(
              data['guardian_image']!, _guardianImageMeta));
    }
    if (data.containsKey('guardian_profession')) {
      context.handle(
          _guardianProfessionMeta,
          guardianProfession.isAcceptableOrUnknown(
              data['guardian_profession']!, _guardianProfessionMeta));
    }
    if (data.containsKey('guardian_relation')) {
      context.handle(
          _guardianRelationMeta,
          guardianRelation.isAcceptableOrUnknown(
              data['guardian_relation']!, _guardianRelationMeta));
    }
    if (data.containsKey('guardian_address')) {
      context.handle(
          _guardianAddressMeta,
          guardianAddress.isAcceptableOrUnknown(
              data['guardian_address']!, _guardianAddressMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParentDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParentDetail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      fatherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_name']),
      fatherMobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_mobile']),
      fatherProfession: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}father_profession']),
      fatherImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_image']),
      fatherNationality: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}father_nationality']),
      motherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mother_name']),
      motherMobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mother_mobile']),
      motherProfession: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}mother_profession']),
      motherImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mother_image']),
      guardianName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_name']),
      guardianEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_email']),
      guardianMobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_mobile']),
      guardianImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_image']),
      guardianProfession: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_profession']),
      guardianRelation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_relation']),
      guardianAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_address']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ParentDetailsTable createAlias(String alias) {
    return $ParentDetailsTable(attachedDatabase, alias);
  }
}

class ParentDetail extends DataClass implements Insertable<ParentDetail> {
  final int id;
  final int userId;
  final String? fatherName;
  final String? fatherMobile;
  final String? fatherProfession;
  final String? fatherImage;
  final String? fatherNationality;
  final String? motherName;
  final String? motherMobile;
  final String? motherProfession;
  final String? motherImage;
  final String? guardianName;
  final String? guardianEmail;
  final String? guardianMobile;
  final String? guardianImage;
  final String? guardianProfession;
  final String? guardianRelation;
  final String? guardianAddress;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  const ParentDetail(
      {required this.id,
      required this.userId,
      this.fatherName,
      this.fatherMobile,
      this.fatherProfession,
      this.fatherImage,
      this.fatherNationality,
      this.motherName,
      this.motherMobile,
      this.motherProfession,
      this.motherImage,
      this.guardianName,
      this.guardianEmail,
      this.guardianMobile,
      this.guardianImage,
      this.guardianProfession,
      this.guardianRelation,
      this.guardianAddress,
      required this.status,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || fatherMobile != null) {
      map['father_mobile'] = Variable<String>(fatherMobile);
    }
    if (!nullToAbsent || fatherProfession != null) {
      map['father_profession'] = Variable<String>(fatherProfession);
    }
    if (!nullToAbsent || fatherImage != null) {
      map['father_image'] = Variable<String>(fatherImage);
    }
    if (!nullToAbsent || fatherNationality != null) {
      map['father_nationality'] = Variable<String>(fatherNationality);
    }
    if (!nullToAbsent || motherName != null) {
      map['mother_name'] = Variable<String>(motherName);
    }
    if (!nullToAbsent || motherMobile != null) {
      map['mother_mobile'] = Variable<String>(motherMobile);
    }
    if (!nullToAbsent || motherProfession != null) {
      map['mother_profession'] = Variable<String>(motherProfession);
    }
    if (!nullToAbsent || motherImage != null) {
      map['mother_image'] = Variable<String>(motherImage);
    }
    if (!nullToAbsent || guardianName != null) {
      map['guardian_name'] = Variable<String>(guardianName);
    }
    if (!nullToAbsent || guardianEmail != null) {
      map['guardian_email'] = Variable<String>(guardianEmail);
    }
    if (!nullToAbsent || guardianMobile != null) {
      map['guardian_mobile'] = Variable<String>(guardianMobile);
    }
    if (!nullToAbsent || guardianImage != null) {
      map['guardian_image'] = Variable<String>(guardianImage);
    }
    if (!nullToAbsent || guardianProfession != null) {
      map['guardian_profession'] = Variable<String>(guardianProfession);
    }
    if (!nullToAbsent || guardianRelation != null) {
      map['guardian_relation'] = Variable<String>(guardianRelation);
    }
    if (!nullToAbsent || guardianAddress != null) {
      map['guardian_address'] = Variable<String>(guardianAddress);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  ParentDetailsCompanion toCompanion(bool nullToAbsent) {
    return ParentDetailsCompanion(
      id: Value(id),
      userId: Value(userId),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      fatherMobile: fatherMobile == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherMobile),
      fatherProfession: fatherProfession == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherProfession),
      fatherImage: fatherImage == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherImage),
      fatherNationality: fatherNationality == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherNationality),
      motherName: motherName == null && nullToAbsent
          ? const Value.absent()
          : Value(motherName),
      motherMobile: motherMobile == null && nullToAbsent
          ? const Value.absent()
          : Value(motherMobile),
      motherProfession: motherProfession == null && nullToAbsent
          ? const Value.absent()
          : Value(motherProfession),
      motherImage: motherImage == null && nullToAbsent
          ? const Value.absent()
          : Value(motherImage),
      guardianName: guardianName == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianName),
      guardianEmail: guardianEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianEmail),
      guardianMobile: guardianMobile == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianMobile),
      guardianImage: guardianImage == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianImage),
      guardianProfession: guardianProfession == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianProfession),
      guardianRelation: guardianRelation == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianRelation),
      guardianAddress: guardianAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianAddress),
      status: Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ParentDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParentDetail(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      fatherName: serializer.fromJson<String?>(json['fatherName']),
      fatherMobile: serializer.fromJson<String?>(json['fatherMobile']),
      fatherProfession: serializer.fromJson<String?>(json['fatherProfession']),
      fatherImage: serializer.fromJson<String?>(json['fatherImage']),
      fatherNationality:
          serializer.fromJson<String?>(json['fatherNationality']),
      motherName: serializer.fromJson<String?>(json['motherName']),
      motherMobile: serializer.fromJson<String?>(json['motherMobile']),
      motherProfession: serializer.fromJson<String?>(json['motherProfession']),
      motherImage: serializer.fromJson<String?>(json['motherImage']),
      guardianName: serializer.fromJson<String?>(json['guardianName']),
      guardianEmail: serializer.fromJson<String?>(json['guardianEmail']),
      guardianMobile: serializer.fromJson<String?>(json['guardianMobile']),
      guardianImage: serializer.fromJson<String?>(json['guardianImage']),
      guardianProfession:
          serializer.fromJson<String?>(json['guardianProfession']),
      guardianRelation: serializer.fromJson<String?>(json['guardianRelation']),
      guardianAddress: serializer.fromJson<String?>(json['guardianAddress']),
      status: serializer.fromJson<int>(json['status']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'fatherName': serializer.toJson<String?>(fatherName),
      'fatherMobile': serializer.toJson<String?>(fatherMobile),
      'fatherProfession': serializer.toJson<String?>(fatherProfession),
      'fatherImage': serializer.toJson<String?>(fatherImage),
      'fatherNationality': serializer.toJson<String?>(fatherNationality),
      'motherName': serializer.toJson<String?>(motherName),
      'motherMobile': serializer.toJson<String?>(motherMobile),
      'motherProfession': serializer.toJson<String?>(motherProfession),
      'motherImage': serializer.toJson<String?>(motherImage),
      'guardianName': serializer.toJson<String?>(guardianName),
      'guardianEmail': serializer.toJson<String?>(guardianEmail),
      'guardianMobile': serializer.toJson<String?>(guardianMobile),
      'guardianImage': serializer.toJson<String?>(guardianImage),
      'guardianProfession': serializer.toJson<String?>(guardianProfession),
      'guardianRelation': serializer.toJson<String?>(guardianRelation),
      'guardianAddress': serializer.toJson<String?>(guardianAddress),
      'status': serializer.toJson<int>(status),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  ParentDetail copyWith(
          {int? id,
          int? userId,
          Value<String?> fatherName = const Value.absent(),
          Value<String?> fatherMobile = const Value.absent(),
          Value<String?> fatherProfession = const Value.absent(),
          Value<String?> fatherImage = const Value.absent(),
          Value<String?> fatherNationality = const Value.absent(),
          Value<String?> motherName = const Value.absent(),
          Value<String?> motherMobile = const Value.absent(),
          Value<String?> motherProfession = const Value.absent(),
          Value<String?> motherImage = const Value.absent(),
          Value<String?> guardianName = const Value.absent(),
          Value<String?> guardianEmail = const Value.absent(),
          Value<String?> guardianMobile = const Value.absent(),
          Value<String?> guardianImage = const Value.absent(),
          Value<String?> guardianProfession = const Value.absent(),
          Value<String?> guardianRelation = const Value.absent(),
          Value<String?> guardianAddress = const Value.absent(),
          int? status,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      ParentDetail(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        fatherName: fatherName.present ? fatherName.value : this.fatherName,
        fatherMobile:
            fatherMobile.present ? fatherMobile.value : this.fatherMobile,
        fatherProfession: fatherProfession.present
            ? fatherProfession.value
            : this.fatherProfession,
        fatherImage: fatherImage.present ? fatherImage.value : this.fatherImage,
        fatherNationality: fatherNationality.present
            ? fatherNationality.value
            : this.fatherNationality,
        motherName: motherName.present ? motherName.value : this.motherName,
        motherMobile:
            motherMobile.present ? motherMobile.value : this.motherMobile,
        motherProfession: motherProfession.present
            ? motherProfession.value
            : this.motherProfession,
        motherImage: motherImage.present ? motherImage.value : this.motherImage,
        guardianName:
            guardianName.present ? guardianName.value : this.guardianName,
        guardianEmail:
            guardianEmail.present ? guardianEmail.value : this.guardianEmail,
        guardianMobile:
            guardianMobile.present ? guardianMobile.value : this.guardianMobile,
        guardianImage:
            guardianImage.present ? guardianImage.value : this.guardianImage,
        guardianProfession: guardianProfession.present
            ? guardianProfession.value
            : this.guardianProfession,
        guardianRelation: guardianRelation.present
            ? guardianRelation.value
            : this.guardianRelation,
        guardianAddress: guardianAddress.present
            ? guardianAddress.value
            : this.guardianAddress,
        status: status ?? this.status,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  ParentDetail copyWithCompanion(ParentDetailsCompanion data) {
    return ParentDetail(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      fatherName:
          data.fatherName.present ? data.fatherName.value : this.fatherName,
      fatherMobile: data.fatherMobile.present
          ? data.fatherMobile.value
          : this.fatherMobile,
      fatherProfession: data.fatherProfession.present
          ? data.fatherProfession.value
          : this.fatherProfession,
      fatherImage:
          data.fatherImage.present ? data.fatherImage.value : this.fatherImage,
      fatherNationality: data.fatherNationality.present
          ? data.fatherNationality.value
          : this.fatherNationality,
      motherName:
          data.motherName.present ? data.motherName.value : this.motherName,
      motherMobile: data.motherMobile.present
          ? data.motherMobile.value
          : this.motherMobile,
      motherProfession: data.motherProfession.present
          ? data.motherProfession.value
          : this.motherProfession,
      motherImage:
          data.motherImage.present ? data.motherImage.value : this.motherImage,
      guardianName: data.guardianName.present
          ? data.guardianName.value
          : this.guardianName,
      guardianEmail: data.guardianEmail.present
          ? data.guardianEmail.value
          : this.guardianEmail,
      guardianMobile: data.guardianMobile.present
          ? data.guardianMobile.value
          : this.guardianMobile,
      guardianImage: data.guardianImage.present
          ? data.guardianImage.value
          : this.guardianImage,
      guardianProfession: data.guardianProfession.present
          ? data.guardianProfession.value
          : this.guardianProfession,
      guardianRelation: data.guardianRelation.present
          ? data.guardianRelation.value
          : this.guardianRelation,
      guardianAddress: data.guardianAddress.present
          ? data.guardianAddress.value
          : this.guardianAddress,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParentDetail(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('fatherName: $fatherName, ')
          ..write('fatherMobile: $fatherMobile, ')
          ..write('fatherProfession: $fatherProfession, ')
          ..write('fatherImage: $fatherImage, ')
          ..write('fatherNationality: $fatherNationality, ')
          ..write('motherName: $motherName, ')
          ..write('motherMobile: $motherMobile, ')
          ..write('motherProfession: $motherProfession, ')
          ..write('motherImage: $motherImage, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianEmail: $guardianEmail, ')
          ..write('guardianMobile: $guardianMobile, ')
          ..write('guardianImage: $guardianImage, ')
          ..write('guardianProfession: $guardianProfession, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('guardianAddress: $guardianAddress, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        userId,
        fatherName,
        fatherMobile,
        fatherProfession,
        fatherImage,
        fatherNationality,
        motherName,
        motherMobile,
        motherProfession,
        motherImage,
        guardianName,
        guardianEmail,
        guardianMobile,
        guardianImage,
        guardianProfession,
        guardianRelation,
        guardianAddress,
        status,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentDetail &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.fatherName == this.fatherName &&
          other.fatherMobile == this.fatherMobile &&
          other.fatherProfession == this.fatherProfession &&
          other.fatherImage == this.fatherImage &&
          other.fatherNationality == this.fatherNationality &&
          other.motherName == this.motherName &&
          other.motherMobile == this.motherMobile &&
          other.motherProfession == this.motherProfession &&
          other.motherImage == this.motherImage &&
          other.guardianName == this.guardianName &&
          other.guardianEmail == this.guardianEmail &&
          other.guardianMobile == this.guardianMobile &&
          other.guardianImage == this.guardianImage &&
          other.guardianProfession == this.guardianProfession &&
          other.guardianRelation == this.guardianRelation &&
          other.guardianAddress == this.guardianAddress &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ParentDetailsCompanion extends UpdateCompanion<ParentDetail> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String?> fatherName;
  final Value<String?> fatherMobile;
  final Value<String?> fatherProfession;
  final Value<String?> fatherImage;
  final Value<String?> fatherNationality;
  final Value<String?> motherName;
  final Value<String?> motherMobile;
  final Value<String?> motherProfession;
  final Value<String?> motherImage;
  final Value<String?> guardianName;
  final Value<String?> guardianEmail;
  final Value<String?> guardianMobile;
  final Value<String?> guardianImage;
  final Value<String?> guardianProfession;
  final Value<String?> guardianRelation;
  final Value<String?> guardianAddress;
  final Value<int> status;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const ParentDetailsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.fatherMobile = const Value.absent(),
    this.fatherProfession = const Value.absent(),
    this.fatherImage = const Value.absent(),
    this.fatherNationality = const Value.absent(),
    this.motherName = const Value.absent(),
    this.motherMobile = const Value.absent(),
    this.motherProfession = const Value.absent(),
    this.motherImage = const Value.absent(),
    this.guardianName = const Value.absent(),
    this.guardianEmail = const Value.absent(),
    this.guardianMobile = const Value.absent(),
    this.guardianImage = const Value.absent(),
    this.guardianProfession = const Value.absent(),
    this.guardianRelation = const Value.absent(),
    this.guardianAddress = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ParentDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.fatherName = const Value.absent(),
    this.fatherMobile = const Value.absent(),
    this.fatherProfession = const Value.absent(),
    this.fatherImage = const Value.absent(),
    this.fatherNationality = const Value.absent(),
    this.motherName = const Value.absent(),
    this.motherMobile = const Value.absent(),
    this.motherProfession = const Value.absent(),
    this.motherImage = const Value.absent(),
    this.guardianName = const Value.absent(),
    this.guardianEmail = const Value.absent(),
    this.guardianMobile = const Value.absent(),
    this.guardianImage = const Value.absent(),
    this.guardianProfession = const Value.absent(),
    this.guardianRelation = const Value.absent(),
    this.guardianAddress = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<ParentDetail> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? fatherName,
    Expression<String>? fatherMobile,
    Expression<String>? fatherProfession,
    Expression<String>? fatherImage,
    Expression<String>? fatherNationality,
    Expression<String>? motherName,
    Expression<String>? motherMobile,
    Expression<String>? motherProfession,
    Expression<String>? motherImage,
    Expression<String>? guardianName,
    Expression<String>? guardianEmail,
    Expression<String>? guardianMobile,
    Expression<String>? guardianImage,
    Expression<String>? guardianProfession,
    Expression<String>? guardianRelation,
    Expression<String>? guardianAddress,
    Expression<int>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (fatherName != null) 'father_name': fatherName,
      if (fatherMobile != null) 'father_mobile': fatherMobile,
      if (fatherProfession != null) 'father_profession': fatherProfession,
      if (fatherImage != null) 'father_image': fatherImage,
      if (fatherNationality != null) 'father_nationality': fatherNationality,
      if (motherName != null) 'mother_name': motherName,
      if (motherMobile != null) 'mother_mobile': motherMobile,
      if (motherProfession != null) 'mother_profession': motherProfession,
      if (motherImage != null) 'mother_image': motherImage,
      if (guardianName != null) 'guardian_name': guardianName,
      if (guardianEmail != null) 'guardian_email': guardianEmail,
      if (guardianMobile != null) 'guardian_mobile': guardianMobile,
      if (guardianImage != null) 'guardian_image': guardianImage,
      if (guardianProfession != null) 'guardian_profession': guardianProfession,
      if (guardianRelation != null) 'guardian_relation': guardianRelation,
      if (guardianAddress != null) 'guardian_address': guardianAddress,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ParentDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String?>? fatherName,
      Value<String?>? fatherMobile,
      Value<String?>? fatherProfession,
      Value<String?>? fatherImage,
      Value<String?>? fatherNationality,
      Value<String?>? motherName,
      Value<String?>? motherMobile,
      Value<String?>? motherProfession,
      Value<String?>? motherImage,
      Value<String?>? guardianName,
      Value<String?>? guardianEmail,
      Value<String?>? guardianMobile,
      Value<String?>? guardianImage,
      Value<String?>? guardianProfession,
      Value<String?>? guardianRelation,
      Value<String?>? guardianAddress,
      Value<int>? status,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return ParentDetailsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fatherName: fatherName ?? this.fatherName,
      fatherMobile: fatherMobile ?? this.fatherMobile,
      fatherProfession: fatherProfession ?? this.fatherProfession,
      fatherImage: fatherImage ?? this.fatherImage,
      fatherNationality: fatherNationality ?? this.fatherNationality,
      motherName: motherName ?? this.motherName,
      motherMobile: motherMobile ?? this.motherMobile,
      motherProfession: motherProfession ?? this.motherProfession,
      motherImage: motherImage ?? this.motherImage,
      guardianName: guardianName ?? this.guardianName,
      guardianEmail: guardianEmail ?? this.guardianEmail,
      guardianMobile: guardianMobile ?? this.guardianMobile,
      guardianImage: guardianImage ?? this.guardianImage,
      guardianProfession: guardianProfession ?? this.guardianProfession,
      guardianRelation: guardianRelation ?? this.guardianRelation,
      guardianAddress: guardianAddress ?? this.guardianAddress,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (fatherMobile.present) {
      map['father_mobile'] = Variable<String>(fatherMobile.value);
    }
    if (fatherProfession.present) {
      map['father_profession'] = Variable<String>(fatherProfession.value);
    }
    if (fatherImage.present) {
      map['father_image'] = Variable<String>(fatherImage.value);
    }
    if (fatherNationality.present) {
      map['father_nationality'] = Variable<String>(fatherNationality.value);
    }
    if (motherName.present) {
      map['mother_name'] = Variable<String>(motherName.value);
    }
    if (motherMobile.present) {
      map['mother_mobile'] = Variable<String>(motherMobile.value);
    }
    if (motherProfession.present) {
      map['mother_profession'] = Variable<String>(motherProfession.value);
    }
    if (motherImage.present) {
      map['mother_image'] = Variable<String>(motherImage.value);
    }
    if (guardianName.present) {
      map['guardian_name'] = Variable<String>(guardianName.value);
    }
    if (guardianEmail.present) {
      map['guardian_email'] = Variable<String>(guardianEmail.value);
    }
    if (guardianMobile.present) {
      map['guardian_mobile'] = Variable<String>(guardianMobile.value);
    }
    if (guardianImage.present) {
      map['guardian_image'] = Variable<String>(guardianImage.value);
    }
    if (guardianProfession.present) {
      map['guardian_profession'] = Variable<String>(guardianProfession.value);
    }
    if (guardianRelation.present) {
      map['guardian_relation'] = Variable<String>(guardianRelation.value);
    }
    if (guardianAddress.present) {
      map['guardian_address'] = Variable<String>(guardianAddress.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentDetailsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('fatherName: $fatherName, ')
          ..write('fatherMobile: $fatherMobile, ')
          ..write('fatherProfession: $fatherProfession, ')
          ..write('fatherImage: $fatherImage, ')
          ..write('fatherNationality: $fatherNationality, ')
          ..write('motherName: $motherName, ')
          ..write('motherMobile: $motherMobile, ')
          ..write('motherProfession: $motherProfession, ')
          ..write('motherImage: $motherImage, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianEmail: $guardianEmail, ')
          ..write('guardianMobile: $guardianMobile, ')
          ..write('guardianImage: $guardianImage, ')
          ..write('guardianProfession: $guardianProfession, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('guardianAddress: $guardianAddress, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NoticeBoardsTable extends NoticeBoards
    with TableInfo<$NoticeBoardsTable, NoticeBoard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoticeBoardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishDateMeta =
      const VerificationMeta('publishDate');
  @override
  late final GeneratedColumn<String> publishDate = GeneratedColumn<String>(
      'publish_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<String> attachment = GeneratedColumn<String>(
      'attachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isVisibleWebMeta =
      const VerificationMeta('isVisibleWeb');
  @override
  late final GeneratedColumn<int> isVisibleWeb = GeneratedColumn<int>(
      'is_visible_web', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _visibleToMeta =
      const VerificationMeta('visibleTo');
  @override
  late final GeneratedColumn<String> visibleTo = GeneratedColumn<String>(
      'visible_to', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        date,
        publishDate,
        description,
        attachment,
        isVisibleWeb,
        status,
        visibleTo,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notice_boards';
  @override
  VerificationContext validateIntegrity(Insertable<NoticeBoard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('publish_date')) {
      context.handle(
          _publishDateMeta,
          publishDate.isAcceptableOrUnknown(
              data['publish_date']!, _publishDateMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    if (data.containsKey('is_visible_web')) {
      context.handle(
          _isVisibleWebMeta,
          isVisibleWeb.isAcceptableOrUnknown(
              data['is_visible_web']!, _isVisibleWebMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('visible_to')) {
      context.handle(_visibleToMeta,
          visibleTo.isAcceptableOrUnknown(data['visible_to']!, _visibleToMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoticeBoard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoticeBoard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      publishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publish_date']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment']),
      isVisibleWeb: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_visible_web']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      visibleTo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}visible_to']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $NoticeBoardsTable createAlias(String alias) {
    return $NoticeBoardsTable(attachedDatabase, alias);
  }
}

class NoticeBoard extends DataClass implements Insertable<NoticeBoard> {
  final int id;
  final String? title;
  final String? date;
  final String? publishDate;
  final String? description;
  final String? attachment;
  final int? isVisibleWeb;
  final int? status;
  final String? visibleTo;
  final String? createdAt;
  final String? updatedAt;
  const NoticeBoard(
      {required this.id,
      this.title,
      this.date,
      this.publishDate,
      this.description,
      this.attachment,
      this.isVisibleWeb,
      this.status,
      this.visibleTo,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || publishDate != null) {
      map['publish_date'] = Variable<String>(publishDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<String>(attachment);
    }
    if (!nullToAbsent || isVisibleWeb != null) {
      map['is_visible_web'] = Variable<int>(isVisibleWeb);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || visibleTo != null) {
      map['visible_to'] = Variable<String>(visibleTo);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  NoticeBoardsCompanion toCompanion(bool nullToAbsent) {
    return NoticeBoardsCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      publishDate: publishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
      isVisibleWeb: isVisibleWeb == null && nullToAbsent
          ? const Value.absent()
          : Value(isVisibleWeb),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      visibleTo: visibleTo == null && nullToAbsent
          ? const Value.absent()
          : Value(visibleTo),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory NoticeBoard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoticeBoard(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      date: serializer.fromJson<String?>(json['date']),
      publishDate: serializer.fromJson<String?>(json['publishDate']),
      description: serializer.fromJson<String?>(json['description']),
      attachment: serializer.fromJson<String?>(json['attachment']),
      isVisibleWeb: serializer.fromJson<int?>(json['isVisibleWeb']),
      status: serializer.fromJson<int?>(json['status']),
      visibleTo: serializer.fromJson<String?>(json['visibleTo']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'date': serializer.toJson<String?>(date),
      'publishDate': serializer.toJson<String?>(publishDate),
      'description': serializer.toJson<String?>(description),
      'attachment': serializer.toJson<String?>(attachment),
      'isVisibleWeb': serializer.toJson<int?>(isVisibleWeb),
      'status': serializer.toJson<int?>(status),
      'visibleTo': serializer.toJson<String?>(visibleTo),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  NoticeBoard copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> date = const Value.absent(),
          Value<String?> publishDate = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> attachment = const Value.absent(),
          Value<int?> isVisibleWeb = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<String?> visibleTo = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      NoticeBoard(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        date: date.present ? date.value : this.date,
        publishDate: publishDate.present ? publishDate.value : this.publishDate,
        description: description.present ? description.value : this.description,
        attachment: attachment.present ? attachment.value : this.attachment,
        isVisibleWeb:
            isVisibleWeb.present ? isVisibleWeb.value : this.isVisibleWeb,
        status: status.present ? status.value : this.status,
        visibleTo: visibleTo.present ? visibleTo.value : this.visibleTo,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  NoticeBoard copyWithCompanion(NoticeBoardsCompanion data) {
    return NoticeBoard(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      publishDate:
          data.publishDate.present ? data.publishDate.value : this.publishDate,
      description:
          data.description.present ? data.description.value : this.description,
      attachment:
          data.attachment.present ? data.attachment.value : this.attachment,
      isVisibleWeb: data.isVisibleWeb.present
          ? data.isVisibleWeb.value
          : this.isVisibleWeb,
      status: data.status.present ? data.status.value : this.status,
      visibleTo: data.visibleTo.present ? data.visibleTo.value : this.visibleTo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoticeBoard(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('publishDate: $publishDate, ')
          ..write('description: $description, ')
          ..write('attachment: $attachment, ')
          ..write('isVisibleWeb: $isVisibleWeb, ')
          ..write('status: $status, ')
          ..write('visibleTo: $visibleTo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, publishDate, description,
      attachment, isVisibleWeb, status, visibleTo, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoticeBoard &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.publishDate == this.publishDate &&
          other.description == this.description &&
          other.attachment == this.attachment &&
          other.isVisibleWeb == this.isVisibleWeb &&
          other.status == this.status &&
          other.visibleTo == this.visibleTo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NoticeBoardsCompanion extends UpdateCompanion<NoticeBoard> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> date;
  final Value<String?> publishDate;
  final Value<String?> description;
  final Value<String?> attachment;
  final Value<int?> isVisibleWeb;
  final Value<int?> status;
  final Value<String?> visibleTo;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const NoticeBoardsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.description = const Value.absent(),
    this.attachment = const Value.absent(),
    this.isVisibleWeb = const Value.absent(),
    this.status = const Value.absent(),
    this.visibleTo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NoticeBoardsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.description = const Value.absent(),
    this.attachment = const Value.absent(),
    this.isVisibleWeb = const Value.absent(),
    this.status = const Value.absent(),
    this.visibleTo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<NoticeBoard> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? date,
    Expression<String>? publishDate,
    Expression<String>? description,
    Expression<String>? attachment,
    Expression<int>? isVisibleWeb,
    Expression<int>? status,
    Expression<String>? visibleTo,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (publishDate != null) 'publish_date': publishDate,
      if (description != null) 'description': description,
      if (attachment != null) 'attachment': attachment,
      if (isVisibleWeb != null) 'is_visible_web': isVisibleWeb,
      if (status != null) 'status': status,
      if (visibleTo != null) 'visible_to': visibleTo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NoticeBoardsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? date,
      Value<String?>? publishDate,
      Value<String?>? description,
      Value<String?>? attachment,
      Value<int?>? isVisibleWeb,
      Value<int?>? status,
      Value<String?>? visibleTo,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return NoticeBoardsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      publishDate: publishDate ?? this.publishDate,
      description: description ?? this.description,
      attachment: attachment ?? this.attachment,
      isVisibleWeb: isVisibleWeb ?? this.isVisibleWeb,
      status: status ?? this.status,
      visibleTo: visibleTo ?? this.visibleTo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<String>(publishDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<String>(attachment.value);
    }
    if (isVisibleWeb.present) {
      map['is_visible_web'] = Variable<int>(isVisibleWeb.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (visibleTo.present) {
      map['visible_to'] = Variable<String>(visibleTo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoticeBoardsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('publishDate: $publishDate, ')
          ..write('description: $description, ')
          ..write('attachment: $attachment, ')
          ..write('isVisibleWeb: $isVisibleWeb, ')
          ..write('status: $status, ')
          ..write('visibleTo: $visibleTo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StudentsListTable extends StudentsList
    with TableInfo<$StudentsListTable, StudentsListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsListTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _admissionNoMeta =
      const VerificationMeta('admissionNo');
  @override
  late final GeneratedColumn<String> admissionNo = GeneratedColumn<String>(
      'admission_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rollNoMeta = const VerificationMeta('rollNo');
  @override
  late final GeneratedColumn<int> rollNo = GeneratedColumn<int>(
      'roll_no', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
      'mobile', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String> dob = GeneratedColumn<String>(
      'dob', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _admissionDateMeta =
      const VerificationMeta('admissionDate');
  @override
  late final GeneratedColumn<String> admissionDate = GeneratedColumn<String>(
      'admission_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _studentCategoryIdMeta =
      const VerificationMeta('studentCategoryId');
  @override
  late final GeneratedColumn<int> studentCategoryId = GeneratedColumn<int>(
      'student_category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _religionIdMeta =
      const VerificationMeta('religionId');
  @override
  late final GeneratedColumn<int> religionId = GeneratedColumn<int>(
      'religion_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bloodGroupIdMeta =
      const VerificationMeta('bloodGroupId');
  @override
  late final GeneratedColumn<int> bloodGroupId = GeneratedColumn<int>(
      'blood_group_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  @override
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imageIdMeta =
      const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<int> imageId = GeneratedColumn<int>(
      'image_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _parentGuardianIdMeta =
      const VerificationMeta('parentGuardianId');
  @override
  late final GeneratedColumn<int> parentGuardianId = GeneratedColumn<int>(
      'parent_guardian_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _uploadDocumentsMeta =
      const VerificationMeta('uploadDocuments');
  @override
  late final GeneratedColumn<String> uploadDocuments = GeneratedColumn<String>(
      'upload_documents', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolMeta =
      const VerificationMeta('previousSchool');
  @override
  late final GeneratedColumn<int> previousSchool = GeneratedColumn<int>(
      'previous_school', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolInfoMeta =
      const VerificationMeta('previousSchoolInfo');
  @override
  late final GeneratedColumn<String> previousSchoolInfo =
      GeneratedColumn<String>('previous_school_info', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _previousSchoolImageIdMeta =
      const VerificationMeta('previousSchoolImageId');
  @override
  late final GeneratedColumn<int> previousSchoolImageId = GeneratedColumn<int>(
      'previous_school_image_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _placeOfBirthMeta =
      const VerificationMeta('placeOfBirth');
  @override
  late final GeneratedColumn<String> placeOfBirth = GeneratedColumn<String>(
      'place_of_birth', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nationalityMeta =
      const VerificationMeta('nationality');
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
      'nationality', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cprNoMeta = const VerificationMeta('cprNo');
  @override
  late final GeneratedColumn<String> cprNo = GeneratedColumn<String>(
      'cpr_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _spokenLangAtHomeMeta =
      const VerificationMeta('spokenLangAtHome');
  @override
  late final GeneratedColumn<String> spokenLangAtHome = GeneratedColumn<String>(
      'spoken_lang_at_home', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _residanceAddressMeta =
      const VerificationMeta('residanceAddress');
  @override
  late final GeneratedColumn<String> residanceAddress = GeneratedColumn<String>(
      'residance_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _controlNumberMeta =
      const VerificationMeta('controlNumber');
  @override
  late final GeneratedColumn<String> controlNumber = GeneratedColumn<String>(
      'control_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _availableMeta =
      const VerificationMeta('available');
  @override
  late final GeneratedColumn<String> available = GeneratedColumn<String>(
      'available', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        admissionNo,
        rollNo,
        firstName,
        lastName,
        mobile,
        email,
        dob,
        admissionDate,
        studentCategoryId,
        religionId,
        bloodGroupId,
        genderId,
        categoryId,
        imageId,
        parentGuardianId,
        userId,
        uploadDocuments,
        status,
        previousSchool,
        previousSchoolInfo,
        previousSchoolImageId,
        placeOfBirth,
        nationality,
        cprNo,
        spokenLangAtHome,
        residanceAddress,
        controlNumber,
        available,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students_list';
  @override
  VerificationContext validateIntegrity(Insertable<StudentsListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('admission_no')) {
      context.handle(
          _admissionNoMeta,
          admissionNo.isAcceptableOrUnknown(
              data['admission_no']!, _admissionNoMeta));
    }
    if (data.containsKey('roll_no')) {
      context.handle(_rollNoMeta,
          rollNo.isAcceptableOrUnknown(data['roll_no']!, _rollNoMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('admission_date')) {
      context.handle(
          _admissionDateMeta,
          admissionDate.isAcceptableOrUnknown(
              data['admission_date']!, _admissionDateMeta));
    }
    if (data.containsKey('student_category_id')) {
      context.handle(
          _studentCategoryIdMeta,
          studentCategoryId.isAcceptableOrUnknown(
              data['student_category_id']!, _studentCategoryIdMeta));
    }
    if (data.containsKey('religion_id')) {
      context.handle(
          _religionIdMeta,
          religionId.isAcceptableOrUnknown(
              data['religion_id']!, _religionIdMeta));
    }
    if (data.containsKey('blood_group_id')) {
      context.handle(
          _bloodGroupIdMeta,
          bloodGroupId.isAcceptableOrUnknown(
              data['blood_group_id']!, _bloodGroupIdMeta));
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    }
    if (data.containsKey('parent_guardian_id')) {
      context.handle(
          _parentGuardianIdMeta,
          parentGuardianId.isAcceptableOrUnknown(
              data['parent_guardian_id']!, _parentGuardianIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('upload_documents')) {
      context.handle(
          _uploadDocumentsMeta,
          uploadDocuments.isAcceptableOrUnknown(
              data['upload_documents']!, _uploadDocumentsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('previous_school')) {
      context.handle(
          _previousSchoolMeta,
          previousSchool.isAcceptableOrUnknown(
              data['previous_school']!, _previousSchoolMeta));
    }
    if (data.containsKey('previous_school_info')) {
      context.handle(
          _previousSchoolInfoMeta,
          previousSchoolInfo.isAcceptableOrUnknown(
              data['previous_school_info']!, _previousSchoolInfoMeta));
    }
    if (data.containsKey('previous_school_image_id')) {
      context.handle(
          _previousSchoolImageIdMeta,
          previousSchoolImageId.isAcceptableOrUnknown(
              data['previous_school_image_id']!, _previousSchoolImageIdMeta));
    }
    if (data.containsKey('place_of_birth')) {
      context.handle(
          _placeOfBirthMeta,
          placeOfBirth.isAcceptableOrUnknown(
              data['place_of_birth']!, _placeOfBirthMeta));
    }
    if (data.containsKey('nationality')) {
      context.handle(
          _nationalityMeta,
          nationality.isAcceptableOrUnknown(
              data['nationality']!, _nationalityMeta));
    }
    if (data.containsKey('cpr_no')) {
      context.handle(
          _cprNoMeta, cprNo.isAcceptableOrUnknown(data['cpr_no']!, _cprNoMeta));
    }
    if (data.containsKey('spoken_lang_at_home')) {
      context.handle(
          _spokenLangAtHomeMeta,
          spokenLangAtHome.isAcceptableOrUnknown(
              data['spoken_lang_at_home']!, _spokenLangAtHomeMeta));
    }
    if (data.containsKey('residance_address')) {
      context.handle(
          _residanceAddressMeta,
          residanceAddress.isAcceptableOrUnknown(
              data['residance_address']!, _residanceAddressMeta));
    }
    if (data.containsKey('control_number')) {
      context.handle(
          _controlNumberMeta,
          controlNumber.isAcceptableOrUnknown(
              data['control_number']!, _controlNumberMeta));
    }
    if (data.containsKey('available')) {
      context.handle(_availableMeta,
          available.isAcceptableOrUnknown(data['available']!, _availableMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentsListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentsListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      admissionNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admission_no']),
      rollNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}roll_no']),
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      mobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dob']),
      admissionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admission_date']),
      studentCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}student_category_id']),
      religionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}religion_id']),
      bloodGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}blood_group_id']),
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      imageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image_id']),
      parentGuardianId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_guardian_id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id']),
      uploadDocuments: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}upload_documents']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status']),
      previousSchool: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}previous_school']),
      previousSchoolInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}previous_school_info']),
      previousSchoolImageId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}previous_school_image_id']),
      placeOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place_of_birth']),
      nationality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality']),
      cprNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cpr_no']),
      spokenLangAtHome: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}spoken_lang_at_home']),
      residanceAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}residance_address']),
      controlNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}control_number']),
      available: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}available']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $StudentsListTable createAlias(String alias) {
    return $StudentsListTable(attachedDatabase, alias);
  }
}

class StudentsListData extends DataClass
    implements Insertable<StudentsListData> {
  final int id;
  final String? admissionNo;
  final int? rollNo;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final String? dob;
  final String? admissionDate;
  final int? studentCategoryId;
  final int? religionId;
  final int? bloodGroupId;
  final int? genderId;
  final int? categoryId;
  final int? imageId;
  final int? parentGuardianId;
  final int? userId;
  final String? uploadDocuments;
  final int? status;
  final int? previousSchool;
  final String? previousSchoolInfo;
  final int? previousSchoolImageId;
  final String? placeOfBirth;
  final String? nationality;
  final String? cprNo;
  final String? spokenLangAtHome;
  final String? residanceAddress;
  final String? controlNumber;
  final String? available;
  final String? createdAt;
  final String? updatedAt;
  const StudentsListData(
      {required this.id,
      this.admissionNo,
      this.rollNo,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.dob,
      this.admissionDate,
      this.studentCategoryId,
      this.religionId,
      this.bloodGroupId,
      this.genderId,
      this.categoryId,
      this.imageId,
      this.parentGuardianId,
      this.userId,
      this.uploadDocuments,
      this.status,
      this.previousSchool,
      this.previousSchoolInfo,
      this.previousSchoolImageId,
      this.placeOfBirth,
      this.nationality,
      this.cprNo,
      this.spokenLangAtHome,
      this.residanceAddress,
      this.controlNumber,
      this.available,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || admissionNo != null) {
      map['admission_no'] = Variable<String>(admissionNo);
    }
    if (!nullToAbsent || rollNo != null) {
      map['roll_no'] = Variable<int>(rollNo);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String>(dob);
    }
    if (!nullToAbsent || admissionDate != null) {
      map['admission_date'] = Variable<String>(admissionDate);
    }
    if (!nullToAbsent || studentCategoryId != null) {
      map['student_category_id'] = Variable<int>(studentCategoryId);
    }
    if (!nullToAbsent || religionId != null) {
      map['religion_id'] = Variable<int>(religionId);
    }
    if (!nullToAbsent || bloodGroupId != null) {
      map['blood_group_id'] = Variable<int>(bloodGroupId);
    }
    if (!nullToAbsent || genderId != null) {
      map['gender_id'] = Variable<int>(genderId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || imageId != null) {
      map['image_id'] = Variable<int>(imageId);
    }
    if (!nullToAbsent || parentGuardianId != null) {
      map['parent_guardian_id'] = Variable<int>(parentGuardianId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || uploadDocuments != null) {
      map['upload_documents'] = Variable<String>(uploadDocuments);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || previousSchool != null) {
      map['previous_school'] = Variable<int>(previousSchool);
    }
    if (!nullToAbsent || previousSchoolInfo != null) {
      map['previous_school_info'] = Variable<String>(previousSchoolInfo);
    }
    if (!nullToAbsent || previousSchoolImageId != null) {
      map['previous_school_image_id'] = Variable<int>(previousSchoolImageId);
    }
    if (!nullToAbsent || placeOfBirth != null) {
      map['place_of_birth'] = Variable<String>(placeOfBirth);
    }
    if (!nullToAbsent || nationality != null) {
      map['nationality'] = Variable<String>(nationality);
    }
    if (!nullToAbsent || cprNo != null) {
      map['cpr_no'] = Variable<String>(cprNo);
    }
    if (!nullToAbsent || spokenLangAtHome != null) {
      map['spoken_lang_at_home'] = Variable<String>(spokenLangAtHome);
    }
    if (!nullToAbsent || residanceAddress != null) {
      map['residance_address'] = Variable<String>(residanceAddress);
    }
    if (!nullToAbsent || controlNumber != null) {
      map['control_number'] = Variable<String>(controlNumber);
    }
    if (!nullToAbsent || available != null) {
      map['available'] = Variable<String>(available);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  StudentsListCompanion toCompanion(bool nullToAbsent) {
    return StudentsListCompanion(
      id: Value(id),
      admissionNo: admissionNo == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionNo),
      rollNo:
          rollNo == null && nullToAbsent ? const Value.absent() : Value(rollNo),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      mobile:
          mobile == null && nullToAbsent ? const Value.absent() : Value(mobile),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      admissionDate: admissionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(admissionDate),
      studentCategoryId: studentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentCategoryId),
      religionId: religionId == null && nullToAbsent
          ? const Value.absent()
          : Value(religionId),
      bloodGroupId: bloodGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGroupId),
      genderId: genderId == null && nullToAbsent
          ? const Value.absent()
          : Value(genderId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      imageId: imageId == null && nullToAbsent
          ? const Value.absent()
          : Value(imageId),
      parentGuardianId: parentGuardianId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentGuardianId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      uploadDocuments: uploadDocuments == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadDocuments),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      previousSchool: previousSchool == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchool),
      previousSchoolInfo: previousSchoolInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchoolInfo),
      previousSchoolImageId: previousSchoolImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousSchoolImageId),
      placeOfBirth: placeOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfBirth),
      nationality: nationality == null && nullToAbsent
          ? const Value.absent()
          : Value(nationality),
      cprNo:
          cprNo == null && nullToAbsent ? const Value.absent() : Value(cprNo),
      spokenLangAtHome: spokenLangAtHome == null && nullToAbsent
          ? const Value.absent()
          : Value(spokenLangAtHome),
      residanceAddress: residanceAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(residanceAddress),
      controlNumber: controlNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(controlNumber),
      available: available == null && nullToAbsent
          ? const Value.absent()
          : Value(available),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory StudentsListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentsListData(
      id: serializer.fromJson<int>(json['id']),
      admissionNo: serializer.fromJson<String?>(json['admissionNo']),
      rollNo: serializer.fromJson<int?>(json['rollNo']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      email: serializer.fromJson<String?>(json['email']),
      dob: serializer.fromJson<String?>(json['dob']),
      admissionDate: serializer.fromJson<String?>(json['admissionDate']),
      studentCategoryId: serializer.fromJson<int?>(json['studentCategoryId']),
      religionId: serializer.fromJson<int?>(json['religionId']),
      bloodGroupId: serializer.fromJson<int?>(json['bloodGroupId']),
      genderId: serializer.fromJson<int?>(json['genderId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      imageId: serializer.fromJson<int?>(json['imageId']),
      parentGuardianId: serializer.fromJson<int?>(json['parentGuardianId']),
      userId: serializer.fromJson<int?>(json['userId']),
      uploadDocuments: serializer.fromJson<String?>(json['uploadDocuments']),
      status: serializer.fromJson<int?>(json['status']),
      previousSchool: serializer.fromJson<int?>(json['previousSchool']),
      previousSchoolInfo:
          serializer.fromJson<String?>(json['previousSchoolInfo']),
      previousSchoolImageId:
          serializer.fromJson<int?>(json['previousSchoolImageId']),
      placeOfBirth: serializer.fromJson<String?>(json['placeOfBirth']),
      nationality: serializer.fromJson<String?>(json['nationality']),
      cprNo: serializer.fromJson<String?>(json['cprNo']),
      spokenLangAtHome: serializer.fromJson<String?>(json['spokenLangAtHome']),
      residanceAddress: serializer.fromJson<String?>(json['residanceAddress']),
      controlNumber: serializer.fromJson<String?>(json['controlNumber']),
      available: serializer.fromJson<String?>(json['available']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'admissionNo': serializer.toJson<String?>(admissionNo),
      'rollNo': serializer.toJson<int?>(rollNo),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'mobile': serializer.toJson<String?>(mobile),
      'email': serializer.toJson<String?>(email),
      'dob': serializer.toJson<String?>(dob),
      'admissionDate': serializer.toJson<String?>(admissionDate),
      'studentCategoryId': serializer.toJson<int?>(studentCategoryId),
      'religionId': serializer.toJson<int?>(religionId),
      'bloodGroupId': serializer.toJson<int?>(bloodGroupId),
      'genderId': serializer.toJson<int?>(genderId),
      'categoryId': serializer.toJson<int?>(categoryId),
      'imageId': serializer.toJson<int?>(imageId),
      'parentGuardianId': serializer.toJson<int?>(parentGuardianId),
      'userId': serializer.toJson<int?>(userId),
      'uploadDocuments': serializer.toJson<String?>(uploadDocuments),
      'status': serializer.toJson<int?>(status),
      'previousSchool': serializer.toJson<int?>(previousSchool),
      'previousSchoolInfo': serializer.toJson<String?>(previousSchoolInfo),
      'previousSchoolImageId': serializer.toJson<int?>(previousSchoolImageId),
      'placeOfBirth': serializer.toJson<String?>(placeOfBirth),
      'nationality': serializer.toJson<String?>(nationality),
      'cprNo': serializer.toJson<String?>(cprNo),
      'spokenLangAtHome': serializer.toJson<String?>(spokenLangAtHome),
      'residanceAddress': serializer.toJson<String?>(residanceAddress),
      'controlNumber': serializer.toJson<String?>(controlNumber),
      'available': serializer.toJson<String?>(available),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  StudentsListData copyWith(
          {int? id,
          Value<String?> admissionNo = const Value.absent(),
          Value<int?> rollNo = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> mobile = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> dob = const Value.absent(),
          Value<String?> admissionDate = const Value.absent(),
          Value<int?> studentCategoryId = const Value.absent(),
          Value<int?> religionId = const Value.absent(),
          Value<int?> bloodGroupId = const Value.absent(),
          Value<int?> genderId = const Value.absent(),
          Value<int?> categoryId = const Value.absent(),
          Value<int?> imageId = const Value.absent(),
          Value<int?> parentGuardianId = const Value.absent(),
          Value<int?> userId = const Value.absent(),
          Value<String?> uploadDocuments = const Value.absent(),
          Value<int?> status = const Value.absent(),
          Value<int?> previousSchool = const Value.absent(),
          Value<String?> previousSchoolInfo = const Value.absent(),
          Value<int?> previousSchoolImageId = const Value.absent(),
          Value<String?> placeOfBirth = const Value.absent(),
          Value<String?> nationality = const Value.absent(),
          Value<String?> cprNo = const Value.absent(),
          Value<String?> spokenLangAtHome = const Value.absent(),
          Value<String?> residanceAddress = const Value.absent(),
          Value<String?> controlNumber = const Value.absent(),
          Value<String?> available = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      StudentsListData(
        id: id ?? this.id,
        admissionNo: admissionNo.present ? admissionNo.value : this.admissionNo,
        rollNo: rollNo.present ? rollNo.value : this.rollNo,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        mobile: mobile.present ? mobile.value : this.mobile,
        email: email.present ? email.value : this.email,
        dob: dob.present ? dob.value : this.dob,
        admissionDate:
            admissionDate.present ? admissionDate.value : this.admissionDate,
        studentCategoryId: studentCategoryId.present
            ? studentCategoryId.value
            : this.studentCategoryId,
        religionId: religionId.present ? religionId.value : this.religionId,
        bloodGroupId:
            bloodGroupId.present ? bloodGroupId.value : this.bloodGroupId,
        genderId: genderId.present ? genderId.value : this.genderId,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        imageId: imageId.present ? imageId.value : this.imageId,
        parentGuardianId: parentGuardianId.present
            ? parentGuardianId.value
            : this.parentGuardianId,
        userId: userId.present ? userId.value : this.userId,
        uploadDocuments: uploadDocuments.present
            ? uploadDocuments.value
            : this.uploadDocuments,
        status: status.present ? status.value : this.status,
        previousSchool:
            previousSchool.present ? previousSchool.value : this.previousSchool,
        previousSchoolInfo: previousSchoolInfo.present
            ? previousSchoolInfo.value
            : this.previousSchoolInfo,
        previousSchoolImageId: previousSchoolImageId.present
            ? previousSchoolImageId.value
            : this.previousSchoolImageId,
        placeOfBirth:
            placeOfBirth.present ? placeOfBirth.value : this.placeOfBirth,
        nationality: nationality.present ? nationality.value : this.nationality,
        cprNo: cprNo.present ? cprNo.value : this.cprNo,
        spokenLangAtHome: spokenLangAtHome.present
            ? spokenLangAtHome.value
            : this.spokenLangAtHome,
        residanceAddress: residanceAddress.present
            ? residanceAddress.value
            : this.residanceAddress,
        controlNumber:
            controlNumber.present ? controlNumber.value : this.controlNumber,
        available: available.present ? available.value : this.available,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  StudentsListData copyWithCompanion(StudentsListCompanion data) {
    return StudentsListData(
      id: data.id.present ? data.id.value : this.id,
      admissionNo:
          data.admissionNo.present ? data.admissionNo.value : this.admissionNo,
      rollNo: data.rollNo.present ? data.rollNo.value : this.rollNo,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      email: data.email.present ? data.email.value : this.email,
      dob: data.dob.present ? data.dob.value : this.dob,
      admissionDate: data.admissionDate.present
          ? data.admissionDate.value
          : this.admissionDate,
      studentCategoryId: data.studentCategoryId.present
          ? data.studentCategoryId.value
          : this.studentCategoryId,
      religionId:
          data.religionId.present ? data.religionId.value : this.religionId,
      bloodGroupId: data.bloodGroupId.present
          ? data.bloodGroupId.value
          : this.bloodGroupId,
      genderId: data.genderId.present ? data.genderId.value : this.genderId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      imageId: data.imageId.present ? data.imageId.value : this.imageId,
      parentGuardianId: data.parentGuardianId.present
          ? data.parentGuardianId.value
          : this.parentGuardianId,
      userId: data.userId.present ? data.userId.value : this.userId,
      uploadDocuments: data.uploadDocuments.present
          ? data.uploadDocuments.value
          : this.uploadDocuments,
      status: data.status.present ? data.status.value : this.status,
      previousSchool: data.previousSchool.present
          ? data.previousSchool.value
          : this.previousSchool,
      previousSchoolInfo: data.previousSchoolInfo.present
          ? data.previousSchoolInfo.value
          : this.previousSchoolInfo,
      previousSchoolImageId: data.previousSchoolImageId.present
          ? data.previousSchoolImageId.value
          : this.previousSchoolImageId,
      placeOfBirth: data.placeOfBirth.present
          ? data.placeOfBirth.value
          : this.placeOfBirth,
      nationality:
          data.nationality.present ? data.nationality.value : this.nationality,
      cprNo: data.cprNo.present ? data.cprNo.value : this.cprNo,
      spokenLangAtHome: data.spokenLangAtHome.present
          ? data.spokenLangAtHome.value
          : this.spokenLangAtHome,
      residanceAddress: data.residanceAddress.present
          ? data.residanceAddress.value
          : this.residanceAddress,
      controlNumber: data.controlNumber.present
          ? data.controlNumber.value
          : this.controlNumber,
      available: data.available.present ? data.available.value : this.available,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentsListData(')
          ..write('id: $id, ')
          ..write('admissionNo: $admissionNo, ')
          ..write('rollNo: $rollNo, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('dob: $dob, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('studentCategoryId: $studentCategoryId, ')
          ..write('religionId: $religionId, ')
          ..write('bloodGroupId: $bloodGroupId, ')
          ..write('genderId: $genderId, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageId: $imageId, ')
          ..write('parentGuardianId: $parentGuardianId, ')
          ..write('userId: $userId, ')
          ..write('uploadDocuments: $uploadDocuments, ')
          ..write('status: $status, ')
          ..write('previousSchool: $previousSchool, ')
          ..write('previousSchoolInfo: $previousSchoolInfo, ')
          ..write('previousSchoolImageId: $previousSchoolImageId, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('nationality: $nationality, ')
          ..write('cprNo: $cprNo, ')
          ..write('spokenLangAtHome: $spokenLangAtHome, ')
          ..write('residanceAddress: $residanceAddress, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('available: $available, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        admissionNo,
        rollNo,
        firstName,
        lastName,
        mobile,
        email,
        dob,
        admissionDate,
        studentCategoryId,
        religionId,
        bloodGroupId,
        genderId,
        categoryId,
        imageId,
        parentGuardianId,
        userId,
        uploadDocuments,
        status,
        previousSchool,
        previousSchoolInfo,
        previousSchoolImageId,
        placeOfBirth,
        nationality,
        cprNo,
        spokenLangAtHome,
        residanceAddress,
        controlNumber,
        available,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentsListData &&
          other.id == this.id &&
          other.admissionNo == this.admissionNo &&
          other.rollNo == this.rollNo &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.mobile == this.mobile &&
          other.email == this.email &&
          other.dob == this.dob &&
          other.admissionDate == this.admissionDate &&
          other.studentCategoryId == this.studentCategoryId &&
          other.religionId == this.religionId &&
          other.bloodGroupId == this.bloodGroupId &&
          other.genderId == this.genderId &&
          other.categoryId == this.categoryId &&
          other.imageId == this.imageId &&
          other.parentGuardianId == this.parentGuardianId &&
          other.userId == this.userId &&
          other.uploadDocuments == this.uploadDocuments &&
          other.status == this.status &&
          other.previousSchool == this.previousSchool &&
          other.previousSchoolInfo == this.previousSchoolInfo &&
          other.previousSchoolImageId == this.previousSchoolImageId &&
          other.placeOfBirth == this.placeOfBirth &&
          other.nationality == this.nationality &&
          other.cprNo == this.cprNo &&
          other.spokenLangAtHome == this.spokenLangAtHome &&
          other.residanceAddress == this.residanceAddress &&
          other.controlNumber == this.controlNumber &&
          other.available == this.available &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StudentsListCompanion extends UpdateCompanion<StudentsListData> {
  final Value<int> id;
  final Value<String?> admissionNo;
  final Value<int?> rollNo;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> mobile;
  final Value<String?> email;
  final Value<String?> dob;
  final Value<String?> admissionDate;
  final Value<int?> studentCategoryId;
  final Value<int?> religionId;
  final Value<int?> bloodGroupId;
  final Value<int?> genderId;
  final Value<int?> categoryId;
  final Value<int?> imageId;
  final Value<int?> parentGuardianId;
  final Value<int?> userId;
  final Value<String?> uploadDocuments;
  final Value<int?> status;
  final Value<int?> previousSchool;
  final Value<String?> previousSchoolInfo;
  final Value<int?> previousSchoolImageId;
  final Value<String?> placeOfBirth;
  final Value<String?> nationality;
  final Value<String?> cprNo;
  final Value<String?> spokenLangAtHome;
  final Value<String?> residanceAddress;
  final Value<String?> controlNumber;
  final Value<String?> available;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const StudentsListCompanion({
    this.id = const Value.absent(),
    this.admissionNo = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.dob = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.studentCategoryId = const Value.absent(),
    this.religionId = const Value.absent(),
    this.bloodGroupId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imageId = const Value.absent(),
    this.parentGuardianId = const Value.absent(),
    this.userId = const Value.absent(),
    this.uploadDocuments = const Value.absent(),
    this.status = const Value.absent(),
    this.previousSchool = const Value.absent(),
    this.previousSchoolInfo = const Value.absent(),
    this.previousSchoolImageId = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.nationality = const Value.absent(),
    this.cprNo = const Value.absent(),
    this.spokenLangAtHome = const Value.absent(),
    this.residanceAddress = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.available = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StudentsListCompanion.insert({
    this.id = const Value.absent(),
    this.admissionNo = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.dob = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.studentCategoryId = const Value.absent(),
    this.religionId = const Value.absent(),
    this.bloodGroupId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imageId = const Value.absent(),
    this.parentGuardianId = const Value.absent(),
    this.userId = const Value.absent(),
    this.uploadDocuments = const Value.absent(),
    this.status = const Value.absent(),
    this.previousSchool = const Value.absent(),
    this.previousSchoolInfo = const Value.absent(),
    this.previousSchoolImageId = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.nationality = const Value.absent(),
    this.cprNo = const Value.absent(),
    this.spokenLangAtHome = const Value.absent(),
    this.residanceAddress = const Value.absent(),
    this.controlNumber = const Value.absent(),
    this.available = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<StudentsListData> custom({
    Expression<int>? id,
    Expression<String>? admissionNo,
    Expression<int>? rollNo,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? mobile,
    Expression<String>? email,
    Expression<String>? dob,
    Expression<String>? admissionDate,
    Expression<int>? studentCategoryId,
    Expression<int>? religionId,
    Expression<int>? bloodGroupId,
    Expression<int>? genderId,
    Expression<int>? categoryId,
    Expression<int>? imageId,
    Expression<int>? parentGuardianId,
    Expression<int>? userId,
    Expression<String>? uploadDocuments,
    Expression<int>? status,
    Expression<int>? previousSchool,
    Expression<String>? previousSchoolInfo,
    Expression<int>? previousSchoolImageId,
    Expression<String>? placeOfBirth,
    Expression<String>? nationality,
    Expression<String>? cprNo,
    Expression<String>? spokenLangAtHome,
    Expression<String>? residanceAddress,
    Expression<String>? controlNumber,
    Expression<String>? available,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (admissionNo != null) 'admission_no': admissionNo,
      if (rollNo != null) 'roll_no': rollNo,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (dob != null) 'dob': dob,
      if (admissionDate != null) 'admission_date': admissionDate,
      if (studentCategoryId != null) 'student_category_id': studentCategoryId,
      if (religionId != null) 'religion_id': religionId,
      if (bloodGroupId != null) 'blood_group_id': bloodGroupId,
      if (genderId != null) 'gender_id': genderId,
      if (categoryId != null) 'category_id': categoryId,
      if (imageId != null) 'image_id': imageId,
      if (parentGuardianId != null) 'parent_guardian_id': parentGuardianId,
      if (userId != null) 'user_id': userId,
      if (uploadDocuments != null) 'upload_documents': uploadDocuments,
      if (status != null) 'status': status,
      if (previousSchool != null) 'previous_school': previousSchool,
      if (previousSchoolInfo != null)
        'previous_school_info': previousSchoolInfo,
      if (previousSchoolImageId != null)
        'previous_school_image_id': previousSchoolImageId,
      if (placeOfBirth != null) 'place_of_birth': placeOfBirth,
      if (nationality != null) 'nationality': nationality,
      if (cprNo != null) 'cpr_no': cprNo,
      if (spokenLangAtHome != null) 'spoken_lang_at_home': spokenLangAtHome,
      if (residanceAddress != null) 'residance_address': residanceAddress,
      if (controlNumber != null) 'control_number': controlNumber,
      if (available != null) 'available': available,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StudentsListCompanion copyWith(
      {Value<int>? id,
      Value<String?>? admissionNo,
      Value<int?>? rollNo,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? mobile,
      Value<String?>? email,
      Value<String?>? dob,
      Value<String?>? admissionDate,
      Value<int?>? studentCategoryId,
      Value<int?>? religionId,
      Value<int?>? bloodGroupId,
      Value<int?>? genderId,
      Value<int?>? categoryId,
      Value<int?>? imageId,
      Value<int?>? parentGuardianId,
      Value<int?>? userId,
      Value<String?>? uploadDocuments,
      Value<int?>? status,
      Value<int?>? previousSchool,
      Value<String?>? previousSchoolInfo,
      Value<int?>? previousSchoolImageId,
      Value<String?>? placeOfBirth,
      Value<String?>? nationality,
      Value<String?>? cprNo,
      Value<String?>? spokenLangAtHome,
      Value<String?>? residanceAddress,
      Value<String?>? controlNumber,
      Value<String?>? available,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return StudentsListCompanion(
      id: id ?? this.id,
      admissionNo: admissionNo ?? this.admissionNo,
      rollNo: rollNo ?? this.rollNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      admissionDate: admissionDate ?? this.admissionDate,
      studentCategoryId: studentCategoryId ?? this.studentCategoryId,
      religionId: religionId ?? this.religionId,
      bloodGroupId: bloodGroupId ?? this.bloodGroupId,
      genderId: genderId ?? this.genderId,
      categoryId: categoryId ?? this.categoryId,
      imageId: imageId ?? this.imageId,
      parentGuardianId: parentGuardianId ?? this.parentGuardianId,
      userId: userId ?? this.userId,
      uploadDocuments: uploadDocuments ?? this.uploadDocuments,
      status: status ?? this.status,
      previousSchool: previousSchool ?? this.previousSchool,
      previousSchoolInfo: previousSchoolInfo ?? this.previousSchoolInfo,
      previousSchoolImageId:
          previousSchoolImageId ?? this.previousSchoolImageId,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      nationality: nationality ?? this.nationality,
      cprNo: cprNo ?? this.cprNo,
      spokenLangAtHome: spokenLangAtHome ?? this.spokenLangAtHome,
      residanceAddress: residanceAddress ?? this.residanceAddress,
      controlNumber: controlNumber ?? this.controlNumber,
      available: available ?? this.available,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (admissionNo.present) {
      map['admission_no'] = Variable<String>(admissionNo.value);
    }
    if (rollNo.present) {
      map['roll_no'] = Variable<int>(rollNo.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String>(dob.value);
    }
    if (admissionDate.present) {
      map['admission_date'] = Variable<String>(admissionDate.value);
    }
    if (studentCategoryId.present) {
      map['student_category_id'] = Variable<int>(studentCategoryId.value);
    }
    if (religionId.present) {
      map['religion_id'] = Variable<int>(religionId.value);
    }
    if (bloodGroupId.present) {
      map['blood_group_id'] = Variable<int>(bloodGroupId.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<int>(imageId.value);
    }
    if (parentGuardianId.present) {
      map['parent_guardian_id'] = Variable<int>(parentGuardianId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (uploadDocuments.present) {
      map['upload_documents'] = Variable<String>(uploadDocuments.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (previousSchool.present) {
      map['previous_school'] = Variable<int>(previousSchool.value);
    }
    if (previousSchoolInfo.present) {
      map['previous_school_info'] = Variable<String>(previousSchoolInfo.value);
    }
    if (previousSchoolImageId.present) {
      map['previous_school_image_id'] =
          Variable<int>(previousSchoolImageId.value);
    }
    if (placeOfBirth.present) {
      map['place_of_birth'] = Variable<String>(placeOfBirth.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (cprNo.present) {
      map['cpr_no'] = Variable<String>(cprNo.value);
    }
    if (spokenLangAtHome.present) {
      map['spoken_lang_at_home'] = Variable<String>(spokenLangAtHome.value);
    }
    if (residanceAddress.present) {
      map['residance_address'] = Variable<String>(residanceAddress.value);
    }
    if (controlNumber.present) {
      map['control_number'] = Variable<String>(controlNumber.value);
    }
    if (available.present) {
      map['available'] = Variable<String>(available.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsListCompanion(')
          ..write('id: $id, ')
          ..write('admissionNo: $admissionNo, ')
          ..write('rollNo: $rollNo, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('dob: $dob, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('studentCategoryId: $studentCategoryId, ')
          ..write('religionId: $religionId, ')
          ..write('bloodGroupId: $bloodGroupId, ')
          ..write('genderId: $genderId, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageId: $imageId, ')
          ..write('parentGuardianId: $parentGuardianId, ')
          ..write('userId: $userId, ')
          ..write('uploadDocuments: $uploadDocuments, ')
          ..write('status: $status, ')
          ..write('previousSchool: $previousSchool, ')
          ..write('previousSchoolInfo: $previousSchoolInfo, ')
          ..write('previousSchoolImageId: $previousSchoolImageId, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('nationality: $nationality, ')
          ..write('cprNo: $cprNo, ')
          ..write('spokenLangAtHome: $spokenLangAtHome, ')
          ..write('residanceAddress: $residanceAddress, ')
          ..write('controlNumber: $controlNumber, ')
          ..write('available: $available, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FeesGroupsTable feesGroups = $FeesGroupsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $FeesAssignmentsTable feesAssignments =
      $FeesAssignmentsTable(this);
  late final $FeesAssignChildrenTable feesAssignChildren =
      $FeesAssignChildrenTable(this);
  late final $ExamTypesTable examTypes = $ExamTypesTable(this);
  late final $ClassesTable classes = $ClassesTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $ExamsTable exams = $ExamsTable(this);
  late final $MarksRegisterChildrensTable marksRegisterChildrens =
      $MarksRegisterChildrensTable(this);
  late final $FeesMastersTable feesMasters = $FeesMastersTable(this);
  late final $FeesTypeTable feesType = $FeesTypeTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BankAccountsTable bankAccounts = $BankAccountsTable(this);
  late final $SubjectAssignChildrensTable subjectAssignChildrens =
      $SubjectAssignChildrensTable(this);
  late final $SubjectAssignsTable subjectAssigns = $SubjectAssignsTable(this);
  late final $StaffTable staff = $StaffTable(this);
  late final $MarksGradeTable marksGrade = $MarksGradeTable(this);
  late final $ParentDetailsTable parentDetails = $ParentDetailsTable(this);
  late final $NoticeBoardsTable noticeBoards = $NoticeBoardsTable(this);
  late final $StudentsListTable studentsList = $StudentsListTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        feesGroups,
        users,
        students,
        feesAssignments,
        feesAssignChildren,
        examTypes,
        classes,
        subjects,
        sections,
        exams,
        marksRegisterChildrens,
        feesMasters,
        feesType,
        transactions,
        bankAccounts,
        subjectAssignChildrens,
        subjectAssigns,
        staff,
        marksGrade,
        parentDetails,
        noticeBoards,
        studentsList
      ];
}

typedef $$FeesGroupsTableCreateCompanionBuilder = FeesGroupsCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> dashboardOrder,
  Value<String?> description,
  Value<int?> status,
  Value<int?> onlineAdmissionFees,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$FeesGroupsTableUpdateCompanionBuilder = FeesGroupsCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> dashboardOrder,
  Value<String?> description,
  Value<int?> status,
  Value<int?> onlineAdmissionFees,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$FeesGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $FeesGroupsTable> {
  $$FeesGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dashboardOrder => $composableBuilder(
      column: $table.dashboardOrder,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get onlineAdmissionFees => $composableBuilder(
      column: $table.onlineAdmissionFees,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FeesGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesGroupsTable> {
  $$FeesGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dashboardOrder => $composableBuilder(
      column: $table.dashboardOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get onlineAdmissionFees => $composableBuilder(
      column: $table.onlineAdmissionFees,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FeesGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesGroupsTable> {
  $$FeesGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dashboardOrder => $composableBuilder(
      column: $table.dashboardOrder, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get onlineAdmissionFees => $composableBuilder(
      column: $table.onlineAdmissionFees, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeesGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesGroupsTable,
    FeesGroup,
    $$FeesGroupsTableFilterComposer,
    $$FeesGroupsTableOrderingComposer,
    $$FeesGroupsTableAnnotationComposer,
    $$FeesGroupsTableCreateCompanionBuilder,
    $$FeesGroupsTableUpdateCompanionBuilder,
    (FeesGroup, BaseReferences<_$AppDatabase, $FeesGroupsTable, FeesGroup>),
    FeesGroup,
    PrefetchHooks Function()> {
  $$FeesGroupsTableTableManager(_$AppDatabase db, $FeesGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> dashboardOrder = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> onlineAdmissionFees = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesGroupsCompanion(
            id: id,
            name: name,
            dashboardOrder: dashboardOrder,
            description: description,
            status: status,
            onlineAdmissionFees: onlineAdmissionFees,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> dashboardOrder = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> onlineAdmissionFees = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesGroupsCompanion.insert(
            id: id,
            name: name,
            dashboardOrder: dashboardOrder,
            description: description,
            status: status,
            onlineAdmissionFees: onlineAdmissionFees,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesGroupsTable,
    FeesGroup,
    $$FeesGroupsTableFilterComposer,
    $$FeesGroupsTableOrderingComposer,
    $$FeesGroupsTableAnnotationComposer,
    $$FeesGroupsTableCreateCompanionBuilder,
    $$FeesGroupsTableUpdateCompanionBuilder,
    (FeesGroup, BaseReferences<_$AppDatabase, $FeesGroupsTable, FeesGroup>),
    FeesGroup,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  required String password,
  required String status,
  Value<String?> roleId,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String> password,
  Value<String> status,
  Value<String?> roleId,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> roleId = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            phone: phone,
            email: email,
            password: password,
            status: status,
            roleId: roleId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            required String password,
            required String status,
            Value<String?> roleId = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            email: email,
            password: password,
            status: status,
            roleId: roleId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$StudentsTableCreateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  Value<String?> admissionNo,
  Value<String?> rollNo,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> mobile,
  Value<String?> email,
  Value<String?> dob,
  Value<String?> admissionDate,
  Value<int?> studentCategoryId,
  Value<int?> religionId,
  Value<int?> bloodGroupId,
  Value<int?> genderId,
  Value<int?> categoryId,
  Value<int?> imageId,
  Value<int?> parentGuardianId,
  Value<int?> userId,
  Value<String?> uploadDocuments,
  Value<int?> status,
  Value<int?> previousSchool,
  Value<String?> previousSchoolInfo,
  Value<int?> previousSchoolImageId,
  Value<String?> placeOfBirth,
  Value<String?> nationality,
  Value<String?> cprNo,
  Value<String?> spokenLangAtHome,
  Value<String?> residanceAddress,
  Value<String?> controlNumber,
  Value<String?> createdAt,
  Value<String?> updatedAt,
  Value<String?> fullName,
  Value<String?> className,
  Value<String?> sectionName,
  Value<String?> available,
});
typedef $$StudentsTableUpdateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  Value<String?> admissionNo,
  Value<String?> rollNo,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> mobile,
  Value<String?> email,
  Value<String?> dob,
  Value<String?> admissionDate,
  Value<int?> studentCategoryId,
  Value<int?> religionId,
  Value<int?> bloodGroupId,
  Value<int?> genderId,
  Value<int?> categoryId,
  Value<int?> imageId,
  Value<int?> parentGuardianId,
  Value<int?> userId,
  Value<String?> uploadDocuments,
  Value<int?> status,
  Value<int?> previousSchool,
  Value<String?> previousSchoolInfo,
  Value<int?> previousSchoolImageId,
  Value<String?> placeOfBirth,
  Value<String?> nationality,
  Value<String?> cprNo,
  Value<String?> spokenLangAtHome,
  Value<String?> residanceAddress,
  Value<String?> controlNumber,
  Value<String?> createdAt,
  Value<String?> updatedAt,
  Value<String?> fullName,
  Value<String?> className,
  Value<String?> sectionName,
  Value<String?> available,
});

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rollNo => $composableBuilder(
      column: $table.rollNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get imageId => $composableBuilder(
      column: $table.imageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cprNo => $composableBuilder(
      column: $table.cprNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get className => $composableBuilder(
      column: $table.className, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sectionName => $composableBuilder(
      column: $table.sectionName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnFilters(column));
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rollNo => $composableBuilder(
      column: $table.rollNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get imageId => $composableBuilder(
      column: $table.imageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cprNo => $composableBuilder(
      column: $table.cprNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get className => $composableBuilder(
      column: $table.className, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sectionName => $composableBuilder(
      column: $table.sectionName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnOrderings(column));
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => column);

  GeneratedColumn<String> get rollNo =>
      $composableBuilder(column: $table.rollNo, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate, builder: (column) => column);

  GeneratedColumn<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId, builder: (column) => column);

  GeneratedColumn<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => column);

  GeneratedColumn<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId, builder: (column) => column);

  GeneratedColumn<int> get genderId =>
      $composableBuilder(column: $table.genderId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get imageId =>
      $composableBuilder(column: $table.imageId, builder: (column) => column);

  GeneratedColumn<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool, builder: (column) => column);

  GeneratedColumn<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo, builder: (column) => column);

  GeneratedColumn<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId, builder: (column) => column);

  GeneratedColumn<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth, builder: (column) => column);

  GeneratedColumn<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => column);

  GeneratedColumn<String> get cprNo =>
      $composableBuilder(column: $table.cprNo, builder: (column) => column);

  GeneratedColumn<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome, builder: (column) => column);

  GeneratedColumn<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress, builder: (column) => column);

  GeneratedColumn<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get className =>
      $composableBuilder(column: $table.className, builder: (column) => column);

  GeneratedColumn<String> get sectionName => $composableBuilder(
      column: $table.sectionName, builder: (column) => column);

  GeneratedColumn<String> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);
}

class $$StudentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudentsTable,
    Student,
    $$StudentsTableFilterComposer,
    $$StudentsTableOrderingComposer,
    $$StudentsTableAnnotationComposer,
    $$StudentsTableCreateCompanionBuilder,
    $$StudentsTableUpdateCompanionBuilder,
    (Student, BaseReferences<_$AppDatabase, $StudentsTable, Student>),
    Student,
    PrefetchHooks Function()> {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> admissionNo = const Value.absent(),
            Value<String?> rollNo = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> mobile = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> dob = const Value.absent(),
            Value<String?> admissionDate = const Value.absent(),
            Value<int?> studentCategoryId = const Value.absent(),
            Value<int?> religionId = const Value.absent(),
            Value<int?> bloodGroupId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> imageId = const Value.absent(),
            Value<int?> parentGuardianId = const Value.absent(),
            Value<int?> userId = const Value.absent(),
            Value<String?> uploadDocuments = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> previousSchool = const Value.absent(),
            Value<String?> previousSchoolInfo = const Value.absent(),
            Value<int?> previousSchoolImageId = const Value.absent(),
            Value<String?> placeOfBirth = const Value.absent(),
            Value<String?> nationality = const Value.absent(),
            Value<String?> cprNo = const Value.absent(),
            Value<String?> spokenLangAtHome = const Value.absent(),
            Value<String?> residanceAddress = const Value.absent(),
            Value<String?> controlNumber = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> className = const Value.absent(),
            Value<String?> sectionName = const Value.absent(),
            Value<String?> available = const Value.absent(),
          }) =>
              StudentsCompanion(
            id: id,
            admissionNo: admissionNo,
            rollNo: rollNo,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            email: email,
            dob: dob,
            admissionDate: admissionDate,
            studentCategoryId: studentCategoryId,
            religionId: religionId,
            bloodGroupId: bloodGroupId,
            genderId: genderId,
            categoryId: categoryId,
            imageId: imageId,
            parentGuardianId: parentGuardianId,
            userId: userId,
            uploadDocuments: uploadDocuments,
            status: status,
            previousSchool: previousSchool,
            previousSchoolInfo: previousSchoolInfo,
            previousSchoolImageId: previousSchoolImageId,
            placeOfBirth: placeOfBirth,
            nationality: nationality,
            cprNo: cprNo,
            spokenLangAtHome: spokenLangAtHome,
            residanceAddress: residanceAddress,
            controlNumber: controlNumber,
            createdAt: createdAt,
            updatedAt: updatedAt,
            fullName: fullName,
            className: className,
            sectionName: sectionName,
            available: available,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> admissionNo = const Value.absent(),
            Value<String?> rollNo = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> mobile = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> dob = const Value.absent(),
            Value<String?> admissionDate = const Value.absent(),
            Value<int?> studentCategoryId = const Value.absent(),
            Value<int?> religionId = const Value.absent(),
            Value<int?> bloodGroupId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> imageId = const Value.absent(),
            Value<int?> parentGuardianId = const Value.absent(),
            Value<int?> userId = const Value.absent(),
            Value<String?> uploadDocuments = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> previousSchool = const Value.absent(),
            Value<String?> previousSchoolInfo = const Value.absent(),
            Value<int?> previousSchoolImageId = const Value.absent(),
            Value<String?> placeOfBirth = const Value.absent(),
            Value<String?> nationality = const Value.absent(),
            Value<String?> cprNo = const Value.absent(),
            Value<String?> spokenLangAtHome = const Value.absent(),
            Value<String?> residanceAddress = const Value.absent(),
            Value<String?> controlNumber = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> className = const Value.absent(),
            Value<String?> sectionName = const Value.absent(),
            Value<String?> available = const Value.absent(),
          }) =>
              StudentsCompanion.insert(
            id: id,
            admissionNo: admissionNo,
            rollNo: rollNo,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            email: email,
            dob: dob,
            admissionDate: admissionDate,
            studentCategoryId: studentCategoryId,
            religionId: religionId,
            bloodGroupId: bloodGroupId,
            genderId: genderId,
            categoryId: categoryId,
            imageId: imageId,
            parentGuardianId: parentGuardianId,
            userId: userId,
            uploadDocuments: uploadDocuments,
            status: status,
            previousSchool: previousSchool,
            previousSchoolInfo: previousSchoolInfo,
            previousSchoolImageId: previousSchoolImageId,
            placeOfBirth: placeOfBirth,
            nationality: nationality,
            cprNo: cprNo,
            spokenLangAtHome: spokenLangAtHome,
            residanceAddress: residanceAddress,
            controlNumber: controlNumber,
            createdAt: createdAt,
            updatedAt: updatedAt,
            fullName: fullName,
            className: className,
            sectionName: sectionName,
            available: available,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudentsTable,
    Student,
    $$StudentsTableFilterComposer,
    $$StudentsTableOrderingComposer,
    $$StudentsTableAnnotationComposer,
    $$StudentsTableCreateCompanionBuilder,
    $$StudentsTableUpdateCompanionBuilder,
    (Student, BaseReferences<_$AppDatabase, $StudentsTable, Student>),
    Student,
    PrefetchHooks Function()>;
typedef $$FeesAssignmentsTableCreateCompanionBuilder = FeesAssignmentsCompanion
    Function({
  Value<int> id,
  required int feesAssignId,
  required int feesMasterId,
  required int studentId,
  required String controlNumber,
  Value<String> feesAmount,
  Value<String> paidAmount,
  Value<String> remainedAmount,
  Value<String?> quaterAmount,
  Value<int?> quaterOne,
  Value<int?> quaterTwo,
  Value<int?> quaterThree,
  Value<int?> quaterFour,
  Value<String?> comment,
  Value<String?> outstandingbalance,
  Value<String?> feeGroup,
  Value<String?> updated,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$FeesAssignmentsTableUpdateCompanionBuilder = FeesAssignmentsCompanion
    Function({
  Value<int> id,
  Value<int> feesAssignId,
  Value<int> feesMasterId,
  Value<int> studentId,
  Value<String> controlNumber,
  Value<String> feesAmount,
  Value<String> paidAmount,
  Value<String> remainedAmount,
  Value<String?> quaterAmount,
  Value<int?> quaterOne,
  Value<int?> quaterTwo,
  Value<int?> quaterThree,
  Value<int?> quaterFour,
  Value<String?> comment,
  Value<String?> outstandingbalance,
  Value<String?> feeGroup,
  Value<String?> updated,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$FeesAssignmentsTableFilterComposer
    extends Composer<_$AppDatabase, $FeesAssignmentsTable> {
  $$FeesAssignmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterOne => $composableBuilder(
      column: $table.quaterOne, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterTwo => $composableBuilder(
      column: $table.quaterTwo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feeGroup => $composableBuilder(
      column: $table.feeGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FeesAssignmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesAssignmentsTable> {
  $$FeesAssignmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterOne => $composableBuilder(
      column: $table.quaterOne, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterTwo => $composableBuilder(
      column: $table.quaterTwo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feeGroup => $composableBuilder(
      column: $table.feeGroup, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FeesAssignmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesAssignmentsTable> {
  $$FeesAssignmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId, builder: (column) => column);

  GeneratedColumn<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => column);

  GeneratedColumn<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => column);

  GeneratedColumn<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount, builder: (column) => column);

  GeneratedColumn<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount, builder: (column) => column);

  GeneratedColumn<int> get quaterOne =>
      $composableBuilder(column: $table.quaterOne, builder: (column) => column);

  GeneratedColumn<int> get quaterTwo =>
      $composableBuilder(column: $table.quaterTwo, builder: (column) => column);

  GeneratedColumn<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => column);

  GeneratedColumn<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance, builder: (column) => column);

  GeneratedColumn<String> get feeGroup =>
      $composableBuilder(column: $table.feeGroup, builder: (column) => column);

  GeneratedColumn<String> get updated =>
      $composableBuilder(column: $table.updated, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeesAssignmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesAssignmentsTable,
    FeesAssignment,
    $$FeesAssignmentsTableFilterComposer,
    $$FeesAssignmentsTableOrderingComposer,
    $$FeesAssignmentsTableAnnotationComposer,
    $$FeesAssignmentsTableCreateCompanionBuilder,
    $$FeesAssignmentsTableUpdateCompanionBuilder,
    (
      FeesAssignment,
      BaseReferences<_$AppDatabase, $FeesAssignmentsTable, FeesAssignment>
    ),
    FeesAssignment,
    PrefetchHooks Function()> {
  $$FeesAssignmentsTableTableManager(
      _$AppDatabase db, $FeesAssignmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesAssignmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesAssignmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesAssignmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> feesAssignId = const Value.absent(),
            Value<int> feesMasterId = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> controlNumber = const Value.absent(),
            Value<String> feesAmount = const Value.absent(),
            Value<String> paidAmount = const Value.absent(),
            Value<String> remainedAmount = const Value.absent(),
            Value<String?> quaterAmount = const Value.absent(),
            Value<int?> quaterOne = const Value.absent(),
            Value<int?> quaterTwo = const Value.absent(),
            Value<int?> quaterThree = const Value.absent(),
            Value<int?> quaterFour = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String?> outstandingbalance = const Value.absent(),
            Value<String?> feeGroup = const Value.absent(),
            Value<String?> updated = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesAssignmentsCompanion(
            id: id,
            feesAssignId: feesAssignId,
            feesMasterId: feesMasterId,
            studentId: studentId,
            controlNumber: controlNumber,
            feesAmount: feesAmount,
            paidAmount: paidAmount,
            remainedAmount: remainedAmount,
            quaterAmount: quaterAmount,
            quaterOne: quaterOne,
            quaterTwo: quaterTwo,
            quaterThree: quaterThree,
            quaterFour: quaterFour,
            comment: comment,
            outstandingbalance: outstandingbalance,
            feeGroup: feeGroup,
            updated: updated,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int feesAssignId,
            required int feesMasterId,
            required int studentId,
            required String controlNumber,
            Value<String> feesAmount = const Value.absent(),
            Value<String> paidAmount = const Value.absent(),
            Value<String> remainedAmount = const Value.absent(),
            Value<String?> quaterAmount = const Value.absent(),
            Value<int?> quaterOne = const Value.absent(),
            Value<int?> quaterTwo = const Value.absent(),
            Value<int?> quaterThree = const Value.absent(),
            Value<int?> quaterFour = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String?> outstandingbalance = const Value.absent(),
            Value<String?> feeGroup = const Value.absent(),
            Value<String?> updated = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesAssignmentsCompanion.insert(
            id: id,
            feesAssignId: feesAssignId,
            feesMasterId: feesMasterId,
            studentId: studentId,
            controlNumber: controlNumber,
            feesAmount: feesAmount,
            paidAmount: paidAmount,
            remainedAmount: remainedAmount,
            quaterAmount: quaterAmount,
            quaterOne: quaterOne,
            quaterTwo: quaterTwo,
            quaterThree: quaterThree,
            quaterFour: quaterFour,
            comment: comment,
            outstandingbalance: outstandingbalance,
            feeGroup: feeGroup,
            updated: updated,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesAssignmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesAssignmentsTable,
    FeesAssignment,
    $$FeesAssignmentsTableFilterComposer,
    $$FeesAssignmentsTableOrderingComposer,
    $$FeesAssignmentsTableAnnotationComposer,
    $$FeesAssignmentsTableCreateCompanionBuilder,
    $$FeesAssignmentsTableUpdateCompanionBuilder,
    (
      FeesAssignment,
      BaseReferences<_$AppDatabase, $FeesAssignmentsTable, FeesAssignment>
    ),
    FeesAssignment,
    PrefetchHooks Function()>;
typedef $$FeesAssignChildrenTableCreateCompanionBuilder
    = FeesAssignChildrenCompanion Function({
  Value<int> id,
  required int feesAssignId,
  required int feesMasterId,
  required int studentId,
  required String controlNumber,
  Value<String> feesAmount,
  Value<String> paidAmount,
  Value<String> remainedAmount,
  Value<String?> quaterAmount,
  Value<int?> quaterOne,
  Value<int?> quaterTwo,
  Value<int?> quaterThree,
  Value<int?> quaterFour,
  Value<String?> comment,
  Value<String?> outstandingbalance,
  Value<String?> feeGroup,
  Value<String?> updated,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$FeesAssignChildrenTableUpdateCompanionBuilder
    = FeesAssignChildrenCompanion Function({
  Value<int> id,
  Value<int> feesAssignId,
  Value<int> feesMasterId,
  Value<int> studentId,
  Value<String> controlNumber,
  Value<String> feesAmount,
  Value<String> paidAmount,
  Value<String> remainedAmount,
  Value<String?> quaterAmount,
  Value<int?> quaterOne,
  Value<int?> quaterTwo,
  Value<int?> quaterThree,
  Value<int?> quaterFour,
  Value<String?> comment,
  Value<String?> outstandingbalance,
  Value<String?> feeGroup,
  Value<String?> updated,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$FeesAssignChildrenTableFilterComposer
    extends Composer<_$AppDatabase, $FeesAssignChildrenTable> {
  $$FeesAssignChildrenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterOne => $composableBuilder(
      column: $table.quaterOne, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterTwo => $composableBuilder(
      column: $table.quaterTwo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feeGroup => $composableBuilder(
      column: $table.feeGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FeesAssignChildrenTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesAssignChildrenTable> {
  $$FeesAssignChildrenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterOne => $composableBuilder(
      column: $table.quaterOne, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterTwo => $composableBuilder(
      column: $table.quaterTwo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feeGroup => $composableBuilder(
      column: $table.feeGroup, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FeesAssignChildrenTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesAssignChildrenTable> {
  $$FeesAssignChildrenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get feesAssignId => $composableBuilder(
      column: $table.feesAssignId, builder: (column) => column);

  GeneratedColumn<int> get feesMasterId => $composableBuilder(
      column: $table.feesMasterId, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => column);

  GeneratedColumn<String> get feesAmount => $composableBuilder(
      column: $table.feesAmount, builder: (column) => column);

  GeneratedColumn<String> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<String> get remainedAmount => $composableBuilder(
      column: $table.remainedAmount, builder: (column) => column);

  GeneratedColumn<String> get quaterAmount => $composableBuilder(
      column: $table.quaterAmount, builder: (column) => column);

  GeneratedColumn<int> get quaterOne =>
      $composableBuilder(column: $table.quaterOne, builder: (column) => column);

  GeneratedColumn<int> get quaterTwo =>
      $composableBuilder(column: $table.quaterTwo, builder: (column) => column);

  GeneratedColumn<int> get quaterThree => $composableBuilder(
      column: $table.quaterThree, builder: (column) => column);

  GeneratedColumn<int> get quaterFour => $composableBuilder(
      column: $table.quaterFour, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get outstandingbalance => $composableBuilder(
      column: $table.outstandingbalance, builder: (column) => column);

  GeneratedColumn<String> get feeGroup =>
      $composableBuilder(column: $table.feeGroup, builder: (column) => column);

  GeneratedColumn<String> get updated =>
      $composableBuilder(column: $table.updated, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeesAssignChildrenTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesAssignChildrenTable,
    FeesAssignChildrenData,
    $$FeesAssignChildrenTableFilterComposer,
    $$FeesAssignChildrenTableOrderingComposer,
    $$FeesAssignChildrenTableAnnotationComposer,
    $$FeesAssignChildrenTableCreateCompanionBuilder,
    $$FeesAssignChildrenTableUpdateCompanionBuilder,
    (
      FeesAssignChildrenData,
      BaseReferences<_$AppDatabase, $FeesAssignChildrenTable,
          FeesAssignChildrenData>
    ),
    FeesAssignChildrenData,
    PrefetchHooks Function()> {
  $$FeesAssignChildrenTableTableManager(
      _$AppDatabase db, $FeesAssignChildrenTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesAssignChildrenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesAssignChildrenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesAssignChildrenTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> feesAssignId = const Value.absent(),
            Value<int> feesMasterId = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> controlNumber = const Value.absent(),
            Value<String> feesAmount = const Value.absent(),
            Value<String> paidAmount = const Value.absent(),
            Value<String> remainedAmount = const Value.absent(),
            Value<String?> quaterAmount = const Value.absent(),
            Value<int?> quaterOne = const Value.absent(),
            Value<int?> quaterTwo = const Value.absent(),
            Value<int?> quaterThree = const Value.absent(),
            Value<int?> quaterFour = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String?> outstandingbalance = const Value.absent(),
            Value<String?> feeGroup = const Value.absent(),
            Value<String?> updated = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesAssignChildrenCompanion(
            id: id,
            feesAssignId: feesAssignId,
            feesMasterId: feesMasterId,
            studentId: studentId,
            controlNumber: controlNumber,
            feesAmount: feesAmount,
            paidAmount: paidAmount,
            remainedAmount: remainedAmount,
            quaterAmount: quaterAmount,
            quaterOne: quaterOne,
            quaterTwo: quaterTwo,
            quaterThree: quaterThree,
            quaterFour: quaterFour,
            comment: comment,
            outstandingbalance: outstandingbalance,
            feeGroup: feeGroup,
            updated: updated,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int feesAssignId,
            required int feesMasterId,
            required int studentId,
            required String controlNumber,
            Value<String> feesAmount = const Value.absent(),
            Value<String> paidAmount = const Value.absent(),
            Value<String> remainedAmount = const Value.absent(),
            Value<String?> quaterAmount = const Value.absent(),
            Value<int?> quaterOne = const Value.absent(),
            Value<int?> quaterTwo = const Value.absent(),
            Value<int?> quaterThree = const Value.absent(),
            Value<int?> quaterFour = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String?> outstandingbalance = const Value.absent(),
            Value<String?> feeGroup = const Value.absent(),
            Value<String?> updated = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesAssignChildrenCompanion.insert(
            id: id,
            feesAssignId: feesAssignId,
            feesMasterId: feesMasterId,
            studentId: studentId,
            controlNumber: controlNumber,
            feesAmount: feesAmount,
            paidAmount: paidAmount,
            remainedAmount: remainedAmount,
            quaterAmount: quaterAmount,
            quaterOne: quaterOne,
            quaterTwo: quaterTwo,
            quaterThree: quaterThree,
            quaterFour: quaterFour,
            comment: comment,
            outstandingbalance: outstandingbalance,
            feeGroup: feeGroup,
            updated: updated,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesAssignChildrenTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesAssignChildrenTable,
    FeesAssignChildrenData,
    $$FeesAssignChildrenTableFilterComposer,
    $$FeesAssignChildrenTableOrderingComposer,
    $$FeesAssignChildrenTableAnnotationComposer,
    $$FeesAssignChildrenTableCreateCompanionBuilder,
    $$FeesAssignChildrenTableUpdateCompanionBuilder,
    (
      FeesAssignChildrenData,
      BaseReferences<_$AppDatabase, $FeesAssignChildrenTable,
          FeesAssignChildrenData>
    ),
    FeesAssignChildrenData,
    PrefetchHooks Function()>;
typedef $$ExamTypesTableCreateCompanionBuilder = ExamTypesCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> type,
  Value<int?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$ExamTypesTableUpdateCompanionBuilder = ExamTypesCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> type,
  Value<int?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$ExamTypesTableFilterComposer
    extends Composer<_$AppDatabase, $ExamTypesTable> {
  $$ExamTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ExamTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamTypesTable> {
  $$ExamTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExamTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamTypesTable> {
  $$ExamTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ExamTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExamTypesTable,
    ExamType,
    $$ExamTypesTableFilterComposer,
    $$ExamTypesTableOrderingComposer,
    $$ExamTypesTableAnnotationComposer,
    $$ExamTypesTableCreateCompanionBuilder,
    $$ExamTypesTableUpdateCompanionBuilder,
    (ExamType, BaseReferences<_$AppDatabase, $ExamTypesTable, ExamType>),
    ExamType,
    PrefetchHooks Function()> {
  $$ExamTypesTableTableManager(_$AppDatabase db, $ExamTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              ExamTypesCompanion(
            id: id,
            name: name,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              ExamTypesCompanion.insert(
            id: id,
            name: name,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExamTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExamTypesTable,
    ExamType,
    $$ExamTypesTableFilterComposer,
    $$ExamTypesTableOrderingComposer,
    $$ExamTypesTableAnnotationComposer,
    $$ExamTypesTableCreateCompanionBuilder,
    $$ExamTypesTableUpdateCompanionBuilder,
    (ExamType, BaseReferences<_$AppDatabase, $ExamTypesTable, ExamType>),
    ExamType,
    PrefetchHooks Function()>;
typedef $$ClassesTableCreateCompanionBuilder = ClassesCompanion Function({
  Value<int> id,
  required String name,
  required int status,
  required int orders,
  required String createdAt,
  required String updatedAt,
  required String classTran,
});
typedef $$ClassesTableUpdateCompanionBuilder = ClassesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> status,
  Value<int> orders,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<String> classTran,
});

class $$ClassesTableFilterComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orders => $composableBuilder(
      column: $table.orders, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get classTran => $composableBuilder(
      column: $table.classTran, builder: (column) => ColumnFilters(column));
}

class $$ClassesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orders => $composableBuilder(
      column: $table.orders, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get classTran => $composableBuilder(
      column: $table.classTran, builder: (column) => ColumnOrderings(column));
}

class $$ClassesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get orders =>
      $composableBuilder(column: $table.orders, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get classTran =>
      $composableBuilder(column: $table.classTran, builder: (column) => column);
}

class $$ClassesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClassesTable,
    ClassesData,
    $$ClassesTableFilterComposer,
    $$ClassesTableOrderingComposer,
    $$ClassesTableAnnotationComposer,
    $$ClassesTableCreateCompanionBuilder,
    $$ClassesTableUpdateCompanionBuilder,
    (ClassesData, BaseReferences<_$AppDatabase, $ClassesTable, ClassesData>),
    ClassesData,
    PrefetchHooks Function()> {
  $$ClassesTableTableManager(_$AppDatabase db, $ClassesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClassesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClassesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<int> orders = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<String> classTran = const Value.absent(),
          }) =>
              ClassesCompanion(
            id: id,
            name: name,
            status: status,
            orders: orders,
            createdAt: createdAt,
            updatedAt: updatedAt,
            classTran: classTran,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int status,
            required int orders,
            required String createdAt,
            required String updatedAt,
            required String classTran,
          }) =>
              ClassesCompanion.insert(
            id: id,
            name: name,
            status: status,
            orders: orders,
            createdAt: createdAt,
            updatedAt: updatedAt,
            classTran: classTran,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClassesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClassesTable,
    ClassesData,
    $$ClassesTableFilterComposer,
    $$ClassesTableOrderingComposer,
    $$ClassesTableAnnotationComposer,
    $$ClassesTableCreateCompanionBuilder,
    $$ClassesTableUpdateCompanionBuilder,
    (ClassesData, BaseReferences<_$AppDatabase, $ClassesTable, ClassesData>),
    ClassesData,
    PrefetchHooks Function()>;
typedef $$SubjectsTableCreateCompanionBuilder = SubjectsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> code,
  required int type,
  required int status,
  required String createdAt,
  required String updatedAt,
});
typedef $$SubjectsTableUpdateCompanionBuilder = SubjectsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> code,
  Value<int> type,
  Value<int> status,
  Value<String> createdAt,
  Value<String> updatedAt,
});

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()> {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
          }) =>
              SubjectsCompanion(
            id: id,
            name: name,
            code: code,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> code = const Value.absent(),
            required int type,
            required int status,
            required String createdAt,
            required String updatedAt,
          }) =>
              SubjectsCompanion.insert(
            id: id,
            name: name,
            code: code,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()>;
typedef $$SectionsTableCreateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  required String name,
  required int status,
  required String createdAt,
  required String updatedAt,
  required String sectionTran,
});
typedef $$SectionsTableUpdateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> status,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<String> sectionTran,
});

class $$SectionsTableFilterComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sectionTran => $composableBuilder(
      column: $table.sectionTran, builder: (column) => ColumnFilters(column));
}

class $$SectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sectionTran => $composableBuilder(
      column: $table.sectionTran, builder: (column) => ColumnOrderings(column));
}

class $$SectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get sectionTran => $composableBuilder(
      column: $table.sectionTran, builder: (column) => column);
}

class $$SectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section, BaseReferences<_$AppDatabase, $SectionsTable, Section>),
    Section,
    PrefetchHooks Function()> {
  $$SectionsTableTableManager(_$AppDatabase db, $SectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<String> sectionTran = const Value.absent(),
          }) =>
              SectionsCompanion(
            id: id,
            name: name,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            sectionTran: sectionTran,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int status,
            required String createdAt,
            required String updatedAt,
            required String sectionTran,
          }) =>
              SectionsCompanion.insert(
            id: id,
            name: name,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            sectionTran: sectionTran,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section, BaseReferences<_$AppDatabase, $SectionsTable, Section>),
    Section,
    PrefetchHooks Function()>;
typedef $$ExamsTableCreateCompanionBuilder = ExamsCompanion Function({
  Value<int> id,
  required int sectionId,
  required int examTypeId,
  required int subjectId,
  required int classId,
  Value<String?> marks,
  Value<int?> status,
});
typedef $$ExamsTableUpdateCompanionBuilder = ExamsCompanion Function({
  Value<int> id,
  Value<int> sectionId,
  Value<int> examTypeId,
  Value<int> subjectId,
  Value<int> classId,
  Value<String?> marks,
  Value<int?> status,
});

class $$ExamsTableFilterComposer extends Composer<_$AppDatabase, $ExamsTable> {
  $$ExamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sectionId => $composableBuilder(
      column: $table.sectionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get examTypeId => $composableBuilder(
      column: $table.examTypeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get classId => $composableBuilder(
      column: $table.classId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get marks => $composableBuilder(
      column: $table.marks, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$ExamsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamsTable> {
  $$ExamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sectionId => $composableBuilder(
      column: $table.sectionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get examTypeId => $composableBuilder(
      column: $table.examTypeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get classId => $composableBuilder(
      column: $table.classId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get marks => $composableBuilder(
      column: $table.marks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$ExamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamsTable> {
  $$ExamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sectionId =>
      $composableBuilder(column: $table.sectionId, builder: (column) => column);

  GeneratedColumn<int> get examTypeId => $composableBuilder(
      column: $table.examTypeId, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<int> get classId =>
      $composableBuilder(column: $table.classId, builder: (column) => column);

  GeneratedColumn<String> get marks =>
      $composableBuilder(column: $table.marks, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ExamsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExamsTable,
    Exam,
    $$ExamsTableFilterComposer,
    $$ExamsTableOrderingComposer,
    $$ExamsTableAnnotationComposer,
    $$ExamsTableCreateCompanionBuilder,
    $$ExamsTableUpdateCompanionBuilder,
    (Exam, BaseReferences<_$AppDatabase, $ExamsTable, Exam>),
    Exam,
    PrefetchHooks Function()> {
  $$ExamsTableTableManager(_$AppDatabase db, $ExamsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sectionId = const Value.absent(),
            Value<int> examTypeId = const Value.absent(),
            Value<int> subjectId = const Value.absent(),
            Value<int> classId = const Value.absent(),
            Value<String?> marks = const Value.absent(),
            Value<int?> status = const Value.absent(),
          }) =>
              ExamsCompanion(
            id: id,
            sectionId: sectionId,
            examTypeId: examTypeId,
            subjectId: subjectId,
            classId: classId,
            marks: marks,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sectionId,
            required int examTypeId,
            required int subjectId,
            required int classId,
            Value<String?> marks = const Value.absent(),
            Value<int?> status = const Value.absent(),
          }) =>
              ExamsCompanion.insert(
            id: id,
            sectionId: sectionId,
            examTypeId: examTypeId,
            subjectId: subjectId,
            classId: classId,
            marks: marks,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExamsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExamsTable,
    Exam,
    $$ExamsTableFilterComposer,
    $$ExamsTableOrderingComposer,
    $$ExamsTableAnnotationComposer,
    $$ExamsTableCreateCompanionBuilder,
    $$ExamsTableUpdateCompanionBuilder,
    (Exam, BaseReferences<_$AppDatabase, $ExamsTable, Exam>),
    Exam,
    PrefetchHooks Function()>;
typedef $$MarksRegisterChildrensTableCreateCompanionBuilder
    = MarksRegisterChildrensCompanion Function({
  Value<int> id,
  required int marksRegisterId,
  required int studentId,
  required String title,
  required int mark,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$MarksRegisterChildrensTableUpdateCompanionBuilder
    = MarksRegisterChildrensCompanion Function({
  Value<int> id,
  Value<int> marksRegisterId,
  Value<int> studentId,
  Value<String> title,
  Value<int> mark,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$MarksRegisterChildrensTableFilterComposer
    extends Composer<_$AppDatabase, $MarksRegisterChildrensTable> {
  $$MarksRegisterChildrensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get marksRegisterId => $composableBuilder(
      column: $table.marksRegisterId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mark => $composableBuilder(
      column: $table.mark, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MarksRegisterChildrensTableOrderingComposer
    extends Composer<_$AppDatabase, $MarksRegisterChildrensTable> {
  $$MarksRegisterChildrensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get marksRegisterId => $composableBuilder(
      column: $table.marksRegisterId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mark => $composableBuilder(
      column: $table.mark, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MarksRegisterChildrensTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarksRegisterChildrensTable> {
  $$MarksRegisterChildrensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get marksRegisterId => $composableBuilder(
      column: $table.marksRegisterId, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get mark =>
      $composableBuilder(column: $table.mark, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MarksRegisterChildrensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MarksRegisterChildrensTable,
    MarksRegisterChildren,
    $$MarksRegisterChildrensTableFilterComposer,
    $$MarksRegisterChildrensTableOrderingComposer,
    $$MarksRegisterChildrensTableAnnotationComposer,
    $$MarksRegisterChildrensTableCreateCompanionBuilder,
    $$MarksRegisterChildrensTableUpdateCompanionBuilder,
    (
      MarksRegisterChildren,
      BaseReferences<_$AppDatabase, $MarksRegisterChildrensTable,
          MarksRegisterChildren>
    ),
    MarksRegisterChildren,
    PrefetchHooks Function()> {
  $$MarksRegisterChildrensTableTableManager(
      _$AppDatabase db, $MarksRegisterChildrensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarksRegisterChildrensTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MarksRegisterChildrensTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MarksRegisterChildrensTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> marksRegisterId = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> mark = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              MarksRegisterChildrensCompanion(
            id: id,
            marksRegisterId: marksRegisterId,
            studentId: studentId,
            title: title,
            mark: mark,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int marksRegisterId,
            required int studentId,
            required String title,
            required int mark,
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              MarksRegisterChildrensCompanion.insert(
            id: id,
            marksRegisterId: marksRegisterId,
            studentId: studentId,
            title: title,
            mark: mark,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MarksRegisterChildrensTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MarksRegisterChildrensTable,
        MarksRegisterChildren,
        $$MarksRegisterChildrensTableFilterComposer,
        $$MarksRegisterChildrensTableOrderingComposer,
        $$MarksRegisterChildrensTableAnnotationComposer,
        $$MarksRegisterChildrensTableCreateCompanionBuilder,
        $$MarksRegisterChildrensTableUpdateCompanionBuilder,
        (
          MarksRegisterChildren,
          BaseReferences<_$AppDatabase, $MarksRegisterChildrensTable,
              MarksRegisterChildren>
        ),
        MarksRegisterChildren,
        PrefetchHooks Function()>;
typedef $$FeesMastersTableCreateCompanionBuilder = FeesMastersCompanion
    Function({
  Value<int> id,
  Value<int?> sessionId,
  Value<int?> feesGroupId,
  Value<int?> feesTypeId,
  Value<String?> dueDate,
  Value<String?> amount,
  Value<int?> fineType,
  Value<int?> percentage,
  Value<String?> fineAmount,
  Value<int?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$FeesMastersTableUpdateCompanionBuilder = FeesMastersCompanion
    Function({
  Value<int> id,
  Value<int?> sessionId,
  Value<int?> feesGroupId,
  Value<int?> feesTypeId,
  Value<String?> dueDate,
  Value<String?> amount,
  Value<int?> fineType,
  Value<int?> percentage,
  Value<String?> fineAmount,
  Value<int?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$FeesMastersTableFilterComposer
    extends Composer<_$AppDatabase, $FeesMastersTable> {
  $$FeesMastersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesGroupId => $composableBuilder(
      column: $table.feesGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesTypeId => $composableBuilder(
      column: $table.feesTypeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fineType => $composableBuilder(
      column: $table.fineType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FeesMastersTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesMastersTable> {
  $$FeesMastersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesGroupId => $composableBuilder(
      column: $table.feesGroupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesTypeId => $composableBuilder(
      column: $table.feesTypeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fineType => $composableBuilder(
      column: $table.fineType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FeesMastersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesMastersTable> {
  $$FeesMastersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<int> get feesGroupId => $composableBuilder(
      column: $table.feesGroupId, builder: (column) => column);

  GeneratedColumn<int> get feesTypeId => $composableBuilder(
      column: $table.feesTypeId, builder: (column) => column);

  GeneratedColumn<String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get fineType =>
      $composableBuilder(column: $table.fineType, builder: (column) => column);

  GeneratedColumn<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => column);

  GeneratedColumn<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeesMastersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesMastersTable,
    FeesMaster,
    $$FeesMastersTableFilterComposer,
    $$FeesMastersTableOrderingComposer,
    $$FeesMastersTableAnnotationComposer,
    $$FeesMastersTableCreateCompanionBuilder,
    $$FeesMastersTableUpdateCompanionBuilder,
    (FeesMaster, BaseReferences<_$AppDatabase, $FeesMastersTable, FeesMaster>),
    FeesMaster,
    PrefetchHooks Function()> {
  $$FeesMastersTableTableManager(_$AppDatabase db, $FeesMastersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesMastersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesMastersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesMastersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> sessionId = const Value.absent(),
            Value<int?> feesGroupId = const Value.absent(),
            Value<int?> feesTypeId = const Value.absent(),
            Value<String?> dueDate = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<int?> fineType = const Value.absent(),
            Value<int?> percentage = const Value.absent(),
            Value<String?> fineAmount = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesMastersCompanion(
            id: id,
            sessionId: sessionId,
            feesGroupId: feesGroupId,
            feesTypeId: feesTypeId,
            dueDate: dueDate,
            amount: amount,
            fineType: fineType,
            percentage: percentage,
            fineAmount: fineAmount,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> sessionId = const Value.absent(),
            Value<int?> feesGroupId = const Value.absent(),
            Value<int?> feesTypeId = const Value.absent(),
            Value<String?> dueDate = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<int?> fineType = const Value.absent(),
            Value<int?> percentage = const Value.absent(),
            Value<String?> fineAmount = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesMastersCompanion.insert(
            id: id,
            sessionId: sessionId,
            feesGroupId: feesGroupId,
            feesTypeId: feesTypeId,
            dueDate: dueDate,
            amount: amount,
            fineType: fineType,
            percentage: percentage,
            fineAmount: fineAmount,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesMastersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesMastersTable,
    FeesMaster,
    $$FeesMastersTableFilterComposer,
    $$FeesMastersTableOrderingComposer,
    $$FeesMastersTableAnnotationComposer,
    $$FeesMastersTableCreateCompanionBuilder,
    $$FeesMastersTableUpdateCompanionBuilder,
    (FeesMaster, BaseReferences<_$AppDatabase, $FeesMastersTable, FeesMaster>),
    FeesMaster,
    PrefetchHooks Function()>;
typedef $$FeesTypeTableCreateCompanionBuilder = FeesTypeCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> code,
  Value<String?> description,
  Value<int?> status,
  Value<int?> classId,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$FeesTypeTableUpdateCompanionBuilder = FeesTypeCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> code,
  Value<String?> description,
  Value<int?> status,
  Value<int?> classId,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$FeesTypeTableFilterComposer
    extends Composer<_$AppDatabase, $FeesTypeTable> {
  $$FeesTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get classId => $composableBuilder(
      column: $table.classId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FeesTypeTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesTypeTable> {
  $$FeesTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get classId => $composableBuilder(
      column: $table.classId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FeesTypeTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesTypeTable> {
  $$FeesTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get classId =>
      $composableBuilder(column: $table.classId, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FeesTypeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesTypeTable,
    FeesTypeData,
    $$FeesTypeTableFilterComposer,
    $$FeesTypeTableOrderingComposer,
    $$FeesTypeTableAnnotationComposer,
    $$FeesTypeTableCreateCompanionBuilder,
    $$FeesTypeTableUpdateCompanionBuilder,
    (FeesTypeData, BaseReferences<_$AppDatabase, $FeesTypeTable, FeesTypeData>),
    FeesTypeData,
    PrefetchHooks Function()> {
  $$FeesTypeTableTableManager(_$AppDatabase db, $FeesTypeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> classId = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesTypeCompanion(
            id: id,
            name: name,
            code: code,
            description: description,
            status: status,
            classId: classId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> classId = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              FeesTypeCompanion.insert(
            id: id,
            name: name,
            code: code,
            description: description,
            status: status,
            classId: classId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesTypeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesTypeTable,
    FeesTypeData,
    $$FeesTypeTableFilterComposer,
    $$FeesTypeTableOrderingComposer,
    $$FeesTypeTableAnnotationComposer,
    $$FeesTypeTableCreateCompanionBuilder,
    $$FeesTypeTableUpdateCompanionBuilder,
    (FeesTypeData, BaseReferences<_$AppDatabase, $FeesTypeTable, FeesTypeData>),
    FeesTypeData,
    PrefetchHooks Function()>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> date,
  Value<int?> paymentMethod,
  Value<String?> paymentGateway,
  Value<String?> transactionId,
  Value<int?> feesAssignChildrenId,
  Value<int?> feesCollectBy,
  Value<int?> studentId,
  Value<int?> sessionId,
  Value<String?> amount,
  Value<String?> fineAmount,
  Value<int?> accountId,
  Value<String?> comments,
  Value<int?> printed,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> date,
  Value<int?> paymentMethod,
  Value<String?> paymentGateway,
  Value<String?> transactionId,
  Value<int?> feesAssignChildrenId,
  Value<int?> feesCollectBy,
  Value<int?> studentId,
  Value<int?> sessionId,
  Value<String?> amount,
  Value<String?> fineAmount,
  Value<int?> accountId,
  Value<String?> comments,
  Value<int?> printed,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentGateway => $composableBuilder(
      column: $table.paymentGateway,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesAssignChildrenId => $composableBuilder(
      column: $table.feesAssignChildrenId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feesCollectBy => $composableBuilder(
      column: $table.feesCollectBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comments => $composableBuilder(
      column: $table.comments, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get printed => $composableBuilder(
      column: $table.printed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentGateway => $composableBuilder(
      column: $table.paymentGateway,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesAssignChildrenId => $composableBuilder(
      column: $table.feesAssignChildrenId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feesCollectBy => $composableBuilder(
      column: $table.feesCollectBy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comments => $composableBuilder(
      column: $table.comments, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get printed => $composableBuilder(
      column: $table.printed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get paymentGateway => $composableBuilder(
      column: $table.paymentGateway, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<int> get feesAssignChildrenId => $composableBuilder(
      column: $table.feesAssignChildrenId, builder: (column) => column);

  GeneratedColumn<int> get feesCollectBy => $composableBuilder(
      column: $table.feesCollectBy, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<int> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get fineAmount => $composableBuilder(
      column: $table.fineAmount, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get comments =>
      $composableBuilder(column: $table.comments, builder: (column) => column);

  GeneratedColumn<int> get printed =>
      $composableBuilder(column: $table.printed, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      Transaction,
      BaseReferences<_$AppDatabase, $TransactionsTable, Transaction>
    ),
    Transaction,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> date = const Value.absent(),
            Value<int?> paymentMethod = const Value.absent(),
            Value<String?> paymentGateway = const Value.absent(),
            Value<String?> transactionId = const Value.absent(),
            Value<int?> feesAssignChildrenId = const Value.absent(),
            Value<int?> feesCollectBy = const Value.absent(),
            Value<int?> studentId = const Value.absent(),
            Value<int?> sessionId = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<String?> fineAmount = const Value.absent(),
            Value<int?> accountId = const Value.absent(),
            Value<String?> comments = const Value.absent(),
            Value<int?> printed = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            date: date,
            paymentMethod: paymentMethod,
            paymentGateway: paymentGateway,
            transactionId: transactionId,
            feesAssignChildrenId: feesAssignChildrenId,
            feesCollectBy: feesCollectBy,
            studentId: studentId,
            sessionId: sessionId,
            amount: amount,
            fineAmount: fineAmount,
            accountId: accountId,
            comments: comments,
            printed: printed,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> date = const Value.absent(),
            Value<int?> paymentMethod = const Value.absent(),
            Value<String?> paymentGateway = const Value.absent(),
            Value<String?> transactionId = const Value.absent(),
            Value<int?> feesAssignChildrenId = const Value.absent(),
            Value<int?> feesCollectBy = const Value.absent(),
            Value<int?> studentId = const Value.absent(),
            Value<int?> sessionId = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<String?> fineAmount = const Value.absent(),
            Value<int?> accountId = const Value.absent(),
            Value<String?> comments = const Value.absent(),
            Value<int?> printed = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            date: date,
            paymentMethod: paymentMethod,
            paymentGateway: paymentGateway,
            transactionId: transactionId,
            feesAssignChildrenId: feesAssignChildrenId,
            feesCollectBy: feesCollectBy,
            studentId: studentId,
            sessionId: sessionId,
            amount: amount,
            fineAmount: fineAmount,
            accountId: accountId,
            comments: comments,
            printed: printed,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      Transaction,
      BaseReferences<_$AppDatabase, $TransactionsTable, Transaction>
    ),
    Transaction,
    PrefetchHooks Function()>;
typedef $$BankAccountsTableCreateCompanionBuilder = BankAccountsCompanion
    Function({
  Value<int> id,
  required String bankName,
  required String accountName,
  required String accountNumber,
  Value<String?> accountType,
  Value<String> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$BankAccountsTableUpdateCompanionBuilder = BankAccountsCompanion
    Function({
  Value<int> id,
  Value<String> bankName,
  Value<String> accountName,
  Value<String> accountNumber,
  Value<String?> accountType,
  Value<String> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$BankAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $BankAccountsTable> {
  $$BankAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BankAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $BankAccountsTable> {
  $$BankAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BankAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankAccountsTable> {
  $$BankAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => column);

  GeneratedColumn<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BankAccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankAccountsTable,
    BankAccount,
    $$BankAccountsTableFilterComposer,
    $$BankAccountsTableOrderingComposer,
    $$BankAccountsTableAnnotationComposer,
    $$BankAccountsTableCreateCompanionBuilder,
    $$BankAccountsTableUpdateCompanionBuilder,
    (
      BankAccount,
      BaseReferences<_$AppDatabase, $BankAccountsTable, BankAccount>
    ),
    BankAccount,
    PrefetchHooks Function()> {
  $$BankAccountsTableTableManager(_$AppDatabase db, $BankAccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> bankName = const Value.absent(),
            Value<String> accountName = const Value.absent(),
            Value<String> accountNumber = const Value.absent(),
            Value<String?> accountType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              BankAccountsCompanion(
            id: id,
            bankName: bankName,
            accountName: accountName,
            accountNumber: accountNumber,
            accountType: accountType,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String bankName,
            required String accountName,
            required String accountNumber,
            Value<String?> accountType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              BankAccountsCompanion.insert(
            id: id,
            bankName: bankName,
            accountName: accountName,
            accountNumber: accountNumber,
            accountType: accountType,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BankAccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BankAccountsTable,
    BankAccount,
    $$BankAccountsTableFilterComposer,
    $$BankAccountsTableOrderingComposer,
    $$BankAccountsTableAnnotationComposer,
    $$BankAccountsTableCreateCompanionBuilder,
    $$BankAccountsTableUpdateCompanionBuilder,
    (
      BankAccount,
      BaseReferences<_$AppDatabase, $BankAccountsTable, BankAccount>
    ),
    BankAccount,
    PrefetchHooks Function()>;
typedef $$SubjectAssignChildrensTableCreateCompanionBuilder
    = SubjectAssignChildrensCompanion Function({
  Value<int> id,
  required String subjectAssignId,
  required String subjectId,
  required String staffId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$SubjectAssignChildrensTableUpdateCompanionBuilder
    = SubjectAssignChildrensCompanion Function({
  Value<int> id,
  Value<String> subjectAssignId,
  Value<String> subjectId,
  Value<String> staffId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$SubjectAssignChildrensTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectAssignChildrensTable> {
  $$SubjectAssignChildrensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectAssignId => $composableBuilder(
      column: $table.subjectAssignId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SubjectAssignChildrensTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectAssignChildrensTable> {
  $$SubjectAssignChildrensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectAssignId => $composableBuilder(
      column: $table.subjectAssignId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SubjectAssignChildrensTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectAssignChildrensTable> {
  $$SubjectAssignChildrensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectAssignId => $composableBuilder(
      column: $table.subjectAssignId, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubjectAssignChildrensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectAssignChildrensTable,
    SubjectAssignChildren,
    $$SubjectAssignChildrensTableFilterComposer,
    $$SubjectAssignChildrensTableOrderingComposer,
    $$SubjectAssignChildrensTableAnnotationComposer,
    $$SubjectAssignChildrensTableCreateCompanionBuilder,
    $$SubjectAssignChildrensTableUpdateCompanionBuilder,
    (
      SubjectAssignChildren,
      BaseReferences<_$AppDatabase, $SubjectAssignChildrensTable,
          SubjectAssignChildren>
    ),
    SubjectAssignChildren,
    PrefetchHooks Function()> {
  $$SubjectAssignChildrensTableTableManager(
      _$AppDatabase db, $SubjectAssignChildrensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectAssignChildrensTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectAssignChildrensTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectAssignChildrensTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> subjectAssignId = const Value.absent(),
            Value<String> subjectId = const Value.absent(),
            Value<String> staffId = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              SubjectAssignChildrensCompanion(
            id: id,
            subjectAssignId: subjectAssignId,
            subjectId: subjectId,
            staffId: staffId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String subjectAssignId,
            required String subjectId,
            required String staffId,
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              SubjectAssignChildrensCompanion.insert(
            id: id,
            subjectAssignId: subjectAssignId,
            subjectId: subjectId,
            staffId: staffId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectAssignChildrensTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SubjectAssignChildrensTable,
        SubjectAssignChildren,
        $$SubjectAssignChildrensTableFilterComposer,
        $$SubjectAssignChildrensTableOrderingComposer,
        $$SubjectAssignChildrensTableAnnotationComposer,
        $$SubjectAssignChildrensTableCreateCompanionBuilder,
        $$SubjectAssignChildrensTableUpdateCompanionBuilder,
        (
          SubjectAssignChildren,
          BaseReferences<_$AppDatabase, $SubjectAssignChildrensTable,
              SubjectAssignChildren>
        ),
        SubjectAssignChildren,
        PrefetchHooks Function()>;
typedef $$SubjectAssignsTableCreateCompanionBuilder = SubjectAssignsCompanion
    Function({
  Value<int> id,
  required String sessionId,
  required String classesId,
  required String sectionId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$SubjectAssignsTableUpdateCompanionBuilder = SubjectAssignsCompanion
    Function({
  Value<int> id,
  Value<String> sessionId,
  Value<String> classesId,
  Value<String> sectionId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$SubjectAssignsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectAssignsTable> {
  $$SubjectAssignsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get classesId => $composableBuilder(
      column: $table.classesId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sectionId => $composableBuilder(
      column: $table.sectionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SubjectAssignsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectAssignsTable> {
  $$SubjectAssignsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get classesId => $composableBuilder(
      column: $table.classesId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sectionId => $composableBuilder(
      column: $table.sectionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SubjectAssignsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectAssignsTable> {
  $$SubjectAssignsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get classesId =>
      $composableBuilder(column: $table.classesId, builder: (column) => column);

  GeneratedColumn<String> get sectionId =>
      $composableBuilder(column: $table.sectionId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SubjectAssignsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectAssignsTable,
    SubjectAssign,
    $$SubjectAssignsTableFilterComposer,
    $$SubjectAssignsTableOrderingComposer,
    $$SubjectAssignsTableAnnotationComposer,
    $$SubjectAssignsTableCreateCompanionBuilder,
    $$SubjectAssignsTableUpdateCompanionBuilder,
    (
      SubjectAssign,
      BaseReferences<_$AppDatabase, $SubjectAssignsTable, SubjectAssign>
    ),
    SubjectAssign,
    PrefetchHooks Function()> {
  $$SubjectAssignsTableTableManager(
      _$AppDatabase db, $SubjectAssignsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectAssignsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectAssignsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectAssignsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String> classesId = const Value.absent(),
            Value<String> sectionId = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              SubjectAssignsCompanion(
            id: id,
            sessionId: sessionId,
            classesId: classesId,
            sectionId: sectionId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sessionId,
            required String classesId,
            required String sectionId,
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              SubjectAssignsCompanion.insert(
            id: id,
            sessionId: sessionId,
            classesId: classesId,
            sectionId: sectionId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectAssignsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectAssignsTable,
    SubjectAssign,
    $$SubjectAssignsTableFilterComposer,
    $$SubjectAssignsTableOrderingComposer,
    $$SubjectAssignsTableAnnotationComposer,
    $$SubjectAssignsTableCreateCompanionBuilder,
    $$SubjectAssignsTableUpdateCompanionBuilder,
    (
      SubjectAssign,
      BaseReferences<_$AppDatabase, $SubjectAssignsTable, SubjectAssign>
    ),
    SubjectAssign,
    PrefetchHooks Function()>;
typedef $$StaffTableCreateCompanionBuilder = StaffCompanion Function({
  Value<int> id,
  required String userId,
  required String staffId,
  required String roleId,
  required String designationId,
  required String departmentId,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> email,
  Value<String?> genderId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$StaffTableUpdateCompanionBuilder = StaffCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<String> staffId,
  Value<String> roleId,
  Value<String> designationId,
  Value<String> departmentId,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> email,
  Value<String?> genderId,
  Value<String?> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$StaffTableFilterComposer extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get designationId => $composableBuilder(
      column: $table.designationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get departmentId => $composableBuilder(
      column: $table.departmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$StaffTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get designationId => $composableBuilder(
      column: $table.designationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get departmentId => $composableBuilder(
      column: $table.departmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$StaffTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);

  GeneratedColumn<String> get designationId => $composableBuilder(
      column: $table.designationId, builder: (column) => column);

  GeneratedColumn<String> get departmentId => $composableBuilder(
      column: $table.departmentId, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get genderId =>
      $composableBuilder(column: $table.genderId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StaffTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StaffTable,
    StaffData,
    $$StaffTableFilterComposer,
    $$StaffTableOrderingComposer,
    $$StaffTableAnnotationComposer,
    $$StaffTableCreateCompanionBuilder,
    $$StaffTableUpdateCompanionBuilder,
    (StaffData, BaseReferences<_$AppDatabase, $StaffTable, StaffData>),
    StaffData,
    PrefetchHooks Function()> {
  $$StaffTableTableManager(_$AppDatabase db, $StaffTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> staffId = const Value.absent(),
            Value<String> roleId = const Value.absent(),
            Value<String> designationId = const Value.absent(),
            Value<String> departmentId = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> genderId = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              StaffCompanion(
            id: id,
            userId: userId,
            staffId: staffId,
            roleId: roleId,
            designationId: designationId,
            departmentId: departmentId,
            firstName: firstName,
            lastName: lastName,
            email: email,
            genderId: genderId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required String staffId,
            required String roleId,
            required String designationId,
            required String departmentId,
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> genderId = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              StaffCompanion.insert(
            id: id,
            userId: userId,
            staffId: staffId,
            roleId: roleId,
            designationId: designationId,
            departmentId: departmentId,
            firstName: firstName,
            lastName: lastName,
            email: email,
            genderId: genderId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StaffTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StaffTable,
    StaffData,
    $$StaffTableFilterComposer,
    $$StaffTableOrderingComposer,
    $$StaffTableAnnotationComposer,
    $$StaffTableCreateCompanionBuilder,
    $$StaffTableUpdateCompanionBuilder,
    (StaffData, BaseReferences<_$AppDatabase, $StaffTable, StaffData>),
    StaffData,
    PrefetchHooks Function()>;
typedef $$MarksGradeTableCreateCompanionBuilder = MarksGradeCompanion Function({
  Value<int> id,
  required String name,
  required double percentFrom,
  required double percentUpto,
  required int point,
  Value<String?> remarks,
  required int sessionId,
  Value<int> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$MarksGradeTableUpdateCompanionBuilder = MarksGradeCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> percentFrom,
  Value<double> percentUpto,
  Value<int> point,
  Value<String?> remarks,
  Value<int> sessionId,
  Value<int> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$MarksGradeTableFilterComposer
    extends Composer<_$AppDatabase, $MarksGradeTable> {
  $$MarksGradeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get percentFrom => $composableBuilder(
      column: $table.percentFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get percentUpto => $composableBuilder(
      column: $table.percentUpto, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get point => $composableBuilder(
      column: $table.point, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MarksGradeTableOrderingComposer
    extends Composer<_$AppDatabase, $MarksGradeTable> {
  $$MarksGradeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get percentFrom => $composableBuilder(
      column: $table.percentFrom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get percentUpto => $composableBuilder(
      column: $table.percentUpto, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get point => $composableBuilder(
      column: $table.point, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MarksGradeTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarksGradeTable> {
  $$MarksGradeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get percentFrom => $composableBuilder(
      column: $table.percentFrom, builder: (column) => column);

  GeneratedColumn<double> get percentUpto => $composableBuilder(
      column: $table.percentUpto, builder: (column) => column);

  GeneratedColumn<int> get point =>
      $composableBuilder(column: $table.point, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  GeneratedColumn<int> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MarksGradeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MarksGradeTable,
    MarksGradeData,
    $$MarksGradeTableFilterComposer,
    $$MarksGradeTableOrderingComposer,
    $$MarksGradeTableAnnotationComposer,
    $$MarksGradeTableCreateCompanionBuilder,
    $$MarksGradeTableUpdateCompanionBuilder,
    (
      MarksGradeData,
      BaseReferences<_$AppDatabase, $MarksGradeTable, MarksGradeData>
    ),
    MarksGradeData,
    PrefetchHooks Function()> {
  $$MarksGradeTableTableManager(_$AppDatabase db, $MarksGradeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarksGradeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarksGradeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MarksGradeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> percentFrom = const Value.absent(),
            Value<double> percentUpto = const Value.absent(),
            Value<int> point = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> sessionId = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              MarksGradeCompanion(
            id: id,
            name: name,
            percentFrom: percentFrom,
            percentUpto: percentUpto,
            point: point,
            remarks: remarks,
            sessionId: sessionId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double percentFrom,
            required double percentUpto,
            required int point,
            Value<String?> remarks = const Value.absent(),
            required int sessionId,
            Value<int> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              MarksGradeCompanion.insert(
            id: id,
            name: name,
            percentFrom: percentFrom,
            percentUpto: percentUpto,
            point: point,
            remarks: remarks,
            sessionId: sessionId,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MarksGradeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MarksGradeTable,
    MarksGradeData,
    $$MarksGradeTableFilterComposer,
    $$MarksGradeTableOrderingComposer,
    $$MarksGradeTableAnnotationComposer,
    $$MarksGradeTableCreateCompanionBuilder,
    $$MarksGradeTableUpdateCompanionBuilder,
    (
      MarksGradeData,
      BaseReferences<_$AppDatabase, $MarksGradeTable, MarksGradeData>
    ),
    MarksGradeData,
    PrefetchHooks Function()>;
typedef $$ParentDetailsTableCreateCompanionBuilder = ParentDetailsCompanion
    Function({
  Value<int> id,
  required int userId,
  Value<String?> fatherName,
  Value<String?> fatherMobile,
  Value<String?> fatherProfession,
  Value<String?> fatherImage,
  Value<String?> fatherNationality,
  Value<String?> motherName,
  Value<String?> motherMobile,
  Value<String?> motherProfession,
  Value<String?> motherImage,
  Value<String?> guardianName,
  Value<String?> guardianEmail,
  Value<String?> guardianMobile,
  Value<String?> guardianImage,
  Value<String?> guardianProfession,
  Value<String?> guardianRelation,
  Value<String?> guardianAddress,
  Value<int> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$ParentDetailsTableUpdateCompanionBuilder = ParentDetailsCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String?> fatherName,
  Value<String?> fatherMobile,
  Value<String?> fatherProfession,
  Value<String?> fatherImage,
  Value<String?> fatherNationality,
  Value<String?> motherName,
  Value<String?> motherMobile,
  Value<String?> motherProfession,
  Value<String?> motherImage,
  Value<String?> guardianName,
  Value<String?> guardianEmail,
  Value<String?> guardianMobile,
  Value<String?> guardianImage,
  Value<String?> guardianProfession,
  Value<String?> guardianRelation,
  Value<String?> guardianAddress,
  Value<int> status,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$ParentDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $ParentDetailsTable> {
  $$ParentDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherMobile => $composableBuilder(
      column: $table.fatherMobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherProfession => $composableBuilder(
      column: $table.fatherProfession,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherImage => $composableBuilder(
      column: $table.fatherImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherNationality => $composableBuilder(
      column: $table.fatherNationality,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motherName => $composableBuilder(
      column: $table.motherName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motherMobile => $composableBuilder(
      column: $table.motherMobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motherProfession => $composableBuilder(
      column: $table.motherProfession,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motherImage => $composableBuilder(
      column: $table.motherImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianName => $composableBuilder(
      column: $table.guardianName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianEmail => $composableBuilder(
      column: $table.guardianEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianMobile => $composableBuilder(
      column: $table.guardianMobile,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianImage => $composableBuilder(
      column: $table.guardianImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianProfession => $composableBuilder(
      column: $table.guardianProfession,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianAddress => $composableBuilder(
      column: $table.guardianAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ParentDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $ParentDetailsTable> {
  $$ParentDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherMobile => $composableBuilder(
      column: $table.fatherMobile,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherProfession => $composableBuilder(
      column: $table.fatherProfession,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherImage => $composableBuilder(
      column: $table.fatherImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherNationality => $composableBuilder(
      column: $table.fatherNationality,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motherName => $composableBuilder(
      column: $table.motherName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motherMobile => $composableBuilder(
      column: $table.motherMobile,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motherProfession => $composableBuilder(
      column: $table.motherProfession,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motherImage => $composableBuilder(
      column: $table.motherImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianName => $composableBuilder(
      column: $table.guardianName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianEmail => $composableBuilder(
      column: $table.guardianEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianMobile => $composableBuilder(
      column: $table.guardianMobile,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianImage => $composableBuilder(
      column: $table.guardianImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianProfession => $composableBuilder(
      column: $table.guardianProfession,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianAddress => $composableBuilder(
      column: $table.guardianAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ParentDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParentDetailsTable> {
  $$ParentDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => column);

  GeneratedColumn<String> get fatherMobile => $composableBuilder(
      column: $table.fatherMobile, builder: (column) => column);

  GeneratedColumn<String> get fatherProfession => $composableBuilder(
      column: $table.fatherProfession, builder: (column) => column);

  GeneratedColumn<String> get fatherImage => $composableBuilder(
      column: $table.fatherImage, builder: (column) => column);

  GeneratedColumn<String> get fatherNationality => $composableBuilder(
      column: $table.fatherNationality, builder: (column) => column);

  GeneratedColumn<String> get motherName => $composableBuilder(
      column: $table.motherName, builder: (column) => column);

  GeneratedColumn<String> get motherMobile => $composableBuilder(
      column: $table.motherMobile, builder: (column) => column);

  GeneratedColumn<String> get motherProfession => $composableBuilder(
      column: $table.motherProfession, builder: (column) => column);

  GeneratedColumn<String> get motherImage => $composableBuilder(
      column: $table.motherImage, builder: (column) => column);

  GeneratedColumn<String> get guardianName => $composableBuilder(
      column: $table.guardianName, builder: (column) => column);

  GeneratedColumn<String> get guardianEmail => $composableBuilder(
      column: $table.guardianEmail, builder: (column) => column);

  GeneratedColumn<String> get guardianMobile => $composableBuilder(
      column: $table.guardianMobile, builder: (column) => column);

  GeneratedColumn<String> get guardianImage => $composableBuilder(
      column: $table.guardianImage, builder: (column) => column);

  GeneratedColumn<String> get guardianProfession => $composableBuilder(
      column: $table.guardianProfession, builder: (column) => column);

  GeneratedColumn<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation, builder: (column) => column);

  GeneratedColumn<String> get guardianAddress => $composableBuilder(
      column: $table.guardianAddress, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ParentDetailsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ParentDetailsTable,
    ParentDetail,
    $$ParentDetailsTableFilterComposer,
    $$ParentDetailsTableOrderingComposer,
    $$ParentDetailsTableAnnotationComposer,
    $$ParentDetailsTableCreateCompanionBuilder,
    $$ParentDetailsTableUpdateCompanionBuilder,
    (
      ParentDetail,
      BaseReferences<_$AppDatabase, $ParentDetailsTable, ParentDetail>
    ),
    ParentDetail,
    PrefetchHooks Function()> {
  $$ParentDetailsTableTableManager(_$AppDatabase db, $ParentDetailsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParentDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParentDetailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParentDetailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String?> fatherName = const Value.absent(),
            Value<String?> fatherMobile = const Value.absent(),
            Value<String?> fatherProfession = const Value.absent(),
            Value<String?> fatherImage = const Value.absent(),
            Value<String?> fatherNationality = const Value.absent(),
            Value<String?> motherName = const Value.absent(),
            Value<String?> motherMobile = const Value.absent(),
            Value<String?> motherProfession = const Value.absent(),
            Value<String?> motherImage = const Value.absent(),
            Value<String?> guardianName = const Value.absent(),
            Value<String?> guardianEmail = const Value.absent(),
            Value<String?> guardianMobile = const Value.absent(),
            Value<String?> guardianImage = const Value.absent(),
            Value<String?> guardianProfession = const Value.absent(),
            Value<String?> guardianRelation = const Value.absent(),
            Value<String?> guardianAddress = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              ParentDetailsCompanion(
            id: id,
            userId: userId,
            fatherName: fatherName,
            fatherMobile: fatherMobile,
            fatherProfession: fatherProfession,
            fatherImage: fatherImage,
            fatherNationality: fatherNationality,
            motherName: motherName,
            motherMobile: motherMobile,
            motherProfession: motherProfession,
            motherImage: motherImage,
            guardianName: guardianName,
            guardianEmail: guardianEmail,
            guardianMobile: guardianMobile,
            guardianImage: guardianImage,
            guardianProfession: guardianProfession,
            guardianRelation: guardianRelation,
            guardianAddress: guardianAddress,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            Value<String?> fatherName = const Value.absent(),
            Value<String?> fatherMobile = const Value.absent(),
            Value<String?> fatherProfession = const Value.absent(),
            Value<String?> fatherImage = const Value.absent(),
            Value<String?> fatherNationality = const Value.absent(),
            Value<String?> motherName = const Value.absent(),
            Value<String?> motherMobile = const Value.absent(),
            Value<String?> motherProfession = const Value.absent(),
            Value<String?> motherImage = const Value.absent(),
            Value<String?> guardianName = const Value.absent(),
            Value<String?> guardianEmail = const Value.absent(),
            Value<String?> guardianMobile = const Value.absent(),
            Value<String?> guardianImage = const Value.absent(),
            Value<String?> guardianProfession = const Value.absent(),
            Value<String?> guardianRelation = const Value.absent(),
            Value<String?> guardianAddress = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              ParentDetailsCompanion.insert(
            id: id,
            userId: userId,
            fatherName: fatherName,
            fatherMobile: fatherMobile,
            fatherProfession: fatherProfession,
            fatherImage: fatherImage,
            fatherNationality: fatherNationality,
            motherName: motherName,
            motherMobile: motherMobile,
            motherProfession: motherProfession,
            motherImage: motherImage,
            guardianName: guardianName,
            guardianEmail: guardianEmail,
            guardianMobile: guardianMobile,
            guardianImage: guardianImage,
            guardianProfession: guardianProfession,
            guardianRelation: guardianRelation,
            guardianAddress: guardianAddress,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ParentDetailsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ParentDetailsTable,
    ParentDetail,
    $$ParentDetailsTableFilterComposer,
    $$ParentDetailsTableOrderingComposer,
    $$ParentDetailsTableAnnotationComposer,
    $$ParentDetailsTableCreateCompanionBuilder,
    $$ParentDetailsTableUpdateCompanionBuilder,
    (
      ParentDetail,
      BaseReferences<_$AppDatabase, $ParentDetailsTable, ParentDetail>
    ),
    ParentDetail,
    PrefetchHooks Function()>;
typedef $$NoticeBoardsTableCreateCompanionBuilder = NoticeBoardsCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> date,
  Value<String?> publishDate,
  Value<String?> description,
  Value<String?> attachment,
  Value<int?> isVisibleWeb,
  Value<int?> status,
  Value<String?> visibleTo,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$NoticeBoardsTableUpdateCompanionBuilder = NoticeBoardsCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> date,
  Value<String?> publishDate,
  Value<String?> description,
  Value<String?> attachment,
  Value<int?> isVisibleWeb,
  Value<int?> status,
  Value<String?> visibleTo,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$NoticeBoardsTableFilterComposer
    extends Composer<_$AppDatabase, $NoticeBoardsTable> {
  $$NoticeBoardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isVisibleWeb => $composableBuilder(
      column: $table.isVisibleWeb, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get visibleTo => $composableBuilder(
      column: $table.visibleTo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$NoticeBoardsTableOrderingComposer
    extends Composer<_$AppDatabase, $NoticeBoardsTable> {
  $$NoticeBoardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isVisibleWeb => $composableBuilder(
      column: $table.isVisibleWeb,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get visibleTo => $composableBuilder(
      column: $table.visibleTo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$NoticeBoardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoticeBoardsTable> {
  $$NoticeBoardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => column);

  GeneratedColumn<int> get isVisibleWeb => $composableBuilder(
      column: $table.isVisibleWeb, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get visibleTo =>
      $composableBuilder(column: $table.visibleTo, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NoticeBoardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoticeBoardsTable,
    NoticeBoard,
    $$NoticeBoardsTableFilterComposer,
    $$NoticeBoardsTableOrderingComposer,
    $$NoticeBoardsTableAnnotationComposer,
    $$NoticeBoardsTableCreateCompanionBuilder,
    $$NoticeBoardsTableUpdateCompanionBuilder,
    (
      NoticeBoard,
      BaseReferences<_$AppDatabase, $NoticeBoardsTable, NoticeBoard>
    ),
    NoticeBoard,
    PrefetchHooks Function()> {
  $$NoticeBoardsTableTableManager(_$AppDatabase db, $NoticeBoardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoticeBoardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoticeBoardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoticeBoardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> date = const Value.absent(),
            Value<String?> publishDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<int?> isVisibleWeb = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> visibleTo = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              NoticeBoardsCompanion(
            id: id,
            title: title,
            date: date,
            publishDate: publishDate,
            description: description,
            attachment: attachment,
            isVisibleWeb: isVisibleWeb,
            status: status,
            visibleTo: visibleTo,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> date = const Value.absent(),
            Value<String?> publishDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<int?> isVisibleWeb = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<String?> visibleTo = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              NoticeBoardsCompanion.insert(
            id: id,
            title: title,
            date: date,
            publishDate: publishDate,
            description: description,
            attachment: attachment,
            isVisibleWeb: isVisibleWeb,
            status: status,
            visibleTo: visibleTo,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NoticeBoardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoticeBoardsTable,
    NoticeBoard,
    $$NoticeBoardsTableFilterComposer,
    $$NoticeBoardsTableOrderingComposer,
    $$NoticeBoardsTableAnnotationComposer,
    $$NoticeBoardsTableCreateCompanionBuilder,
    $$NoticeBoardsTableUpdateCompanionBuilder,
    (
      NoticeBoard,
      BaseReferences<_$AppDatabase, $NoticeBoardsTable, NoticeBoard>
    ),
    NoticeBoard,
    PrefetchHooks Function()>;
typedef $$StudentsListTableCreateCompanionBuilder = StudentsListCompanion
    Function({
  Value<int> id,
  Value<String?> admissionNo,
  Value<int?> rollNo,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> mobile,
  Value<String?> email,
  Value<String?> dob,
  Value<String?> admissionDate,
  Value<int?> studentCategoryId,
  Value<int?> religionId,
  Value<int?> bloodGroupId,
  Value<int?> genderId,
  Value<int?> categoryId,
  Value<int?> imageId,
  Value<int?> parentGuardianId,
  Value<int?> userId,
  Value<String?> uploadDocuments,
  Value<int?> status,
  Value<int?> previousSchool,
  Value<String?> previousSchoolInfo,
  Value<int?> previousSchoolImageId,
  Value<String?> placeOfBirth,
  Value<String?> nationality,
  Value<String?> cprNo,
  Value<String?> spokenLangAtHome,
  Value<String?> residanceAddress,
  Value<String?> controlNumber,
  Value<String?> available,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});
typedef $$StudentsListTableUpdateCompanionBuilder = StudentsListCompanion
    Function({
  Value<int> id,
  Value<String?> admissionNo,
  Value<int?> rollNo,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> mobile,
  Value<String?> email,
  Value<String?> dob,
  Value<String?> admissionDate,
  Value<int?> studentCategoryId,
  Value<int?> religionId,
  Value<int?> bloodGroupId,
  Value<int?> genderId,
  Value<int?> categoryId,
  Value<int?> imageId,
  Value<int?> parentGuardianId,
  Value<int?> userId,
  Value<String?> uploadDocuments,
  Value<int?> status,
  Value<int?> previousSchool,
  Value<String?> previousSchoolInfo,
  Value<int?> previousSchoolImageId,
  Value<String?> placeOfBirth,
  Value<String?> nationality,
  Value<String?> cprNo,
  Value<String?> spokenLangAtHome,
  Value<String?> residanceAddress,
  Value<String?> controlNumber,
  Value<String?> available,
  Value<String?> createdAt,
  Value<String?> updatedAt,
});

class $$StudentsListTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsListTable> {
  $$StudentsListTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rollNo => $composableBuilder(
      column: $table.rollNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get imageId => $composableBuilder(
      column: $table.imageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cprNo => $composableBuilder(
      column: $table.cprNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$StudentsListTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsListTable> {
  $$StudentsListTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rollNo => $composableBuilder(
      column: $table.rollNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get genderId => $composableBuilder(
      column: $table.genderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get imageId => $composableBuilder(
      column: $table.imageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cprNo => $composableBuilder(
      column: $table.cprNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$StudentsListTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsListTable> {
  $$StudentsListTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get admissionNo => $composableBuilder(
      column: $table.admissionNo, builder: (column) => column);

  GeneratedColumn<int> get rollNo =>
      $composableBuilder(column: $table.rollNo, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get admissionDate => $composableBuilder(
      column: $table.admissionDate, builder: (column) => column);

  GeneratedColumn<int> get studentCategoryId => $composableBuilder(
      column: $table.studentCategoryId, builder: (column) => column);

  GeneratedColumn<int> get religionId => $composableBuilder(
      column: $table.religionId, builder: (column) => column);

  GeneratedColumn<int> get bloodGroupId => $composableBuilder(
      column: $table.bloodGroupId, builder: (column) => column);

  GeneratedColumn<int> get genderId =>
      $composableBuilder(column: $table.genderId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get imageId =>
      $composableBuilder(column: $table.imageId, builder: (column) => column);

  GeneratedColumn<int> get parentGuardianId => $composableBuilder(
      column: $table.parentGuardianId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get uploadDocuments => $composableBuilder(
      column: $table.uploadDocuments, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get previousSchool => $composableBuilder(
      column: $table.previousSchool, builder: (column) => column);

  GeneratedColumn<String> get previousSchoolInfo => $composableBuilder(
      column: $table.previousSchoolInfo, builder: (column) => column);

  GeneratedColumn<int> get previousSchoolImageId => $composableBuilder(
      column: $table.previousSchoolImageId, builder: (column) => column);

  GeneratedColumn<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth, builder: (column) => column);

  GeneratedColumn<String> get nationality => $composableBuilder(
      column: $table.nationality, builder: (column) => column);

  GeneratedColumn<String> get cprNo =>
      $composableBuilder(column: $table.cprNo, builder: (column) => column);

  GeneratedColumn<String> get spokenLangAtHome => $composableBuilder(
      column: $table.spokenLangAtHome, builder: (column) => column);

  GeneratedColumn<String> get residanceAddress => $composableBuilder(
      column: $table.residanceAddress, builder: (column) => column);

  GeneratedColumn<String> get controlNumber => $composableBuilder(
      column: $table.controlNumber, builder: (column) => column);

  GeneratedColumn<String> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StudentsListTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudentsListTable,
    StudentsListData,
    $$StudentsListTableFilterComposer,
    $$StudentsListTableOrderingComposer,
    $$StudentsListTableAnnotationComposer,
    $$StudentsListTableCreateCompanionBuilder,
    $$StudentsListTableUpdateCompanionBuilder,
    (
      StudentsListData,
      BaseReferences<_$AppDatabase, $StudentsListTable, StudentsListData>
    ),
    StudentsListData,
    PrefetchHooks Function()> {
  $$StudentsListTableTableManager(_$AppDatabase db, $StudentsListTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsListTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsListTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsListTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> admissionNo = const Value.absent(),
            Value<int?> rollNo = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> mobile = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> dob = const Value.absent(),
            Value<String?> admissionDate = const Value.absent(),
            Value<int?> studentCategoryId = const Value.absent(),
            Value<int?> religionId = const Value.absent(),
            Value<int?> bloodGroupId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> imageId = const Value.absent(),
            Value<int?> parentGuardianId = const Value.absent(),
            Value<int?> userId = const Value.absent(),
            Value<String?> uploadDocuments = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> previousSchool = const Value.absent(),
            Value<String?> previousSchoolInfo = const Value.absent(),
            Value<int?> previousSchoolImageId = const Value.absent(),
            Value<String?> placeOfBirth = const Value.absent(),
            Value<String?> nationality = const Value.absent(),
            Value<String?> cprNo = const Value.absent(),
            Value<String?> spokenLangAtHome = const Value.absent(),
            Value<String?> residanceAddress = const Value.absent(),
            Value<String?> controlNumber = const Value.absent(),
            Value<String?> available = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              StudentsListCompanion(
            id: id,
            admissionNo: admissionNo,
            rollNo: rollNo,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            email: email,
            dob: dob,
            admissionDate: admissionDate,
            studentCategoryId: studentCategoryId,
            religionId: religionId,
            bloodGroupId: bloodGroupId,
            genderId: genderId,
            categoryId: categoryId,
            imageId: imageId,
            parentGuardianId: parentGuardianId,
            userId: userId,
            uploadDocuments: uploadDocuments,
            status: status,
            previousSchool: previousSchool,
            previousSchoolInfo: previousSchoolInfo,
            previousSchoolImageId: previousSchoolImageId,
            placeOfBirth: placeOfBirth,
            nationality: nationality,
            cprNo: cprNo,
            spokenLangAtHome: spokenLangAtHome,
            residanceAddress: residanceAddress,
            controlNumber: controlNumber,
            available: available,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> admissionNo = const Value.absent(),
            Value<int?> rollNo = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> mobile = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> dob = const Value.absent(),
            Value<String?> admissionDate = const Value.absent(),
            Value<int?> studentCategoryId = const Value.absent(),
            Value<int?> religionId = const Value.absent(),
            Value<int?> bloodGroupId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> imageId = const Value.absent(),
            Value<int?> parentGuardianId = const Value.absent(),
            Value<int?> userId = const Value.absent(),
            Value<String?> uploadDocuments = const Value.absent(),
            Value<int?> status = const Value.absent(),
            Value<int?> previousSchool = const Value.absent(),
            Value<String?> previousSchoolInfo = const Value.absent(),
            Value<int?> previousSchoolImageId = const Value.absent(),
            Value<String?> placeOfBirth = const Value.absent(),
            Value<String?> nationality = const Value.absent(),
            Value<String?> cprNo = const Value.absent(),
            Value<String?> spokenLangAtHome = const Value.absent(),
            Value<String?> residanceAddress = const Value.absent(),
            Value<String?> controlNumber = const Value.absent(),
            Value<String?> available = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
            Value<String?> updatedAt = const Value.absent(),
          }) =>
              StudentsListCompanion.insert(
            id: id,
            admissionNo: admissionNo,
            rollNo: rollNo,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            email: email,
            dob: dob,
            admissionDate: admissionDate,
            studentCategoryId: studentCategoryId,
            religionId: religionId,
            bloodGroupId: bloodGroupId,
            genderId: genderId,
            categoryId: categoryId,
            imageId: imageId,
            parentGuardianId: parentGuardianId,
            userId: userId,
            uploadDocuments: uploadDocuments,
            status: status,
            previousSchool: previousSchool,
            previousSchoolInfo: previousSchoolInfo,
            previousSchoolImageId: previousSchoolImageId,
            placeOfBirth: placeOfBirth,
            nationality: nationality,
            cprNo: cprNo,
            spokenLangAtHome: spokenLangAtHome,
            residanceAddress: residanceAddress,
            controlNumber: controlNumber,
            available: available,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudentsListTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudentsListTable,
    StudentsListData,
    $$StudentsListTableFilterComposer,
    $$StudentsListTableOrderingComposer,
    $$StudentsListTableAnnotationComposer,
    $$StudentsListTableCreateCompanionBuilder,
    $$StudentsListTableUpdateCompanionBuilder,
    (
      StudentsListData,
      BaseReferences<_$AppDatabase, $StudentsListTable, StudentsListData>
    ),
    StudentsListData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FeesGroupsTableTableManager get feesGroups =>
      $$FeesGroupsTableTableManager(_db, _db.feesGroups);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$FeesAssignmentsTableTableManager get feesAssignments =>
      $$FeesAssignmentsTableTableManager(_db, _db.feesAssignments);
  $$FeesAssignChildrenTableTableManager get feesAssignChildren =>
      $$FeesAssignChildrenTableTableManager(_db, _db.feesAssignChildren);
  $$ExamTypesTableTableManager get examTypes =>
      $$ExamTypesTableTableManager(_db, _db.examTypes);
  $$ClassesTableTableManager get classes =>
      $$ClassesTableTableManager(_db, _db.classes);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
  $$ExamsTableTableManager get exams =>
      $$ExamsTableTableManager(_db, _db.exams);
  $$MarksRegisterChildrensTableTableManager get marksRegisterChildrens =>
      $$MarksRegisterChildrensTableTableManager(
          _db, _db.marksRegisterChildrens);
  $$FeesMastersTableTableManager get feesMasters =>
      $$FeesMastersTableTableManager(_db, _db.feesMasters);
  $$FeesTypeTableTableManager get feesType =>
      $$FeesTypeTableTableManager(_db, _db.feesType);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BankAccountsTableTableManager get bankAccounts =>
      $$BankAccountsTableTableManager(_db, _db.bankAccounts);
  $$SubjectAssignChildrensTableTableManager get subjectAssignChildrens =>
      $$SubjectAssignChildrensTableTableManager(
          _db, _db.subjectAssignChildrens);
  $$SubjectAssignsTableTableManager get subjectAssigns =>
      $$SubjectAssignsTableTableManager(_db, _db.subjectAssigns);
  $$StaffTableTableManager get staff =>
      $$StaffTableTableManager(_db, _db.staff);
  $$MarksGradeTableTableManager get marksGrade =>
      $$MarksGradeTableTableManager(_db, _db.marksGrade);
  $$ParentDetailsTableTableManager get parentDetails =>
      $$ParentDetailsTableTableManager(_db, _db.parentDetails);
  $$NoticeBoardsTableTableManager get noticeBoards =>
      $$NoticeBoardsTableTableManager(_db, _db.noticeBoards);
  $$StudentsListTableTableManager get studentsList =>
      $$StudentsListTableTableManager(_db, _db.studentsList);
}
