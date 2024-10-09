import 'package:veda_news/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login({
    required String username,
    required String password,
    String? rememberToken,
  });

  Future<UserModel> register({
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
