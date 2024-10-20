import 'package:veda_news/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository source;

  Register(this.source);
  Future<String> call(
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
