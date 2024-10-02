import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetAllEmployees {
  final EmployeeRepository repo;

  GetAllEmployees(this.repo);
  Stream<List<Employee>> get() {
    return repo.getAllEmployees();
  }
}
