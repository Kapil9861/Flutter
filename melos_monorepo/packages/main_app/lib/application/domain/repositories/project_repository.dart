import 'package:core/core.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

abstract class ProjectRepository {
  Future<int> addProjects(ProjectsCompanion project);
  Future<Project> getProject(String projectName);
  Stream<List<Project>> getAllProjects();
  Future<List<Project>> getProjectsForEmployee(int employeeId);
  Future<int> deleteProject(String project);
  Future<bool> updateProject({
    required String projectName,
    String? newName,
    ProjectType? type,
  });
}
