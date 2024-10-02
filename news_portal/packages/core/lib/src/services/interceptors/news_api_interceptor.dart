import 'package:dio/dio.dart';

class NewsApiInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {} on DioException catch (e) {
      print(e.message);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"Content-Type": "application/json"});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response);
    return super.onResponse(response, handler);
  }
}
