import 'package:main_app/authentication/data/models/login_data_model.dart';
import 'package:main_app/authentication/data/repositories/auth_repository_impl.dart';

class Login {
  final authRepositoryImpl = AuthRepositoryImpl();
  Future<LoginData> login({
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
      return loginData.data!;
    } on Exception catch (e) {
      return LoginData(
        sessionId: "error from UseCase: ${e.toString()}",
      );
    }
  }
}
