import 'package:core/core.dart';
import 'package:core/src/service/interceptors/test_interceptors.dart';
import 'package:core/src/service/test_service.dart';
import 'package:dio/dio.dart';

class TestServiceImpl implements TestService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  TestServiceImpl() {
    dio.interceptors.add(TestInterceptors());
  }
  @override
  void delete(String endPoint, Map<String, dynamic> queryParameters) async {
    await dio.delete(endPoint, queryParameters: queryParameters);
  }

  @override
  void get(String endPoint, Map<String, dynamic> queryParameters) async {
    await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
  }

  @override
  void put(String endPoint, Map<String, dynamic> queryParameters) async {
    await dio.put(endPoint, queryParameters: queryParameters);
  }

  @override
  void update(String endPoint, Map<String, dynamic> queryParameters) async {
    await dio.post(endPoint, queryParameters: queryParameters);
  }
}
