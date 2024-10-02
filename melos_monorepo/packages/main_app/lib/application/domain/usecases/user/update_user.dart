import 'package:core/core.dart';
import 'package:main_app/application/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repo;

  UpdateUser(this.repo);
  Future<String> call(
      {required String phoneNumber,
      String? dob,
      Genders? gender,
      String? name,}) async {
    final isUpdated = await repo.updateUser(
      phoneNumber: phoneNumber,
      dob: dob,
      gender: gender,
      name: name,
    );
    if (isUpdated) {
      return "User updated successfully";
    } else {
      return "Could not update user!";
    }
  }
}
