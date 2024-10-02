import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class LoginDatasource {
  final httpServiceImpl = HttpServiceImpl();
  Future<Map<String, dynamic>> loginDataSource({
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    try {
      final dataFromService = await httpServiceImpl.post(loginUrl, data: {
        "username": username,
        "password": password,
        "registrationToken": rememberToken,
      });
      return dataFromService;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {"error from loginDataSource": e.toString()};
    }
  }
}
