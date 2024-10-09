import 'package:core/core.dart';
import 'package:core/src/service/html_service.dart';
import 'package:core/src/service/interceptor/test_interceptor.dart';
import 'package:dio/dio.dart';

class HtmlServiceImpl implements HtmlService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  HtmlServiceImpl() {
    dio.interceptors.add(TestInterceptor());
  }
  @override
  Future get(String endPoint, Map<String, dynamic> queryParameters) async {
    return await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
  }

  @override
  Future put(String endPoint, Map<String, dynamic> queryParameters) async {
    return await dio.put(endPoint, queryParameters: queryParameters);
  }

  @override
  Future post(String endPoint, Map<String, dynamic> queryParameters) async {
    return await dio.post(endPoint, queryParameters: queryParameters);
  }
}
