import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class AddEmployee {
  final EmployeeRepository repo;

  AddEmployee(this.repo);
  Future<int> call(Employee employee) async {
    final employeeId = await repo.addEmployee(employee);
    return employeeId;
  }
}
