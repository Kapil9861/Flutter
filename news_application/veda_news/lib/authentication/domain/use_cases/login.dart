import 'package:veda_news/authentication/domain/repositories/user_repository.dart';

class Login {
  final UserRepository repository;

  Login(this.repository);
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
