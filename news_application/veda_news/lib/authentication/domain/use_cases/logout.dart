import 'package:veda_news/authentication/domain/repositories/user_repository.dart';

class Logout {
  final UserRepository source;

  Logout(this.source);
  Future<String> logout(String token) async {
    final message = await source.logout(token);
    return message;
  }
}
