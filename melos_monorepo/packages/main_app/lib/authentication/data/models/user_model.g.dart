// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      success: json['success'] as String?,
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      resetPasswordExpiration: json['resetPasswordExpiration'] as String?,
      profiles: json['profiles'] == null
          ? null
          : ProfileModel.fromJson(json['profiles'] as Map<String, dynamic>),
      userNotificationSetting: json['userNotificationSetting'] == null
          ? null
          : UserNotificationSetting.fromJson(
              json['userNotificationSetting'] as Map<String, dynamic>),
      userInAppNotificationSetting: json['userInAppNotificationSetting'] == null
          ? null
          : UserInAppNotificationSetting.fromJson(
              json['userInAppNotificationSetting'] as Map<String, dynamic>),
      userSettings: json['userSettings'] == null
          ? null
          : UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isDeleted': instance.isDeleted,
      'resetPasswordExpiration': instance.resetPasswordExpiration,
      'profiles': instance.profiles,
      'userNotificationSetting': instance.userNotificationSetting,
      'userInAppNotificationSetting': instance.userInAppNotificationSetting,
      'userSettings': instance.userSettings,
      'sessionId': instance.sessionId,
    };
