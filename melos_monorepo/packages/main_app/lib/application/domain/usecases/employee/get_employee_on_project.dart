import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetEmployeeOnProject {
  final EmployeeRepository repo;

  GetEmployeeOnProject(this.repo);

  Future<List<Employee>> getEmployeesOnProject(String projectId) async {
    return await repo.getEmployeeOnProject(projectId);
  }
}
