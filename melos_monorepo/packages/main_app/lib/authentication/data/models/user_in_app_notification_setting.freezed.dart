// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_in_app_notification_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInAppNotificationSetting _$UserInAppNotificationSettingFromJson(
    Map<String, dynamic> json) {
  return _UserInAppNotificationSetting.fromJson(json);
}

/// @nodoc
mixin _$UserInAppNotificationSetting {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  bool? get sound => throw _privateConstructorUsedError;
  bool? get vibration => throw _privateConstructorUsedError;
  String? get ringtone => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInAppNotificationSettingCopyWith<UserInAppNotificationSetting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInAppNotificationSettingCopyWith<$Res> {
  factory $UserInAppNotificationSettingCopyWith(
          UserInAppNotificationSetting value,
          $Res Function(UserInAppNotificationSetting) then) =
      _$UserInAppNotificationSettingCopyWithImpl<$Res,
          UserInAppNotificationSetting>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      bool? sound,
      bool? vibration,
      String? ringtone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$UserInAppNotificationSettingCopyWithImpl<$Res,
        $Val extends UserInAppNotificationSetting>
    implements $UserInAppNotificationSettingCopyWith<$Res> {
  _$UserInAppNotificationSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? sound = freezed,
    Object? vibration = freezed,
    Object? ringtone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as bool?,
      vibration: freezed == vibration
          ? _value.vibration
          : vibration // ignore: cast_nullable_to_non_nullable
              as bool?,
      ringtone: freezed == ringtone
          ? _value.ringtone
          : ringtone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInAppNotificationSettingImplCopyWith<$Res>
    implements $UserInAppNotificationSettingCopyWith<$Res> {
  factory _$$UserInAppNotificationSettingImplCopyWith(
          _$UserInAppNotificationSettingImpl value,
          $Res Function(_$UserInAppNotificationSettingImpl) then) =
      __$$UserInAppNotificationSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      bool? sound,
      bool? vibration,
      String? ringtone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$UserInAppNotificationSettingImplCopyWithImpl<$Res>
    extends _$UserInAppNotificationSettingCopyWithImpl<$Res,
        _$UserInAppNotificationSettingImpl>
    implements _$$UserInAppNotificationSettingImplCopyWith<$Res> {
  __$$UserInAppNotificationSettingImplCopyWithImpl(
      _$UserInAppNotificationSettingImpl _value,
      $Res Function(_$UserInAppNotificationSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? sound = freezed,
    Object? vibration = freezed,
    Object? ringtone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserInAppNotificationSettingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as bool?,
      vibration: freezed == vibration
          ? _value.vibration
          : vibration // ignore: cast_nullable_to_non_nullable
              as bool?,
      ringtone: freezed == ringtone
          ? _value.ringtone
          : ringtone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInAppNotificationSettingImpl
    implements _UserInAppNotificationSetting {
  const _$UserInAppNotificationSettingImpl(
      {this.id,
      this.userId,
      this.sound,
      this.vibration,
      this.ringtone,
      this.createdAt,
      this.updatedAt});

  factory _$UserInAppNotificationSettingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserInAppNotificationSettingImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final bool? sound;
  @override
  final bool? vibration;
  @override
  final String? ringtone;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'UserInAppNotificationSetting(id: $id, userId: $userId, sound: $sound, vibration: $vibration, ringtone: $ringtone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInAppNotificationSettingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.vibration, vibration) ||
                other.vibration == vibration) &&
            (identical(other.ringtone, ringtone) ||
                other.ringtone == ringtone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, sound, vibration,
      ringtone, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInAppNotificationSettingImplCopyWith<
          _$UserInAppNotificationSettingImpl>
      get copyWith => __$$UserInAppNotificationSettingImplCopyWithImpl<
          _$UserInAppNotificationSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInAppNotificationSettingImplToJson(
      this,
    );
  }
}

abstract class _UserInAppNotificationSetting
    implements UserInAppNotificationSetting {
  const factory _UserInAppNotificationSetting(
      {final String? id,
      final String? userId,
      final bool? sound,
      final bool? vibration,
      final String? ringtone,
      final String? createdAt,
      final String? updatedAt}) = _$UserInAppNotificationSettingImpl;

  factory _UserInAppNotificationSetting.fromJson(Map<String, dynamic> json) =
      _$UserInAppNotificationSettingImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  bool? get sound;
  @override
  bool? get vibration;
  @override
  String? get ringtone;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserInAppNotificationSettingImplCopyWith<
          _$UserInAppNotificationSettingImpl>
      get copyWith => throw _privateConstructorUsedError;
}
