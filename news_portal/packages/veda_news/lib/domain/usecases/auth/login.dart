import 'package:veda_news/data/models/user_model.dart';
import 'package:veda_news/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepositoryImpl;

  Login(this.authRepositoryImpl);
  Future<UserModel> login({
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
      return UserModel(
        sessionId: "error from UseCase: ${e.toString()}",
      );
    }
  }
}
