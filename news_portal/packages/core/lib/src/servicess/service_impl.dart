import 'package:core/core.dart';
import 'package:core/src/servicess/intercepterre.dart';
import 'package:core/src/servicess/service.dart';
import 'package:dio/dio.dart';

class ServiceImpl implements Servic {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  ServiceImpl() {
    dio.interceptors.add(Intercepterre());
  }
  @override
  void get(String endPoint, Map<String, dynamic> queryParams) async {
    await dio.get(endPoint, queryParameters: queryParams);
  }
}
