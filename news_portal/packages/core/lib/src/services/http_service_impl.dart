import 'package:core/core.dart';
import 'package:core/src/services/http_service.dart';
import 'package:core/src/services/interceptors/news_api_interceptor.dart';
import 'package:dio/dio.dart';

class HttpServiceImpl implements HttpService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  HttpServiceImpl() {
    dio.interceptors.add(NewsApiInterceptor());
  }

  @override
  Future delete(String endPoint, identifier) async {
    try {
      final result =
          await dio.delete(endPoint, queryParameters: {"id": identifier});
      return result.data;
    } on Exception catch (e) {
      return e;
    }
  }

  @override
  Future get(String endPoint, {String? filter1, String? filter2}) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: {},
      );
      return response.data;
    } on Exception catch (e) {
      return e;
    }
  }

  @override
  Future post(String endPoint, Object object) async {
    try {
      final response = await dio.post(endPoint, data: {"data": object});
      return response.data;
    } on Exception catch (e) {
      return e;
    }
  }

  @override
  Future update(String endPoint, Object object, dynamic data) async {
    try {
      final response = await dio.post(endPoint, queryParameters: {
        "id": object,
      }, data: {
        "data": data,
      });
      return response.data;
    } on Exception catch (e) {
      return e;
    }
  }
}
