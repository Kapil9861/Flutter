import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetProject {
  final ProjectRepository repo;

  GetProject(this.repo);
  Future<Project> call(String projectName) async {
    return await repo.getProject(projectName);
  }
}
