import 'package:main_app/application/domain/repositories/project_employee_repository.dart';

class RemoveEmployeeOnProject {
  final ProjectEmployeeRepository repository;

  RemoveEmployeeOnProject(this.repository);
  Future<int> call(int employeeId, String projectId) async {
    return await repository.deleteEmployeeonProject(employeeId, projectId);
  }
}
