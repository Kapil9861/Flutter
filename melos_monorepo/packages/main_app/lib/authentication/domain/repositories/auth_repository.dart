import 'package:main_app/authentication/data/models/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
    String? rememberToken,
  });
}
