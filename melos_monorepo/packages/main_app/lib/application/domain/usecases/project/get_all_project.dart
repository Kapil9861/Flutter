import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetAllProject {
  final ProjectRepository repo;

  GetAllProject(this.repo);
  Stream<List<Project>> call() {
    return repo.getAllProjects();
  }
}
