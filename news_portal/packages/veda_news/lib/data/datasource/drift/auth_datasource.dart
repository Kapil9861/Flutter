import 'package:veda_news/data/database/news_portal_database.dart';

class AuthDatasource {
  final _database = NewsPortalDatabase();
  Future<String> register(
      {required String fullname,
      required String username,
      required String password,
      required String phoneNumber,
      String? email,
      String? resetPasswordExpiration,
      String? sessionId,
      String? rememberToken,
      bool? isDeleted}) async {
    return await _database.register(
      fullname: fullname,
      username: username,
      password: password,
      phoneNumber: phoneNumber,
      email: email,
      isDeleted: isDeleted,
      rememberToken: rememberToken,
      resetPasswordExpiration: resetPasswordExpiration,
      sessionId: sessionId,
    );
  }

  Future<User?> login({
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    return await _database.login(username, password);
  }
}
