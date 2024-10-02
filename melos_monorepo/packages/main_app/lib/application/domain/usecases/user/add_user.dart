import 'package:main_app/application/domain/repositories/user_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class AddUser {
  final UserRepository userRepository;

  AddUser(this.userRepository);

  Future<int> call(User user) async {
    if (user.id.isEmpty) {
      throw Exception("User name cannot be empty");
    }

    return await userRepository.addUser(user);
  }
}
