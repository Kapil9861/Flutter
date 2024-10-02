import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/data/data_sources/employee_datasource.dart';
import 'package:main_app/application/data/repositories/employee_repository_impl.dart';
import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/application/domain/usecases/employee/add_employee.dart';
import 'package:main_app/application/domain/usecases/employee/delete_employee.dart';
import 'package:main_app/application/domain/usecases/employee/get_all_employees.dart';
import 'package:main_app/application/domain/usecases/employee/get_employee.dart';
import 'package:main_app/application/domain/usecases/employee/get_employee_on_project.dart';
import 'package:main_app/application/domain/usecases/employee/update_employee.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

final employeeDatasourceProvider = Provider<EmployeeDatasource>((ref) {
  return EmployeeDatasource();
});

final employeeRepositoryProvider = Provider<EmployeeRepository>((ref) {
  final dataSource = ref.watch(employeeDatasourceProvider);
  final repo = EmployeeRepositoryImpl(dataSource);
  return repo;
});

final employeesOnProjectProvider =
    StateNotifierProvider<EmployeesOnProjectNotifier, List<Employee>>((ref) {
  final repo = ref.read(employeeRepositoryProvider);
  return EmployeesOnProjectNotifier(GetEmployeeOnProject(repo));
});

final updateEmployeeProvider =
    StateNotifierProvider<UpdateNotifierProvider, bool>((ref) {
  final repo = ref.read(employeeRepositoryProvider);
  final updateEmployee = UpdateEmployee(repo);
  return UpdateNotifierProvider(updateEmployee);
});

final getAllEmployeesProvider = StreamProvider<List<Employee>>((ref) {
  final source = ref.watch(employeeRepositoryProvider);
  final getAllProject = GetAllEmployees(source);
  return getAllProject.get();
});

class UpdateNotifierProvider extends StateNotifier<bool> {
  UpdateNotifierProvider(this.updateEmployee) : super(false);
  final UpdateEmployee updateEmployee;
  
  Future<void> update(
    String userId,
    int employeeId,
    BuildContext context, {
    String? designation,
    int? salary,
  }) async {
    final result = await updateEmployee.call(
      employeeId: employeeId,
      userId: userId,
      designation: designation,
      salary: salary,
    );
    if (result) {
      CustomAnimatedSnackbar.show(
        "Updated Employee Successfully!",
        context: context,
      );
    } else {
      CustomAnimatedSnackbar.show(
        "Updated Employee Successfully!",
        context: context,
      );
    }
  }
}

final getEmployeeProvider =
    StateNotifierProvider<GetEmployeeNotifier, Employee>((ref) {
  final repo = ref.read(employeeRepositoryProvider);
  final getEmployee = GetEmployee(repo);
  return GetEmployeeNotifier(getEmployee);
});

final addEmployeeProvider =
    ChangeNotifierProvider.family<AddEmployeeChangeNotifier, Employee>(
  (ref, employee) {
    final repo = ref.read(employeeRepositoryProvider);
    final addEmployee = AddEmployee(repo);
    return AddEmployeeChangeNotifier(addEmployee, employee);
  },
);

final deleteEmployeeProvider = FutureProvider.family<String, int>(
  (ref, employeeId) async {
    final repo = ref.read(employeeRepositoryProvider);
    final deleteEmployee = DeleteEmployee(repo);
    return await deleteEmployee.deleteEmployee(employeeId);
  },
);

final getEmployeeDataProvider = FutureProvider.family<Employee, String>(
  (ref, id) async {
    final database = MyDatabase();
    final data = await database.getEmployee(id);
    return data;
  },
);

class AddEmployeeChangeNotifier extends ChangeNotifier {
  final AddEmployee addEmployee;
  final Employee employee;

  AddEmployeeChangeNotifier(this.addEmployee, this.employee);
  int state = 0;

  Future<void> add(BuildContext context) async {
    final updatedState = await addEmployee.call(employee);
    if (updatedState > 0) {
      state = 0;
      CustomAnimatedSnackbar.show("Employee Added Successfully!",
          context: context);
    } else {
      CustomAnimatedSnackbar.show(
        "Could Not Add Employee",
        context: context,
        type: AnimatedSnackBarType.error,
        backgroundColor: Colors.red,
      );
    }
    notifyListeners();
  }
}

class GetEmployeeNotifier extends StateNotifier<Employee> {
  GetEmployeeNotifier(this.employee)
      : super(
          const Employee(
            userId: "initial-state",
            id: 0,
            salary: 0,
            designation: 'initialState',
          ),
        );
  final GetEmployee employee;
  Future<void> getEmployee(BuildContext context, String id) async {
    try {
      final currentEmployee = await employee.getEmployee(id);
      state = currentEmployee;
    } on Exception catch (e) {
      if (context.mounted) {
        CustomAnimatedSnackbar.show("Error: ${e.toString()}", context: context);
      }
    }
  }
}

class EmployeesOnProjectNotifier extends StateNotifier<List<Employee>> {
  EmployeesOnProjectNotifier(this.employeesOnProject) : super([]);
  final GetEmployeeOnProject employeesOnProject;

  Future<void> getEmployees(String projectName, BuildContext context) async {
    try {
      final getEmployees =
          await employeesOnProject.getEmployeesOnProject(projectName);
      state = getEmployees;
    } on Exception catch (e) {
      if (context.mounted) {
        CustomAnimatedSnackbar.show("Error: ${e.toString()}", context: context);
      }
    }
  }
}
