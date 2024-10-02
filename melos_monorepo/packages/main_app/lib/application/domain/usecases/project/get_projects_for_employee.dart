import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetProjectsForEmployee {
  final ProjectRepository repo;

  GetProjectsForEmployee(this.repo);

  Future<List<Project>> call(int employeeId) async {
    return repo.getProjectsForEmployee(employeeId);
  }
}
