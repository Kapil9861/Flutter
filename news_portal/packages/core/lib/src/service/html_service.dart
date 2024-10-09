abstract class HtmlService {
  void get(String endPoint, Map<String, dynamic> queryParameters);
  void put(String endPoint, Map<String, dynamic> queryParameters);
  Future post(String endPoint, Map<String, dynamic> queryParameters);
}
