abstract class UserRepository {
  Future<void> login();
  Future<void> register();
  Future<void> logout();
}
