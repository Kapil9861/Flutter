import 'package:core/core.dart';
import 'package:main_app/application/data/data_sources/projects_datasource.dart';
import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectsDatasource projectDatasource;

  ProjectRepositoryImpl(this.projectDatasource);
  @override
  Future<int> addProjects(ProjectsCompanion project) async {
    return await projectDatasource.addProjects(project);
  }

  @override
  Stream<List<Project>> getAllProjects() {
    return projectDatasource.getAllProjects();
  }

  @override
  Future<Project> getProject(String projectName) async {
    return await projectDatasource.getProject(projectName);
  }

  @override
  Future<List<Project>> getProjectsForEmployee(int employeeId) async {
    return await projectDatasource.getProjectsForEmployee(employeeId);
  }

  @override
  Future<int> deleteProject(String id) async {
    return await projectDatasource.deleteProject(id);
  }

  @override
  Future<bool> updateProject(
      {required String projectName, String? newName, ProjectType? type}) async {
    return await projectDatasource.updateProject(
      projectName: projectName,
      newName: newName,
      type: type,
    );
  }
}
