import 'package:veda_news/authentication/data/repositories/user_repository_impl.dart';
import 'package:veda_news/news_articles/data/models/user_model.dart';

class Register {
  final resource = UserRepositoryImpl();
  Future<void> register(User user, String deviceName) async {
    await resource.register(user, deviceName);
  }
}
