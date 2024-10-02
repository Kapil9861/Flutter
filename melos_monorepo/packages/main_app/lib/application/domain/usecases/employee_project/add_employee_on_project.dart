import 'package:main_app/application/domain/repositories/project_employee_repository.dart';

class AddEmployeeOnProject {
  final ProjectEmployeeRepository repository;

  AddEmployeeOnProject(this.repository);

  Future<int> call(int employeeId, String projectId) async {
    return await repository.addEmployeeOnProject(employeeId, projectId);
  }
}
