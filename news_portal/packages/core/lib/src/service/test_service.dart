abstract class TestService {
  void get(String endPoint, Map<String, dynamic> queryParameters);
  void delete(String endPoint, Map<String, dynamic> queryParameters);
  void update(String endPoint, Map<String, dynamic> queryParameters);
  void put(String endPoint, Map<String, dynamic> queryParameters);
}
