import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetEmployee {
  final EmployeeRepository repo;

  GetEmployee(this.repo);

  Future<Employee> getEmployee(String id) async {
    return await repo.getEmployee(id);
  }
}
