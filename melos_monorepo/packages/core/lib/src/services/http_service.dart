import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Map<String, dynamic>> get(
    String endPoint, {
    String? parameter,
  });
  Future<Map<String, dynamic>> put(
    String endPoint, {
    Object? data,
  });
  Future<Map<String, dynamic>> delete(
    String endPoint, {
    String? uniqueId,
  });
  Future<Map<String, dynamic>> post(
    String endPoint, {
    Object? data,
    Options? options,
  });
}
