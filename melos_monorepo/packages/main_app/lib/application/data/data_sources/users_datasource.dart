import 'package:core/core.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class UsersDatasource {
  final _database = MyDatabase();
  Future<int> addUser(User user) async {
    return await _database.addUser(user);
  }

  Future<User> getUserDetail(String phoneNumber) async {
    return await _database.getUserInfo(phoneNumber);
  }

  Future<bool> updateUser(
      {required String phoneNumber,
      String? dob,
      Genders? gender,
      String? name}) async {
    return await _database.updateUser(
        phoneNumber: phoneNumber, dateOfBirth: dob, gender: gender, name: name);
  }

  Future<int> deleteUser(String userId) async {
    return await _database.deleteUser(userId);
  }
}
