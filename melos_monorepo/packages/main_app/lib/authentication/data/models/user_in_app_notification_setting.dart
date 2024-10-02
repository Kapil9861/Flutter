import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_in_app_notification_setting.freezed.dart';
part 'user_in_app_notification_setting.g.dart';

@freezed
class UserInAppNotificationSetting with _$UserInAppNotificationSetting {
  const factory UserInAppNotificationSetting({
    String? id,
    String? userId,
    bool? sound,
    bool? vibration,
    String? ringtone,
    String? createdAt,
    String? updatedAt,
  }) = _UserInAppNotificationSetting;

  factory UserInAppNotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$UserInAppNotificationSettingFromJson(json);
}
