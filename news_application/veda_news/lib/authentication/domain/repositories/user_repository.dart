import 'package:veda_news/news_articles/data/models/user_model.dart';

abstract class UserRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String deviceName,
  });
  Future<String> logout(String token);
  Future<void> register(User user, String deviceName);
}
