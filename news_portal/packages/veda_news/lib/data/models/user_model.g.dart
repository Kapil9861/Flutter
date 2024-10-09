// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      resetPasswordExpiration: json['resetPasswordExpiration'] as String?,
      sessionId: json['sessionId'] as String?,
      rememberToken: json['rememberToken'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isDeleted': instance.isDeleted,
      'resetPasswordExpiration': instance.resetPasswordExpiration,
      'sessionId': instance.sessionId,
      'rememberToken': instance.rememberToken,
    };
