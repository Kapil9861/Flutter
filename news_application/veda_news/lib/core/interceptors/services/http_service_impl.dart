import 'package:dio/dio.dart';
import 'package:veda_news/core/interceptors/http_interceptors.dart';
import 'package:veda_news/core/interceptors/services/http_services.dart';
// import 'package:http/http.dart';

class HttpServiceImpl implements HttpServices {
  HttpServiceImpl() {
    HttpInterceptor();
  }

  final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/"));
  @override
  Future delete(String endPoint) async {
    return await dio.delete(endPoint);
  }

  @override
  Future post(String endPoint) async {
    return await dio.post(endPoint);
  }

  @override
  Future get(String endPoint) async {
    return await dio.get(endPoint);
  }

  @override
  Future put(String endPoint) async {
    return await dio.put(endPoint);
  }
}
