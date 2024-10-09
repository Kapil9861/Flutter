import 'package:veda_news/data/datasource/drift/auth_datasource.dart';
import 'package:veda_news/data/models/user_model.dart';
import 'package:veda_news/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource source;

  AuthRepositoryImpl(this.source);
  @override
  Future<UserModel> login({
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    return await source.login(username: username, password: password);
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
      bool? isDeleted}) async {
    return await source.register(
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
}
