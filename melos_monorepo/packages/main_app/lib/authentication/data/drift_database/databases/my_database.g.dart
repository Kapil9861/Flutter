// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 40),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
      'date_of_birth', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumnWithTypeConverter<Genders, String> gender =
      GeneratedColumn<String>('gender', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Genders>($UsersTable.$convertergender);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, dateOfBirth, gender, phoneNumber];
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    context.handle(_genderMeta, const VerificationResult.success());
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_of_birth']),
      gender: $UsersTable.$convertergender.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Genders, String, String> $convertergender =
      const EnumNameConverter<Genders>(Genders.values);
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String name;
  final String? dateOfBirth;
  final Genders gender;
  final String phoneNumber;
  const User(
      {required this.id,
      required this.name,
      this.dateOfBirth,
      required this.gender,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<String>(dateOfBirth);
    }
    {
      map['gender'] =
          Variable<String>($UsersTable.$convertergender.toSql(gender));
    }
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      gender: Value(gender),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      gender: $UsersTable.$convertergender
          .fromJson(serializer.fromJson<String>(json['gender'])),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'gender': serializer
          .toJson<String>($UsersTable.$convertergender.toJson(gender)),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  User copyWith(
          {String? id,
          String? name,
          Value<String?> dateOfBirth = const Value.absent(),
          Genders? gender,
          String? phoneNumber}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      gender: data.gender.present ? data.gender.value : this.gender,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dateOfBirth, gender, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateOfBirth == this.dateOfBirth &&
          other.gender == this.gender &&
          other.phoneNumber == this.phoneNumber);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> dateOfBirth;
  final Value<Genders> gender;
  final Value<String> phoneNumber;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String name,
    this.dateOfBirth = const Value.absent(),
    required Genders gender,
    required String phoneNumber,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        gender = Value(gender),
        phoneNumber = Value(phoneNumber);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? dateOfBirth,
    Expression<String>? gender,
    Expression<String>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? dateOfBirth,
      Value<Genders>? gender,
      Value<String>? phoneNumber,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gender'] =
          Variable<String>($UsersTable.$convertergender.toSql(gender.value));
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL UNIQUE');
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<int> salary = GeneratedColumn<int>(
      'salary', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
      'designation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, isActive, salary, designation];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employees';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    } else if (isInserting) {
      context.missing(_designationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Employee(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active']),
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}salary'])!,
      designation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation'])!,
    );
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(attachedDatabase, alias);
  }
}

