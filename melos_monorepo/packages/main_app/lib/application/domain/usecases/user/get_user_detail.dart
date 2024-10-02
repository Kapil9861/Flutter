import 'package:main_app/application/domain/repositories/user_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetUserDetail {
    final UserRepository repo;

  GetUserDetail(this.repo);

  Future<User> call(String phoneNumber) async {
    return await repo.getUserDetail(phoneNumber);
  }
}
