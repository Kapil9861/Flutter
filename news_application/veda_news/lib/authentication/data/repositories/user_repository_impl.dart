import 'package:veda_news/authentication/data/data_sources/user_datasource.dart';
import 'package:veda_news/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final dataSource = UserDatasource();
  @override
  Future<dynamic> login(
      String email, String password, String deviceName) async {
    final data = await dataSource.login(email, password, deviceName);
    return data;
  }

  @override
  Future<String> logout(String token) async {
    final logOutMessage = await dataSource.logout(token);
    return logOutMessage;
  }

  @override
  Future<void> register() async {
    throw UnimplementedError();
  }
}
