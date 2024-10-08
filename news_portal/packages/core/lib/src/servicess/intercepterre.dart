import 'package:dio/dio.dart';

class Intercepterre extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Response is : $err");

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content_Type": "application/json",
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response is : $response");
    super.onResponse(response, handler);
  }
}
