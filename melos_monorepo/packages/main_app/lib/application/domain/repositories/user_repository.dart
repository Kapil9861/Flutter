import 'package:core/core.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

abstract class UserRepository {
  Future<int> addUser(User user);
  Future<User> getUserDetail(String phoneNumber);
  Future<bool> updateUser(
      {required String phoneNumber,
      String? dob,
      Genders? gender,
      String? name});
  Future<int> deleteUser(String userId);
}
