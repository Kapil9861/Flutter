import 'package:main_app/application/data/data_sources/project_employee_datasource.dart';
import 'package:main_app/application/domain/repositories/project_employee_repository.dart';

class ProjectEmployeeImpl implements ProjectEmployeeRepository {
  final ProjectEmployeeDatasource datasource;

  ProjectEmployeeImpl(this.datasource);
  @override
  Future<int> addEmployeeOnProject(int employeeId, String projectId) async {
    return await datasource.addEmployeeOnProject(employeeId, projectId);
  }

  @override
  Future<int> deleteEmployeeonProject(int employeeId, String projectId) async {
    return await datasource.deleteEmployeeonProject(employeeId, projectId);
  }
}
