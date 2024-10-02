import 'package:core/core.dart';
import 'package:core/src/constants/interceptors/my_custom_interceptors.dart';
import 'package:core/src/services/http_service.dart';
import 'package:dio/dio.dart';

class HttpServiceImpl extends HttpService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  HttpServiceImpl() {
    dio.interceptors.add(MyCustomInterceptors());
  }

  @override
  Future<Map<String, dynamic>> delete(String endPoint,
      {String? uniqueId}) async {
    try {
      final response = await dio.delete(endPoint);
      return response.data;
    } on Exception catch (e) {
      return {
        "Delete": "This is the auth service error:$e",
      };
    }
  }

  @override
  Future<Map<String, dynamic>> get(String endPoint, {String? parameter}) async {
    try {
      final response = await dio.get(endPoint);
      return response.data;
    } on Exception catch (e) {
      return {
        "get_data": "This is the get data error:$e",
      };
    }
  }

  @override
  Future<Map<String, dynamic>> post(String endPoint,
      {Object? data, Options? options}) async {
    try {
      final response = await dio.post(endPoint, data: data);
      return response.data;
    } on Exception catch (e) {
      return {
        "error":
            "post error from http service implementation, detail ${e.toString()}"
      };
    }
  }

  @override
  Future<Map<String, dynamic>> put(String endPoint, {Object? data}) async {
    try {
      final response = await dio.put(endPoint, data: data);
      return response.data;
    } on Exception catch (e) {
      return {
        "put": "This is the put data, error:$e",
      };
    }
  }
}
