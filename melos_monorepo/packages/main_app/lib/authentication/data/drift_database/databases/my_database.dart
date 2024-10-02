import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/authentication/data/drift_database/tables/employees_projects.dart';
import 'package:main_app/authentication/data/drift_database/tables/know_your_customer.dart';
import 'package:main_app/authentication/data/drift_database/tables/employees.dart';
import 'package:main_app/authentication/data/drift_database/tables/projects.dart';
import 'package:main_app/authentication/data/drift_database/tables/users.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'my_database.g.dart';

@DriftDatabase(
    tables: [Employees, Projects, KnowYourCustomer, Users, EmployeesProjects])
class MyDatabase extends _$MyDatabase {
  MyDatabase._privateConstructor() : super(_openConnection());
  static final MyDatabase _singletonInstanceDatabase =
      MyDatabase._privateConstructor();
  factory MyDatabase() {
    return _singletonInstanceDatabase;
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        if (kDebugMode) {
          print(details);
        }
      },
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createTable(projects);
          await m.createTable(users);
          await m.createTable(employeesProjects);
          await m.createTable(employees);
        }
      },
    );
  }

  Future<int> insertKyc(KnowYourCustomerData kyc) async {
    return await into(knowYourCustomer).insert(kyc);
  }

  Future<KnowYourCustomerData?> getExistingData(String phoneNumber) async {
    final query = await (select(knowYourCustomer)
          ..where((t) => t.phoneNumber.equals(phoneNumber)))
        .getSingle();
    print(query.toString());
    return query;
  }

  Stream<List<KnowYourCustomerData>> getExisitingDataAsStream(
      String phoneNumber) {
    return select(knowYourCustomer).watch();
  }

  Future<int> updateWithParentsInfo(
      String phoneNumber, String motherName, String fatherName) async {
    final data = await getExistingData(phoneNumber);
    return await (update(knowYourCustomer)
          ..where((table) => table.phoneNumber.equals(phoneNumber)))
        .write(
      KnowYourCustomerData(
        // id: data!.id,
        gender: data?.gender,
        phoneNumber: phoneNumber,
        firstName: data!.firstName,
        lastName: data.lastName,
        dateOfBirth: data.dateOfBirth,
        motherName: motherName,
        fatherName: fatherName,
      ),
    );
  }

  Future<void> deleteKyc(
      String phoneNumber, flutter.BuildContext context) async {
    try {
      await (delete(knowYourCustomer)
            ..where((table) => table.phoneNumber.equals(phoneNumber)))
          .go();
      // await customStatement('DROP TABLE IF EXISTS know_your_customer');
      if (context.mounted) {
        CustomAnimatedSnackbar.show(
          "Success: Deleted Your KYC!",
          context: context,
          backgroundColor: flutter.Colors.green,
          type: AnimatedSnackBarType.success,
        );
      }
    } on Exception catch (e) {
      if (context.mounted) {
        CustomAnimatedSnackbar.show("error:$e", context: context);
      }
    }
  }

  Future<int> addUser(User user) async {
    return await into(users).insert(user);
  }

  Future<User> getUserInfo(String phoneNumber) async {
    final query = await (select(users)
          ..where((userTable) => (userTable.phoneNumber.equals(phoneNumber))))
        .getSingle();
    return query;
  }

  Future<bool> updateUser({
    String? name,
    Genders? gender,
    String? dateOfBirth,
    required String phoneNumber,
  }) async {
    final existingData = await getUserInfo(phoneNumber);
    final query = await (update(users).replace(
      User(
        id: existingData.id,
        name: name ?? existingData.name,
        gender: gender ?? existingData.gender,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth ?? existingData.dateOfBirth,
      ),
    ));
    return query;
  }

  Future<int> deleteUser(String userId) async {
    return await (delete(users)
          ..where(
            (user) => user.id.equals(userId),
          ))
        .go();
  }

  Future<int> addProject(ProjectsCompanion project) async {
    try {
      final result = await into(projects).insert(project);
      return result;
    } on Exception catch (e) {
      if (e is InvalidDataException) {
        return -1; // Duplicate projectName or some other integrity issue
      } else if (e is SqliteException) {
        return -2; // SQLite-specific error
      } else {
        return -3; // Unknown error
      }
    }
  }

  Future<Project> getProject(String projectName) async {
    final query = await (select(projects)
          ..where(
            (tableName) => tableName.projectName.equals(projectName),
          ))
        .getSingle();
    return query;
  }

  Future<int> addEmployeeInProject(String projectId, int employeeId) async {
    final employeeOnProject =
        EmployeesProject(employeeId: employeeId, projectId: projectId);
    return await into(employeesProjects).insert(employeeOnProject);
  }

  Future<int> removeEmployeeFromProject(int empId, String projectId) async {
    return await (delete(employeesProjects)
          ..where((tbl) =>
              tbl.employeeId.equals(empId) & tbl.projectId.equals(projectId)))
        .go();
  }

  Stream<List<Project>> getAllProjects() {
    return select(projects).watch();
  }

  Future<List<Project>> getProjectsForEmployee(int employeeId) async {
    final projectsAssociatedWithEmployee = await (select(employeesProjects)
          ..where(
            (table) => table.employeeId.equals(employeeId),
          ))
        .join([
      innerJoin(
        projects,
        projects.id.equalsExp(employeesProjects.projectId),
      )
    ]).map((row) {
      return row.readTable(projects);
    }).get();
    return projectsAssociatedWithEmployee;
  }

  Future<bool> updateProject(
    String projectName,
    String? newName,
    ProjectType? type,
  ) async {
    final existingProject = await getProject(projectName);
    final query = await (update(projects).replace(
      Project(
        id: existingProject.id,
        projectName: newName ?? projectName,
        type: type ?? existingProject.type,
      ),
    ));
    return query;
  }

  Future<int> deleteProject(String projectId) async {
    return (delete(projects)
          ..where(
            (projectTable) => projectTable.id.equals(projectId),
          ))
        .go();
  }

  Future<List<Employee>> getEmployeeOnProject(String projectId) async {
    final employeesOnProject = await (select(employeesProjects)
          ..where(
            (table) => table.projectId.equals(projectId),
          ))
        .join([
      innerJoin(
        employees,
        employees.id.equalsExp(employeesProjects.employeeId),
      )
    ]).map((row) {
      return row.readTable(employees);
    }).get();
    return employeesOnProject;
  }

  Future<int> addEmployee(Employee employee) async {
    final companion = EmployeesCompanion(
      designation: Value(employee.designation),
      userId: Value(employee.userId),
      isActive: employee.isActive == null
          ? const Value.absent()
          : Value(employee.isActive),
      salary: Value(employee.salary),
    );
    return await into(employees).insert(companion);
  }

  Future<Employee> getEmployee(String id) async {
    final query = await (select(employees)
          ..where((tableName) => tableName.userId.equals(id)))
        .getSingle();
    return query;
  }

  Stream<List<Employee>> getAllEmployees() {
    return select(employees).watch();
  }

  Future<int> deleteEmployee(int employeeId) async {
    return await (delete(employees)
          ..where(
            (employeeTable) => employeeTable.id.equals(employeeId),
          ))
        .go();
  }

  Future<bool> updateEmployee(
      {required int id,
      String? designation,
      required String userId,
      int? salary,
      bool? isActive}) async {
    final existingData = await getEmployee(userId);
    final query = await (update(employees)).replace(
      Employee(
        userId: existingData.userId,
        id: existingData.id,
        salary: salary ?? existingData.salary,
        designation: designation ?? existingData.designation,
        isActive: isActive ?? existingData.isActive,
      ),
    );
    // print("Employee id is :${existingData.id}");
    return query;
  }

  Future<Map<String, List<dynamic>>> getEmployeesNameById(List<int> ids) async {
    final query = await (select(employees)
            .join([innerJoin(users, users.id.equalsExp(employees.userId))])
          ..where(employees.id.isIn(ids)))
        .get();
    List<String> names = query.map((result) {
      final userData = result.readTable(users);
      return userData.name;
    }).toList();
    List<String> phoneNumbers = query.map((result) {
      final userNumber = result.readTable(users);
      return userNumber.phoneNumber;
    }).toList();
    List<String> returnedIds = query.map((result) {
      final id = result.readTable(employees);
      return id.userId;
    }).toList();
    List<int> empIds = query.map((result) {
      final employeeId = result.readTable(employees);
      return employeeId.id;
    }).toList();
    return {
      "names": names,
      "numbers": phoneNumbers,
      "users_id": returnedIds,
      "e_id": empIds,
    };
  }

  Future<EmployeeWithUser?> getEmployeeWithUserData(int employeeId) async {
    // Perform the join between Employees and Users table
    final query = select(employees).join(
      [
        innerJoin(
          users,
          users.id.equalsExp(employees.userId),
        ),
      ],
    )..where(employees.id.equals(employeeId)); // Filter by employee ID

    // Execute the query and get the result
    final result = await query.getSingleOrNull();

    // If we have a result, map it to the custom data class
    if (result != null) {
      final employeeData = result.readTable(employees); // Employee data
      final userData = result.readTable(users); // User data

      // Return the merged data
      return EmployeeWithUser(
        employeeId: employeeData.id,
        userId: employeeData.userId,
        isActive: employeeData.isActive,
        salary: employeeData.salary,
        designation: employeeData.designation,
        userName: userData.name,
        dateOfBirth: userData.dateOfBirth,
        gender: userData.gender,
        phoneNumber: userData.phoneNumber,
      );
    }

    return null; // If no data found, return null
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, "schema_config1"));
    return NativeDatabase.createInBackground(file);
  });
}
