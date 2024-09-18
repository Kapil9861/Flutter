import 'package:veda_news/authentication/data/repositories/user_repository_impl.dart';

class Logout {
  final source = UserRepositoryImpl();
  Future<String> logout(String token) async {
    final message = await source.logout(token);
    return message;
  }
}
