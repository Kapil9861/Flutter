import 'package:veda_news/authentication/data/repositories/user_repository_impl.dart';

class Login {
  final repository = UserRepositoryImpl();
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    final data = await repository.login(
        email: email, password: password, deviceName: deviceName);
    return data;
  }
}
