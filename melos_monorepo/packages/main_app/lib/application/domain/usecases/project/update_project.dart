import 'package:core/core.dart';
import 'package:main_app/application/domain/repositories/project_repository.dart';

class UpdateProject {
  final ProjectRepository repo;

  UpdateProject(this.repo);

  Future<bool> call(
      {required String projectName, String? newName, ProjectType? type}) async {
    return await repo.updateProject(
      projectName: projectName,
      newName: newName,
      type: type,
    );
  }
}
