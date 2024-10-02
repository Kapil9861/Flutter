import 'package:main_app/application/domain/entities/employee_with_user.dart';

abstract class UserWithEmployeeRepository {
  Future<EmployeeWithUser?> userWithEmployee(int employeeId);
}
