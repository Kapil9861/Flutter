import 'package:main_app/application/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repo;

  DeleteUser(this.repo);
  Future<String> call(String userId) async {
    final id = await repo.deleteUser(userId);
    if (id > 0) {
      return "User deleted succeesfully";
    } else {
      return "Could not delete user";
    }
  }
}
