import 'package:veda_news/authentication/data/data_sources/user_datasource.dart';
import 'package:veda_news/news_articles/data/models/user_model.dart';
import 'package:veda_news/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final dataSource = UserDatasource();
  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    final data = await dataSource.login(email, password, deviceName);
    User? user;
    if (data.containsKey('user') && data['user'] != null) {
      user = User.fromJson(data['user']);
      return {
        'user': user,
        'token': data['token'],
        'message': data['success'],
      };
    } else {
      return {
        'error': data['message'],
      };
    }
  }

  @override
  Future<String> logout(String token) async {
    final logOutMessage = await dataSource.logout(token);
    return logOutMessage;
  }

  @override
  Future<Map<String, dynamic>> register(User user, String deviceName) async {
    final register = await dataSource.register(user, deviceName);
    if (register.containsKey('user')) {
      return {
        'user': register['user'],
        'token': register['token'],
        'message': register['success']
      };
    } else if (register.containsKey('email')) {
      return {"email": register['email']};
    } else if (register.containsKey('error')) {
      return {"error": register['message']};
    } else {
      return {'error': 'Nothing got from database!'};
    }
  }
}
