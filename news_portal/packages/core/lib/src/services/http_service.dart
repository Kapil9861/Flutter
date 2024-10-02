abstract class HttpService {
  Future get(String endPoint);
  Future post(String endPoint, Object object);
  Future update(String endPoint, Object object, dynamic data);
  Future delete(String endPoint, dynamic identifier);
}
