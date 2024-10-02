import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_app/authentication/data/models/profile_model.dart';
import 'package:main_app/authentication/data/models/user_in_app_notification_setting.dart';
import 'package:main_app/authentication/data/models/user_notification_setting.dart';
import 'package:main_app/authentication/data/models/user_settings.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? success,
    String? fullname,
    String? username,
    String? email,
    String? phoneNumber,
    bool? isDeleted,
    String? resetPasswordExpiration,
    ProfileModel? profiles,
    UserNotificationSetting? userNotificationSetting,
    UserInAppNotificationSetting? userInAppNotificationSetting,
    UserSettings? userSettings,
    String? sessionId,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
