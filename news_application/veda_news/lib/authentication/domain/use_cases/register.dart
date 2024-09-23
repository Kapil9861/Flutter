import 'package:veda_news/authentication/domain/repositories/user_repository.dart';
import 'package:veda_news/news_articles/data/models/user_model.dart';

class Register {
  final UserRepository resource;

  Register(this.resource);
  Future<void> register(User user, String deviceName) async {
    await resource.register(user, deviceName);
  }
}
