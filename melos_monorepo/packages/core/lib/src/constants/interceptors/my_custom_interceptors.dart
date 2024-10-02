import "package:dio/dio.dart";

class MyCustomInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("On the error from dio Interceptor and it is: ${err.message}");
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "device-id": "M2102J20SG::SKQ1.211006.001",
    });
    print(options.headers);
    return super.onRequest(options, handler);
  }

}
