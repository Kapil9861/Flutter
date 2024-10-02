import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_notification_setting.freezed.dart';
part 'user_notification_setting.g.dart';

@freezed
class UserNotificationSetting with _$UserNotificationSetting {
  const factory UserNotificationSetting({
    String? id,
    String? userId,
    String? createdAt,
    String? updatedAt,
    bool? isPrivateChatMute,
    bool? isGroupChatMute,
    bool? isChannelMute,
    bool? isChatFolderMute,
    bool? showPreview,
  }) = _UserInAppNotificationSetting;

  factory UserNotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationSettingFromJson(json);
}
