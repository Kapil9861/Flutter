import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class AddProjects {
  final ProjectRepository repo;

  AddProjects(this.repo);

  Future<int> call(ProjectsCompanion project) async {
    return await repo.addProjects(project);
  }
}