class Employee extends DataClass implements Insertable<Employee> {
  final String userId;
  final int id;
  final bool? isActive;
  final int salary;
  final String designation;
  const Employee(
      {required this.userId,
      required this.id,
      this.isActive,
      required this.salary,
      required this.designation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<bool>(isActive);
    }
    map['salary'] = Variable<int>(salary);
    map['designation'] = Variable<String>(designation);
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      userId: Value(userId),
      id: Value(id),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      salary: Value(salary),
      designation: Value(designation),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      isActive: serializer.fromJson<bool?>(json['isActive']),
      salary: serializer.fromJson<int>(json['salary']),
      designation: serializer.fromJson<String>(json['designation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<int>(id),
      'isActive': serializer.toJson<bool?>(isActive),
      'salary': serializer.toJson<int>(salary),
      'designation': serializer.toJson<String>(designation),
    };
  }

  Employee copyWith(
          {String? userId,
          int? id,
          Value<bool?> isActive = const Value.absent(),
          int? salary,
          String? designation}) =>
      Employee(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        isActive: isActive.present ? isActive.value : this.isActive,
        salary: salary ?? this.salary,
        designation: designation ?? this.designation,
      );
  Employee copyWithCompanion(EmployeesCompanion data) {
    return Employee(
      userId: data.userId.present ? data.userId.value : this.userId,
      id: data.id.present ? data.id.value : this.id,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      salary: data.salary.present ? data.salary.value : this.salary,
      designation:
          data.designation.present ? data.designation.value : this.designation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('isActive: $isActive, ')
          ..write('salary: $salary, ')
          ..write('designation: $designation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, id, isActive, salary, designation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.isActive == this.isActive &&
          other.salary == this.salary &&
          other.designation == this.designation);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<String> userId;
  final Value<int> id;
  final Value<bool?> isActive;
  final Value<int> salary;
  final Value<String> designation;
  const EmployeesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.isActive = const Value.absent(),
    this.salary = const Value.absent(),
    this.designation = const Value.absent(),
  });
  EmployeesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.isActive = const Value.absent(),
    required int salary,
    required String designation,
  })  : userId = Value(userId),
        salary = Value(salary),
        designation = Value(designation);
  static Insertable<Employee> custom({
    Expression<String>? userId,
    Expression<int>? id,
    Expression<bool>? isActive,
    Expression<int>? salary,
    Expression<String>? designation,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (isActive != null) 'is_active': isActive,
      if (salary != null) 'salary': salary,
      if (designation != null) 'designation': designation,
    });
  }

  EmployeesCompanion copyWith(
      {Value<String>? userId,
      Value<int>? id,
      Value<bool?>? isActive,
      Value<int>? salary,
      Value<String>? designation}) {
    return EmployeesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      salary: salary ?? this.salary,
      designation: designation ?? this.designation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (salary.present) {
      map['salary'] = Variable<int>(salary.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('isActive: $isActive, ')
          ..write('salary: $salary, ')
          ..write('designation: $designation')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectNameMeta =
      const VerificationMeta('projectName');
  @override
  late final GeneratedColumn<String> projectName = GeneratedColumn<String>(
      'project_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 40),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ProjectType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProjectType>($ProjectsTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, projectName, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<Project> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_name')) {
      context.handle(
          _projectNameMeta,
          projectName.isAcceptableOrUnknown(
              data['project_name']!, _projectNameMeta));
    } else if (isInserting) {
      context.missing(_projectNameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      projectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_name'])!,
      type: $ProjectsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProjectType, String, String> $convertertype =
      const EnumNameConverter<ProjectType>(ProjectType.values);
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String projectName;
  final ProjectType type;
  const Project(
      {required this.id, required this.projectName, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_name'] = Variable<String>(projectName);
    {
      map['type'] = Variable<String>($ProjectsTable.$convertertype.toSql(type));
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      projectName: Value(projectName),
      type: Value(type),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      projectName: serializer.fromJson<String>(json['projectName']),
      type: $ProjectsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectName': serializer.toJson<String>(projectName),
      'type':
          serializer.toJson<String>($ProjectsTable.$convertertype.toJson(type)),
    };
  }

  Project copyWith({String? id, String? projectName, ProjectType? type}) =>
      Project(
        id: id ?? this.id,
        projectName: projectName ?? this.projectName,
        type: type ?? this.type,
      );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      projectName:
          data.projectName.present ? data.projectName.value : this.projectName,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectName, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.projectName == this.projectName &&
          other.type == this.type);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> projectName;
  final Value<ProjectType> type;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.projectName = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String projectName,
    required ProjectType type,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        projectName = Value(projectName),
        type = Value(type);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? projectName,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectName != null) 'project_name': projectName,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith(
      {Value<String>? id,
      Value<String>? projectName,
      Value<ProjectType>? type,
      Value<int>? rowid}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectName.present) {
      map['project_name'] = Variable<String>(projectName.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($ProjectsTable.$convertertype.toSql(type.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KnowYourCustomerTable extends KnowYourCustomer
    with TableInfo<$KnowYourCustomerTable, KnowYourCustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowYourCustomerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 14),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'middle_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _motherNameMeta =
      const VerificationMeta('motherName');
  @override
  late final GeneratedColumn<String> motherName = GeneratedColumn<String>(
      'mother_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _fatherNameMeta =
      const VerificationMeta('fatherName');
  @override
  late final GeneratedColumn<String> fatherName = GeneratedColumn<String>(
      'father_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        phoneNumber,
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        motherName,
        fatherName,
        gender
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'know_your_customer';
  @override
  VerificationContext validateIntegrity(
      Insertable<KnowYourCustomerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name']!, _middleNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('mother_name')) {
      context.handle(
          _motherNameMeta,
          motherName.isAcceptableOrUnknown(
              data['mother_name']!, _motherNameMeta));
    }
    if (data.containsKey('father_name')) {
      context.handle(
          _fatherNameMeta,
          fatherName.isAcceptableOrUnknown(
              data['father_name']!, _fatherNameMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  KnowYourCustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowYourCustomerData(
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      dateOfBirth: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth'])!,
      motherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mother_name']),
      fatherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_name']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
    );
  }

  @override
  $KnowYourCustomerTable createAlias(String alias) {
    return $KnowYourCustomerTable(attachedDatabase, alias);
  }
}

class KnowYourCustomerData extends DataClass
    implements Insertable<KnowYourCustomerData> {
  final String phoneNumber;
  final String firstName;
  final String? middleName;
  final String lastName;
  final DateTime dateOfBirth;
  final String? motherName;
  final String? fatherName;
  final String? gender;
  const KnowYourCustomerData(
      {required this.phoneNumber,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.dateOfBirth,
      this.motherName,
      this.fatherName,
      this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['phone_number'] = Variable<String>(phoneNumber);
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    map['last_name'] = Variable<String>(lastName);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    if (!nullToAbsent || motherName != null) {
      map['mother_name'] = Variable<String>(motherName);
    }
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    return map;
  }

  KnowYourCustomerCompanion toCompanion(bool nullToAbsent) {
    return KnowYourCustomerCompanion(
      phoneNumber: Value(phoneNumber),
      firstName: Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: Value(lastName),
      dateOfBirth: Value(dateOfBirth),
      motherName: motherName == null && nullToAbsent
          ? const Value.absent()
          : Value(motherName),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
    );
  }

  factory KnowYourCustomerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowYourCustomerData(
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      motherName: serializer.fromJson<String?>(json['motherName']),
      fatherName: serializer.fromJson<String?>(json['fatherName']),
      gender: serializer.fromJson<String?>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'motherName': serializer.toJson<String?>(motherName),
      'fatherName': serializer.toJson<String?>(fatherName),
      'gender': serializer.toJson<String?>(gender),
    };
  }

  KnowYourCustomerData copyWith(
          {String? phoneNumber,
          String? firstName,
          Value<String?> middleName = const Value.absent(),
          String? lastName,
          DateTime? dateOfBirth,
          Value<String?> motherName = const Value.absent(),
          Value<String?> fatherName = const Value.absent(),
          Value<String?> gender = const Value.absent()}) =>
      KnowYourCustomerData(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        motherName: motherName.present ? motherName.value : this.motherName,
        fatherName: fatherName.present ? fatherName.value : this.fatherName,
        gender: gender.present ? gender.value : this.gender,
      );
  KnowYourCustomerData copyWithCompanion(KnowYourCustomerCompanion data) {
    return KnowYourCustomerData(
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      motherName:
          data.motherName.present ? data.motherName.value : this.motherName,
      fatherName:
          data.fatherName.present ? data.fatherName.value : this.fatherName,
      gender: data.gender.present ? data.gender.value : this.gender,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowYourCustomerData(')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('motherName: $motherName, ')
          ..write('fatherName: $fatherName, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(phoneNumber, firstName, middleName, lastName,
      dateOfBirth, motherName, fatherName, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowYourCustomerData &&
          other.phoneNumber == this.phoneNumber &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.dateOfBirth == this.dateOfBirth &&
          other.motherName == this.motherName &&
          other.fatherName == this.fatherName &&
          other.gender == this.gender);
}

class KnowYourCustomerCompanion extends UpdateCompanion<KnowYourCustomerData> {
  final Value<String> phoneNumber;
  final Value<String> firstName;
  final Value<String?> middleName;
  final Value<String> lastName;
  final Value<DateTime> dateOfBirth;
  final Value<String?> motherName;
  final Value<String?> fatherName;
  final Value<String?> gender;
  final Value<int> rowid;
  const KnowYourCustomerCompanion({
    this.phoneNumber = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.motherName = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.gender = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowYourCustomerCompanion.insert({
    required String phoneNumber,
    required String firstName,
    this.middleName = const Value.absent(),
    required String lastName,
    required DateTime dateOfBirth,
    this.motherName = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.gender = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : phoneNumber = Value(phoneNumber),
        firstName = Value(firstName),
        lastName = Value(lastName),
        dateOfBirth = Value(dateOfBirth);
  static Insertable<KnowYourCustomerData> custom({
    Expression<String>? phoneNumber,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? motherName,
    Expression<String>? fatherName,
    Expression<String>? gender,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (motherName != null) 'mother_name': motherName,
      if (fatherName != null) 'father_name': fatherName,
      if (gender != null) 'gender': gender,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowYourCustomerCompanion copyWith(
      {Value<String>? phoneNumber,
      Value<String>? firstName,
      Value<String?>? middleName,
      Value<String>? lastName,
      Value<DateTime>? dateOfBirth,
      Value<String?>? motherName,
      Value<String?>? fatherName,
      Value<String?>? gender,
      Value<int>? rowid}) {
    return KnowYourCustomerCompanion(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      motherName: motherName ?? this.motherName,
      fatherName: fatherName ?? this.fatherName,
      gender: gender ?? this.gender,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (motherName.present) {
      map['mother_name'] = Variable<String>(motherName.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowYourCustomerCompanion(')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('motherName: $motherName, ')
          ..write('fatherName: $fatherName, ')
          ..write('gender: $gender, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmployeesProjectsTable extends EmployeesProjects
    with TableInfo<$EmployeesProjectsTable, EmployeesProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES employees(id) NOT NULL');
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES projects(id) NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [employeeId, projectId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employees_projects';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeesProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {projectId, employeeId};
  @override
  EmployeesProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeesProject(
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
    );
  }

  @override
  $EmployeesProjectsTable createAlias(String alias) {
    return $EmployeesProjectsTable(attachedDatabase, alias);
  }
}

class EmployeesProject extends DataClass
    implements Insertable<EmployeesProject> {
  final int employeeId;
  final String projectId;
  const EmployeesProject({required this.employeeId, required this.projectId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['employee_id'] = Variable<int>(employeeId);
    map['project_id'] = Variable<String>(projectId);
    return map;
  }

  EmployeesProjectsCompanion toCompanion(bool nullToAbsent) {
    return EmployeesProjectsCompanion(
      employeeId: Value(employeeId),
      projectId: Value(projectId),
    );
  }

  factory EmployeesProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeesProject(
      employeeId: serializer.fromJson<int>(json['employeeId']),
      projectId: serializer.fromJson<String>(json['projectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'employeeId': serializer.toJson<int>(employeeId),
      'projectId': serializer.toJson<String>(projectId),
    };
  }

  EmployeesProject copyWith({int? employeeId, String? projectId}) =>
      EmployeesProject(
        employeeId: employeeId ?? this.employeeId,
        projectId: projectId ?? this.projectId,
      );
  EmployeesProject copyWithCompanion(EmployeesProjectsCompanion data) {
    return EmployeesProject(
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesProject(')
          ..write('employeeId: $employeeId, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(employeeId, projectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeesProject &&
          other.employeeId == this.employeeId &&
          other.projectId == this.projectId);
}

class EmployeesProjectsCompanion extends UpdateCompanion<EmployeesProject> {
  final Value<int> employeeId;
  final Value<String> projectId;
  final Value<int> rowid;
  const EmployeesProjectsCompanion({
    this.employeeId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmployeesProjectsCompanion.insert({
    required int employeeId,
    required String projectId,
    this.rowid = const Value.absent(),
  })  : employeeId = Value(employeeId),
        projectId = Value(projectId);
  static Insertable<EmployeesProject> custom({
    Expression<int>? employeeId,
    Expression<String>? projectId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (employeeId != null) 'employee_id': employeeId,
      if (projectId != null) 'project_id': projectId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmployeesProjectsCompanion copyWith(
      {Value<int>? employeeId, Value<String>? projectId, Value<int>? rowid}) {
    return EmployeesProjectsCompanion(
      employeeId: employeeId ?? this.employeeId,
      projectId: projectId ?? this.projectId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesProjectsCompanion(')
          ..write('employeeId: $employeeId, ')
          ..write('projectId: $projectId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $EmployeesTable employees = $EmployeesTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $KnowYourCustomerTable knowYourCustomer =
      $KnowYourCustomerTable(this);
  late final $EmployeesProjectsTable employeesProjects =
      $EmployeesProjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, employees, projects, knowYourCustomer, employeesProjects];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String name,
  Value<String?> dateOfBirth,
  required Genders gender,
  required String phoneNumber,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> dateOfBirth,
  Value<Genders> gender,
  Value<String> phoneNumber,
  Value<int> rowid,
});

final class $$UsersTableReferences
    extends BaseReferences<_$MyDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EmployeesTable, List<Employee>>
      _employeesRefsTable(_$MyDatabase db) => MultiTypedResultKey.fromTable(
          db.employees,
          aliasName: $_aliasNameGenerator(db.users.id, db.employees.userId));

  $$EmployeesTableProcessedTableManager get employeesRefs {
    final manager = $$EmployeesTableTableManager($_db, $_db.employees)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_employeesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$MyDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Genders, Genders, String> get gender =>
      $state.composableBuilder(
          column: $state.table.gender,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter employeesRefs(
      ComposableFilter Function($$EmployeesTableFilterComposer f) f) {
    final $$EmployeesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.employees,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$EmployeesTableFilterComposer(ComposerState(
                $state.db, $state.db.employees, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UsersTableTableManager extends RootTableManager<
    _$MyDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool employeesRefs})> {
  $$UsersTableTableManager(_$MyDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> dateOfBirth = const Value.absent(),
            Value<Genders> gender = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            dateOfBirth: dateOfBirth,
            gender: gender,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> dateOfBirth = const Value.absent(),
            required Genders gender,
            required String phoneNumber,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            dateOfBirth: dateOfBirth,
            gender: gender,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({employeesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (employeesRefs) db.employees],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (employeesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._employeesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).employeesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool employeesRefs})>;
typedef $$EmployeesTableCreateCompanionBuilder = EmployeesCompanion Function({
  required String userId,
  Value<int> id,
  Value<bool?> isActive,
  required int salary,
  required String designation,
});
typedef $$EmployeesTableUpdateCompanionBuilder = EmployeesCompanion Function({
  Value<String> userId,
  Value<int> id,
  Value<bool?> isActive,
  Value<int> salary,
  Value<String> designation,
});

final class $$EmployeesTableReferences
    extends BaseReferences<_$MyDatabase, $EmployeesTable, Employee> {
  $$EmployeesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$MyDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.employees.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EmployeesProjectsTable, List<EmployeesProject>>
      _employeesProjectsRefsTable(_$MyDatabase db) =>
          MultiTypedResultKey.fromTable(db.employeesProjects,
              aliasName: $_aliasNameGenerator(
                  db.employees.id, db.employeesProjects.employeeId));

  $$EmployeesProjectsTableProcessedTableManager get employeesProjectsRefs {
    final manager =
        $$EmployeesProjectsTableTableManager($_db, $_db.employeesProjects)
            .filter((f) => f.employeeId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_employeesProjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EmployeesTableFilterComposer
    extends FilterComposer<_$MyDatabase, $EmployeesTable> {
  $$EmployeesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get salary => $state.composableBuilder(
      column: $state.table.salary,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get designation => $state.composableBuilder(
      column: $state.table.designation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter employeesProjectsRefs(
      ComposableFilter Function($$EmployeesProjectsTableFilterComposer f) f) {
    final $$EmployeesProjectsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.employeesProjects,
            getReferencedColumn: (t) => t.employeeId,
            builder: (joinBuilder, parentComposers) =>
                $$EmployeesProjectsTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.employeesProjects,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$EmployeesTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $EmployeesTable> {
  $$EmployeesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get salary => $state.composableBuilder(
      column: $state.table.salary,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get designation => $state.composableBuilder(
      column: $state.table.designation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EmployeesTableTableManager extends RootTableManager<
    _$MyDatabase,
    $EmployeesTable,
    Employee,
    $$EmployeesTableFilterComposer,
    $$EmployeesTableOrderingComposer,
    $$EmployeesTableCreateCompanionBuilder,
    $$EmployeesTableUpdateCompanionBuilder,
    (Employee, $$EmployeesTableReferences),
    Employee,
    PrefetchHooks Function({bool userId, bool employeesProjectsRefs})> {
  $$EmployeesTableTableManager(_$MyDatabase db, $EmployeesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EmployeesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EmployeesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool?> isActive = const Value.absent(),
            Value<int> salary = const Value.absent(),
            Value<String> designation = const Value.absent(),
          }) =>
              EmployeesCompanion(
            userId: userId,
            id: id,
            isActive: isActive,
            salary: salary,
            designation: designation,
          ),
          createCompanionCallback: ({
            required String userId,
            Value<int> id = const Value.absent(),
            Value<bool?> isActive = const Value.absent(),
            required int salary,
            required String designation,
          }) =>
              EmployeesCompanion.insert(
            userId: userId,
            id: id,
            isActive: isActive,
            salary: salary,
            designation: designation,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EmployeesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false, employeesProjectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (employeesProjectsRefs) db.employeesProjects
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$EmployeesTableReferences._userIdTable(db),
                    referencedColumn:
                        $$EmployeesTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (employeesProjectsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$EmployeesTableReferences
                            ._employeesProjectsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EmployeesTableReferences(db, table, p0)
                                .employeesProjectsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.employeeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EmployeesTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $EmployeesTable,
    Employee,
    $$EmployeesTableFilterComposer,
    $$EmployeesTableOrderingComposer,
    $$EmployeesTableCreateCompanionBuilder,
    $$EmployeesTableUpdateCompanionBuilder,
    (Employee, $$EmployeesTableReferences),
    Employee,
    PrefetchHooks Function({bool userId, bool employeesProjectsRefs})>;
typedef $$ProjectsTableCreateCompanionBuilder = ProjectsCompanion Function({
  required String id,
  required String projectName,
  required ProjectType type,
  Value<int> rowid,
});
typedef $$ProjectsTableUpdateCompanionBuilder = ProjectsCompanion Function({
  Value<String> id,
  Value<String> projectName,
  Value<ProjectType> type,
  Value<int> rowid,
});

final class $$ProjectsTableReferences
    extends BaseReferences<_$MyDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EmployeesProjectsTable, List<EmployeesProject>>
      _employeesProjectsRefsTable(_$MyDatabase db) =>
          MultiTypedResultKey.fromTable(db.employeesProjects,
              aliasName: $_aliasNameGenerator(
                  db.projects.id, db.employeesProjects.projectId));

  $$EmployeesProjectsTableProcessedTableManager get employeesProjectsRefs {
    final manager =
        $$EmployeesProjectsTableTableManager($_db, $_db.employeesProjects)
            .filter((f) => f.projectId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_employeesProjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProjectsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get projectName => $state.composableBuilder(
      column: $state.table.projectName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<ProjectType, ProjectType, String> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter employeesProjectsRefs(
      ComposableFilter Function($$EmployeesProjectsTableFilterComposer f) f) {
    final $$EmployeesProjectsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.employeesProjects,
            getReferencedColumn: (t) => t.projectId,
            builder: (joinBuilder, parentComposers) =>
                $$EmployeesProjectsTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.employeesProjects,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get projectName => $state.composableBuilder(
      column: $state.table.projectName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProjectsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $ProjectsTable,
    Project,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (Project, $$ProjectsTableReferences),
    Project,
    PrefetchHooks Function({bool employeesProjectsRefs})> {
  $$ProjectsTableTableManager(_$MyDatabase db, $ProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProjectsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProjectsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> projectName = const Value.absent(),
            Value<ProjectType> type = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion(
            id: id,
            projectName: projectName,
            type: type,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String projectName,
            required ProjectType type,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion.insert(
            id: id,
            projectName: projectName,
            type: type,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProjectsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({employeesProjectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (employeesProjectsRefs) db.employeesProjects
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (employeesProjectsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProjectsTableReferences
                            ._employeesProjectsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectsTableReferences(db, table, p0)
                                .employeesProjectsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProjectsTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $ProjectsTable,
    Project,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (Project, $$ProjectsTableReferences),
    Project,
    PrefetchHooks Function({bool employeesProjectsRefs})>;
typedef $$KnowYourCustomerTableCreateCompanionBuilder
    = KnowYourCustomerCompanion Function({
  required String phoneNumber,
  required String firstName,
  Value<String?> middleName,
  required String lastName,
  required DateTime dateOfBirth,
  Value<String?> motherName,
  Value<String?> fatherName,
  Value<String?> gender,
  Value<int> rowid,
});
typedef $$KnowYourCustomerTableUpdateCompanionBuilder
    = KnowYourCustomerCompanion Function({
  Value<String> phoneNumber,
  Value<String> firstName,
  Value<String?> middleName,
  Value<String> lastName,
  Value<DateTime> dateOfBirth,
  Value<String?> motherName,
  Value<String?> fatherName,
  Value<String?> gender,
  Value<int> rowid,
});

class $$KnowYourCustomerTableFilterComposer
    extends FilterComposer<_$MyDatabase, $KnowYourCustomerTable> {
  $$KnowYourCustomerTableFilterComposer(super.$state);
  ColumnFilters<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get middleName => $state.composableBuilder(
      column: $state.table.middleName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get motherName => $state.composableBuilder(
      column: $state.table.motherName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fatherName => $state.composableBuilder(
      column: $state.table.fatherName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$KnowYourCustomerTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $KnowYourCustomerTable> {
  $$KnowYourCustomerTableOrderingComposer(super.$state);
  ColumnOrderings<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get middleName => $state.composableBuilder(
      column: $state.table.middleName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get motherName => $state.composableBuilder(
      column: $state.table.motherName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fatherName => $state.composableBuilder(
      column: $state.table.fatherName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$KnowYourCustomerTableTableManager extends RootTableManager<
    _$MyDatabase,
    $KnowYourCustomerTable,
    KnowYourCustomerData,
    $$KnowYourCustomerTableFilterComposer,
    $$KnowYourCustomerTableOrderingComposer,
    $$KnowYourCustomerTableCreateCompanionBuilder,
    $$KnowYourCustomerTableUpdateCompanionBuilder,
    (
      KnowYourCustomerData,
      BaseReferences<_$MyDatabase, $KnowYourCustomerTable, KnowYourCustomerData>
    ),
    KnowYourCustomerData,
    PrefetchHooks Function()> {
  $$KnowYourCustomerTableTableManager(
      _$MyDatabase db, $KnowYourCustomerTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$KnowYourCustomerTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$KnowYourCustomerTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> phoneNumber = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<DateTime> dateOfBirth = const Value.absent(),
            Value<String?> motherName = const Value.absent(),
            Value<String?> fatherName = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KnowYourCustomerCompanion(
            phoneNumber: phoneNumber,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            motherName: motherName,
            fatherName: fatherName,
            gender: gender,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String phoneNumber,
            required String firstName,
            Value<String?> middleName = const Value.absent(),
            required String lastName,
            required DateTime dateOfBirth,
            Value<String?> motherName = const Value.absent(),
            Value<String?> fatherName = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KnowYourCustomerCompanion.insert(
            phoneNumber: phoneNumber,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            motherName: motherName,
            fatherName: fatherName,
            gender: gender,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KnowYourCustomerTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $KnowYourCustomerTable,
    KnowYourCustomerData,
    $$KnowYourCustomerTableFilterComposer,
    $$KnowYourCustomerTableOrderingComposer,
    $$KnowYourCustomerTableCreateCompanionBuilder,
    $$KnowYourCustomerTableUpdateCompanionBuilder,
    (
      KnowYourCustomerData,
      BaseReferences<_$MyDatabase, $KnowYourCustomerTable, KnowYourCustomerData>
    ),
    KnowYourCustomerData,
    PrefetchHooks Function()>;
typedef $$EmployeesProjectsTableCreateCompanionBuilder
    = EmployeesProjectsCompanion Function({
  required int employeeId,
  required String projectId,
  Value<int> rowid,
});
typedef $$EmployeesProjectsTableUpdateCompanionBuilder
    = EmployeesProjectsCompanion Function({
  Value<int> employeeId,
  Value<String> projectId,
  Value<int> rowid,
});

final class $$EmployeesProjectsTableReferences extends BaseReferences<
    _$MyDatabase, $EmployeesProjectsTable, EmployeesProject> {
  $$EmployeesProjectsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $EmployeesTable _employeeIdTable(_$MyDatabase db) =>
      db.employees.createAlias($_aliasNameGenerator(
          db.employeesProjects.employeeId, db.employees.id));

  $$EmployeesTableProcessedTableManager? get employeeId {
    if ($_item.employeeId == null) return null;
    final manager = $$EmployeesTableTableManager($_db, $_db.employees)
        .filter((f) => f.id($_item.employeeId!));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProjectsTable _projectIdTable(_$MyDatabase db) =>
      db.projects.createAlias(
          $_aliasNameGenerator(db.employeesProjects.projectId, db.projects.id));

  $$ProjectsTableProcessedTableManager? get projectId {
    if ($_item.projectId == null) return null;
    final manager = $$ProjectsTableTableManager($_db, $_db.projects)
        .filter((f) => f.id($_item.projectId!));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EmployeesProjectsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $EmployeesProjectsTable> {
  $$EmployeesProjectsTableFilterComposer(super.$state);
  $$EmployeesTableFilterComposer get employeeId {
    final $$EmployeesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $state.db.employees,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$EmployeesTableFilterComposer(ComposerState(
                $state.db, $state.db.employees, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $state.db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProjectsTableFilterComposer(ComposerState(
                $state.db, $state.db.projects, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EmployeesProjectsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $EmployeesProjectsTable> {
  $$EmployeesProjectsTableOrderingComposer(super.$state);
  $$EmployeesTableOrderingComposer get employeeId {
    final $$EmployeesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $state.db.employees,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$EmployeesTableOrderingComposer(ComposerState(
                $state.db, $state.db.employees, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $state.db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProjectsTableOrderingComposer(ComposerState(
                $state.db, $state.db.projects, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EmployeesProjectsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $EmployeesProjectsTable,
    EmployeesProject,
    $$EmployeesProjectsTableFilterComposer,
    $$EmployeesProjectsTableOrderingComposer,
    $$EmployeesProjectsTableCreateCompanionBuilder,
    $$EmployeesProjectsTableUpdateCompanionBuilder,
    (EmployeesProject, $$EmployeesProjectsTableReferences),
    EmployeesProject,
    PrefetchHooks Function({bool employeeId, bool projectId})> {
  $$EmployeesProjectsTableTableManager(
      _$MyDatabase db, $EmployeesProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EmployeesProjectsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$EmployeesProjectsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> employeeId = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeesProjectsCompanion(
            employeeId: employeeId,
            projectId: projectId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int employeeId,
            required String projectId,
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeesProjectsCompanion.insert(
            employeeId: employeeId,
            projectId: projectId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EmployeesProjectsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({employeeId = false, projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (employeeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.employeeId,
                    referencedTable:
                        $$EmployeesProjectsTableReferences._employeeIdTable(db),
                    referencedColumn: $$EmployeesProjectsTableReferences
                        ._employeeIdTable(db)
                        .id,
                  ) as T;
                }
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$EmployeesProjectsTableReferences._projectIdTable(db),
                    referencedColumn: $$EmployeesProjectsTableReferences
                        ._projectIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EmployeesProjectsTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $EmployeesProjectsTable,
    EmployeesProject,
    $$EmployeesProjectsTableFilterComposer,
    $$EmployeesProjectsTableOrderingComposer,
    $$EmployeesProjectsTableCreateCompanionBuilder,
    $$EmployeesProjectsTableUpdateCompanionBuilder,
    (EmployeesProject, $$EmployeesProjectsTableReferences),
    EmployeesProject,
    PrefetchHooks Function({bool employeeId, bool projectId})>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$EmployeesTableTableManager get employees =>
      $$EmployeesTableTableManager(_db, _db.employees);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$KnowYourCustomerTableTableManager get knowYourCustomer =>
      $$KnowYourCustomerTableTableManager(_db, _db.knowYourCustomer);
  $$EmployeesProjectsTableTableManager get employeesProjects =>
      $$EmployeesProjectsTableTableManager(_db, _db.employeesProjects);
}
