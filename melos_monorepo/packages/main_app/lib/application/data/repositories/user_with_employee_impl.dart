import 'package:main_app/application/data/data_sources/user_employee_datasource.dart';
import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/application/domain/repositories/user_with_employee_repository.dart';

class UserWithEmployeeImpl implements UserWithEmployeeRepository {
  final UserEmployeeDatasource _datasource;

  UserWithEmployeeImpl(this._datasource);
  @override
  Future<EmployeeWithUser?> userWithEmployee(int employeeId) async {
    return await _datasource.userWithEmployee(employeeId);
  }
}
