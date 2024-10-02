import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class ProjectEmployeeDatasource {
  final database = MyDatabase();
  Future<int> addEmployeeOnProject(int employeeId, String projectId) async {
    return await database.addEmployeeInProject(projectId, employeeId);
  }

  Future<int> deleteEmployeeonProject(int employeeId, String projectId) async {
    return await database.removeEmployeeFromProject(employeeId, projectId);
  }
}
