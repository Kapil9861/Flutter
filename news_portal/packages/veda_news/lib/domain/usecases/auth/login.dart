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
    try {
      final loginData = await authRepositoryImpl.login(
        username: username,
        password: password,
        rememberToken: rememberToken,
      );
      return loginData;
    } on Exception catch (e) {
      print(e);
    }
  }
}
