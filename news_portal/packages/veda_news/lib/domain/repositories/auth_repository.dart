import 'package:veda_news/data/database/news_portal_database.dart';

abstract class AuthRepository {
  Future<User?> login({
    required String username,
    required String password,
    String? rememberToken,
  });

  Future<String> register({
    required String fullname,
    required String username,
    required String password,
    required String phoneNumber,
    String? email,
    String? resetPasswordExpiration,
    String? sessionId,
    String? rememberToken,
    bool? isDeleted,
  });
}
