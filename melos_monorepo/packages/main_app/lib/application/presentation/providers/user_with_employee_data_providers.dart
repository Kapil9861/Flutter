import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/data/data_sources/user_employee_datasource.dart';
import 'package:main_app/application/data/repositories/user_with_employee_impl.dart';
import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/application/domain/repositories/user_with_employee_repository.dart';
import 'package:main_app/application/domain/usecases/user_employee/user_with_employee.dart';

final dataProvider = Provider<UserEmployeeDatasource>((ref) {
  return UserEmployeeDatasource();
});
final repoProvider = Provider<UserWithEmployeeRepository>((ref) {
  final datasource = ref.watch(dataProvider);
  return UserWithEmployeeImpl(datasource);
});

final  userWithEmployeeProvider =
    StateNotifierProvider<UserWithEmployeeNotifier, EmployeeWithUser>((ref) {
  final repo = ref.watch(repoProvider);
  final userWithEmployee = UserWithEmployee(repo);
  return UserWithEmployeeNotifier(userWithEmployee);
});

class UserWithEmployeeNotifier extends StateNotifier<EmployeeWithUser> {
  final UserWithEmployee useCase;
  UserWithEmployeeNotifier(this.useCase)
      : super(
          EmployeeWithUser(
            employeeId: 1,
            userId: "userId",
            salary: 0,
            designation: "designation",
            userName: "userName",
            gender: Genders.male,
            phoneNumber: "phoneNumber",
          ),
        );
  Future<void> userAndEmployeeData(BuildContext context, int employeeId) async {
    final data = await useCase.call(employeeId);
    if (data != null) {
      state = data;
    } else {
      CustomAnimatedSnackbar.show(
        "Did not found the needed data!",
        context: context,
      );
    }
  }
}
