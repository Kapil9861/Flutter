import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/application/domain/repositories/user_with_employee_repository.dart';

class UserWithEmployee {
  final UserWithEmployeeRepository repository;

  UserWithEmployee(this.repository);

  Future<EmployeeWithUser?> call(int employeeId) async {
    return await repository.userWithEmployee(employeeId);
  }
}
