import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_app/authentication/data/models/user_model.dart';
part 'login_data_model.freezed.dart';
part 'login_data_model.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    String? accessToken,
    String? refreshToken,
    UserModel? user,
    String? sessionId,
  }) = _LoginData;
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
