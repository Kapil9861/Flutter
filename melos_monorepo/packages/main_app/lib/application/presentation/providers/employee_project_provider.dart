import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/data/data_sources/project_employee_datasource.dart';
import 'package:main_app/application/data/repositories/project_employee_impl.dart';
import 'package:main_app/application/domain/repositories/project_employee_repository.dart';
import 'package:main_app/application/domain/usecases/employee_project/add_employee_on_project.dart';
import 'package:main_app/application/domain/usecases/employee_project/remove_employee_on_project.dart';

final employeeProjectDatasourceProvider =
    Provider<ProjectEmployeeDatasource>((ref) {
  return ProjectEmployeeDatasource();
});

final employeeProjectRepositoryProvider =
    Provider<ProjectEmployeeRepository>((ref) {
  final datasource = ref.watch(employeeProjectDatasourceProvider);
  return ProjectEmployeeImpl(datasource);
});

final removeEmployeeOnProjectProvider =
    StateNotifierProvider<RemoveEmployeeOnProjectNotifier, String>((ref) {
  final repository = ref.watch(employeeProjectRepositoryProvider);
  final delete = RemoveEmployeeOnProject(repository);
  return RemoveEmployeeOnProjectNotifier("initial-state", delete);
});

final addEmployeeOnProjectProvider =
    StateNotifierProvider<AddEmployeeOnProjectNotifier, String>((ref) {
  final repo = ref.watch(employeeProjectRepositoryProvider);
  final add = AddEmployeeOnProject(repo);
  return AddEmployeeOnProjectNotifier("initial-state", add);
});

class AddEmployeeOnProjectNotifier extends StateNotifier<String> {
  AddEmployeeOnProjectNotifier(super.state, this.add);
  final AddEmployeeOnProject add;
  Future<void> addEmployeeOnProject(
      BuildContext context, int employeeId, String projectId) async {
    try {
      int intValue = await add.call(employeeId, projectId);
      intValue++;
      if (intValue > 1) {
        CustomAnimatedSnackbar.show("User Added to Project Successfully!",
            context: context);
      } else {
        CustomAnimatedSnackbar.show("Could not add user to project!",
            context: context);
      }
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show("Error:${e.toString()}", context: context);
    }
  }
}

class RemoveEmployeeOnProjectNotifier extends StateNotifier<String> {
  RemoveEmployeeOnProjectNotifier(super.state, this.delete);
  final RemoveEmployeeOnProject delete;
  Future<void> remove(
      BuildContext context, int employeeId, String projectId) async {
    try {
      int intValue = await delete.call(employeeId, projectId);
      intValue++;
      if (intValue > 1) {
        CustomAnimatedSnackbar.show("User Added to Project Successfully!",
            context: context);
      } else {
        CustomAnimatedSnackbar.show("Could not add user to project!",
            context: context);
      }
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show("Error:${e.toString()}", context: context);
    }
  }
}
