import 'package:main_app/authentication/data/datasources/login_datasource.dart';
import 'package:main_app/authentication/data/models/login_response_model.dart';
import 'package:main_app/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final loginDataSource = LoginDatasource();
  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    try {
      final loginResponseData = await loginDataSource.loginDataSource(
        username: username,
        password: password,
        rememberToken: rememberToken,
      );
      return LoginResponseModel.fromJson(loginResponseData);
    } on Exception catch (e) {
      return LoginResponseModel(
        success: false,
        message: "Caught error at AuthRepoImplementation file: $e",
      );
    }
  }
}
