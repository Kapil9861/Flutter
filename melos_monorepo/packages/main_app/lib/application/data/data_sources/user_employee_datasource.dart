import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class UserEmployeeDatasource {
  final _database = MyDatabase();
  Future<EmployeeWithUser?> userWithEmployee(int employeeId) async {
    return await _database.getEmployeeWithUserData(employeeId);
  }
}
