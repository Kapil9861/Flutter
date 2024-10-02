// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get success => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get resetPasswordExpiration => throw _privateConstructorUsedError;
  ProfileModel? get profiles => throw _privateConstructorUsedError;
  UserNotificationSetting? get userNotificationSetting =>
      throw _privateConstructorUsedError;
  UserInAppNotificationSetting? get userInAppNotificationSetting =>
      throw _privateConstructorUsedError;
  UserSettings? get userSettings => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? success,
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
      String? sessionId});

  $ProfileModelCopyWith<$Res>? get profiles;
  $UserNotificationSettingCopyWith<$Res>? get userNotificationSetting;
  $UserInAppNotificationSettingCopyWith<$Res>? get userInAppNotificationSetting;
  $UserSettingsCopyWith<$Res>? get userSettings;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? fullname = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isDeleted = freezed,
    Object? resetPasswordExpiration = freezed,
    Object? profiles = freezed,
    Object? userNotificationSetting = freezed,
    Object? userInAppNotificationSetting = freezed,
    Object? userSettings = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      resetPasswordExpiration: freezed == resetPasswordExpiration
          ? _value.resetPasswordExpiration
          : resetPasswordExpiration // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: freezed == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      userNotificationSetting: freezed == userNotificationSetting
          ? _value.userNotificationSetting
          : userNotificationSetting // ignore: cast_nullable_to_non_nullable
              as UserNotificationSetting?,
      userInAppNotificationSetting: freezed == userInAppNotificationSetting
          ? _value.userInAppNotificationSetting
          : userInAppNotificationSetting // ignore: cast_nullable_to_non_nullable
              as UserInAppNotificationSetting?,
      userSettings: freezed == userSettings
          ? _value.userSettings
          : userSettings // ignore: cast_nullable_to_non_nullable
              as UserSettings?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get profiles {
    if (_value.profiles == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.profiles!, (value) {
      return _then(_value.copyWith(profiles: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserNotificationSettingCopyWith<$Res>? get userNotificationSetting {
    if (_value.userNotificationSetting == null) {
      return null;
    }

    return $UserNotificationSettingCopyWith<$Res>(
        _value.userNotificationSetting!, (value) {
      return _then(_value.copyWith(userNotificationSetting: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInAppNotificationSettingCopyWith<$Res>?
      get userInAppNotificationSetting {
    if (_value.userInAppNotificationSetting == null) {
      return null;
    }

    return $UserInAppNotificationSettingCopyWith<$Res>(
        _value.userInAppNotificationSetting!, (value) {
      return _then(
          _value.copyWith(userInAppNotificationSetting: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res>? get userSettings {
    if (_value.userSettings == null) {
      return null;
    }

    return $UserSettingsCopyWith<$Res>(_value.userSettings!, (value) {
      return _then(_value.copyWith(userSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? success,
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
      String? sessionId});

  @override
  $ProfileModelCopyWith<$Res>? get profiles;
  @override
  $UserNotificationSettingCopyWith<$Res>? get userNotificationSetting;
  @override
  $UserInAppNotificationSettingCopyWith<$Res>? get userInAppNotificationSetting;
  @override
  $UserSettingsCopyWith<$Res>? get userSettings;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? fullname = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isDeleted = freezed,
    Object? resetPasswordExpiration = freezed,
    Object? profiles = freezed,
    Object? userNotificationSetting = freezed,
    Object? userInAppNotificationSetting = freezed,
    Object? userSettings = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_$UserModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      resetPasswordExpiration: freezed == resetPasswordExpiration
          ? _value.resetPasswordExpiration
          : resetPasswordExpiration // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: freezed == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      userNotificationSetting: freezed == userNotificationSetting
          ? _value.userNotificationSetting
          : userNotificationSetting // ignore: cast_nullable_to_non_nullable
              as UserNotificationSetting?,
      userInAppNotificationSetting: freezed == userInAppNotificationSetting
          ? _value.userInAppNotificationSetting
          : userInAppNotificationSetting // ignore: cast_nullable_to_non_nullable
              as UserInAppNotificationSetting?,
      userSettings: freezed == userSettings
          ? _value.userSettings
          : userSettings // ignore: cast_nullable_to_non_nullable
              as UserSettings?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.success,
      this.fullname,
      this.username,
      this.email,
      this.phoneNumber,
      this.isDeleted,
      this.resetPasswordExpiration,
      this.profiles,
      this.userNotificationSetting,
      this.userInAppNotificationSetting,
      this.userSettings,
      this.sessionId});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? success;
  @override
  final String? fullname;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final bool? isDeleted;
  @override
  final String? resetPasswordExpiration;
  @override
  final ProfileModel? profiles;
  @override
  final UserNotificationSetting? userNotificationSetting;
  @override
  final UserInAppNotificationSetting? userInAppNotificationSetting;
  @override
  final UserSettings? userSettings;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'UserModel(success: $success, fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, isDeleted: $isDeleted, resetPasswordExpiration: $resetPasswordExpiration, profiles: $profiles, userNotificationSetting: $userNotificationSetting, userInAppNotificationSetting: $userInAppNotificationSetting, userSettings: $userSettings, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(
                    other.resetPasswordExpiration, resetPasswordExpiration) ||
                other.resetPasswordExpiration == resetPasswordExpiration) &&
            (identical(other.profiles, profiles) ||
                other.profiles == profiles) &&
            (identical(
                    other.userNotificationSetting, userNotificationSetting) ||
                other.userNotificationSetting == userNotificationSetting) &&
            (identical(other.userInAppNotificationSetting,
                    userInAppNotificationSetting) ||
                other.userInAppNotificationSetting ==
                    userInAppNotificationSetting) &&
            (identical(other.userSettings, userSettings) ||
                other.userSettings == userSettings) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      fullname,
      username,
      email,
      phoneNumber,
      isDeleted,
      resetPasswordExpiration,
      profiles,
      userNotificationSetting,
      userInAppNotificationSetting,
      userSettings,
      sessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? success,
      final String? fullname,
      final String? username,
      final String? email,
      final String? phoneNumber,
      final bool? isDeleted,
      final String? resetPasswordExpiration,
      final ProfileModel? profiles,
      final UserNotificationSetting? userNotificationSetting,
      final UserInAppNotificationSetting? userInAppNotificationSetting,
      final UserSettings? userSettings,
      final String? sessionId}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get success;
  @override
  String? get fullname;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  bool? get isDeleted;
  @override
  String? get resetPasswordExpiration;
  @override
  ProfileModel? get profiles;
  @override
  UserNotificationSetting? get userNotificationSetting;
  @override
  UserInAppNotificationSetting? get userInAppNotificationSetting;
  @override
  UserSettings? get userSettings;
  @override
  String? get sessionId;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
