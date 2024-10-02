import 'package:core/core.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class ProjectsDatasource {
  final _database = MyDatabase();
  Future<int> addProjects(ProjectsCompanion project) async {
    return await _database.addProject(project);
  }

  Future<Project> getProject(String projectName) async {
    return await _database.getProject(projectName);
  }

  Stream<List<Project>> getAllProjects() {
    return _database.getAllProjects();
  }

  Future<List<Project>> getProjectsForEmployee(int employeeId) async {
    return await _database.getProjectsForEmployee(employeeId);
  }

  Future<int> deleteProject(String id) async {
    return await _database.deleteProject(id);
  }

  Future<bool> updateProject(
      {required String projectName, String? newName, ProjectType? type}) async {
    return await _database.updateProject(projectName, newName, type);
  }
}
