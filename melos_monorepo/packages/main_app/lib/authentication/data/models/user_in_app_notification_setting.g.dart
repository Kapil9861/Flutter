// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_in_app_notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInAppNotificationSettingImpl _$$UserInAppNotificationSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInAppNotificationSettingImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      sound: json['sound'] as bool?,
      vibration: json['vibration'] as bool?,
      ringtone: json['ringtone'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$UserInAppNotificationSettingImplToJson(
        _$UserInAppNotificationSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sound': instance.sound,
      'vibration': instance.vibration,
      'ringtone': instance.ringtone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
