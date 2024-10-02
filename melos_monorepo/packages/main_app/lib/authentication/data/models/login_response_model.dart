import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_app/authentication/data/models/login_data_model.dart';
part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required bool success,
    required String message,
    LoginData? data,
  }) = _LoginResponseModel;
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
