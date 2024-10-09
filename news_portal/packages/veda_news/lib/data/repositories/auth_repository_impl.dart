import 'package:veda_news/data/models/user_model.dart';
import 'package:veda_news/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserModel> login({
    required String username,
    required String password,
    String? rememberToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register(
      {required String fullname,
      required String username,
      required String password,
      required String phoneNumber,
      String? email,
      String? resetPasswordExpiration,
      String? sessionId,
      String? rememberToken,
      bool? isDeleted}) {
    throw UnimplementedError();
  }
}
