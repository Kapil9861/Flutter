import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/presentation/providers/employee_providers.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

final userGenderProvider = StateProvider<String>((ref) {
  return "male";
});

final updateVisibilityProvider = StateProvider<bool>((ref) {
  return false;
});

final usersDropdownNameProvider = StateProvider<int?>((ref) {
  return null;
});

final employeeFromDropdownProvider = StateProvider<Employee?>((ref) {
  return null;
});

final projectsNameProvider = StateProvider<String?>((ref) {
  return null;
});

final projectTypeProvider = StateProvider<ProjectType>((ref) {
  return ProjectType.values.first;
});

final getSelectedEmployeeDropdownProvider = StateProvider<Employee>(
  (ref) {
    final employee = ref.read(getAllEmployeesProvider);
    return employee.value!.first;
  },
);
