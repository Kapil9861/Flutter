import 'package:core/core.dart';
import 'package:main_app/application/data/data_sources/users_datasource.dart';
import 'package:main_app/application/domain/repositories/user_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersDatasource userDataSource;

  UserRepositoryImpl(this.userDataSource);
  @override
  Future<int> addUser(User user) async {
    return await userDataSource.addUser(user);
  }

  @override
  Future<int> deleteUser(String userId) async {
    return await userDataSource.deleteUser(userId);
  }

  @override
  Future<User> getUserDetail(String phoneNumber) async {
    return await userDataSource.getUserDetail(phoneNumber);
  }

  @override
  Future<bool> updateUser(
      {required String phoneNumber,
      String? dob,
      Genders? gender,
      String? name}) async {
    return await userDataSource.updateUser(
      phoneNumber: phoneNumber,
      dob: dob,
      gender: gender,
      name: name,
    );
  }
}
