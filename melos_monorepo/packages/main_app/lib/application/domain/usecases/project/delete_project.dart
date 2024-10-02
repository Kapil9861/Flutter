import 'package:main_app/application/domain/repositories/project_repository.dart';

class DeleteProject {
  final ProjectRepository repository;

  DeleteProject(this.repository);
  Future<int> call(String id) async {
    return await repository.deleteProject(id);
  }
}
