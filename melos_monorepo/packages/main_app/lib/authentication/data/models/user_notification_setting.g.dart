// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInAppNotificationSettingImpl _$$UserInAppNotificationSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInAppNotificationSettingImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isPrivateChatMute: json['isPrivateChatMute'] as bool?,
      isGroupChatMute: json['isGroupChatMute'] as bool?,
      isChannelMute: json['isChannelMute'] as bool?,
      isChatFolderMute: json['isChatFolderMute'] as bool?,
      showPreview: json['showPreview'] as bool?,
    );

Map<String, dynamic> _$$UserInAppNotificationSettingImplToJson(
        _$UserInAppNotificationSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isPrivateChatMute': instance.isPrivateChatMute,
      'isGroupChatMute': instance.isGroupChatMute,
      'isChannelMute': instance.isChannelMute,
      'isChatFolderMute': instance.isChatFolderMute,
      'showPreview': instance.showPreview,
    };
