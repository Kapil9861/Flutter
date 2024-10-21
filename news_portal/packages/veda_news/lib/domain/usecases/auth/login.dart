import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepositoryImpl;

  Login(this.authRepositoryImpl);
  Future<User?> login({
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    final loginData = await authRepositoryImpl.login(
      username: username,
      password: password,
      rememberToken: rememberToken,
    );
    if (loginData != null) {
      return loginData;
    } else {
      return const User(
          userName: "",
          fullName: "",
          password: "",
          phoneNumber: "",
          isDeleted: true);
    }
  }
}
