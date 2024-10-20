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
  String? get fullname => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get resetPasswordExpiration => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? fullname,
      String? username,
      String? email,
      String? phoneNumber,
      bool? isDeleted,
      String? resetPasswordExpiration,
      String? sessionId,
      String? rememberToken});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isDeleted = freezed,
    Object? resetPasswordExpiration = freezed,
    Object? sessionId = freezed,
    Object? rememberToken = freezed,
  }) {
    return _then(_value.copyWith(
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
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String? fullname,
      String? username,
      String? email,
      String? phoneNumber,
      bool? isDeleted,
      String? resetPasswordExpiration,
      String? sessionId,
      String? rememberToken});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isDeleted = freezed,
    Object? resetPasswordExpiration = freezed,
    Object? sessionId = freezed,
    Object? rememberToken = freezed,
  }) {
    return _then(_$UserModelImpl(
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
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.fullname,
      this.username,
      this.email,
      this.phoneNumber,
      this.isDeleted,
      this.resetPasswordExpiration,
      this.sessionId,
      this.rememberToken});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

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
  final String? sessionId;
  @override
  final String? rememberToken;

  @override
  String toString() {
    return 'UserModel(fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, isDeleted: $isDeleted, resetPasswordExpiration: $resetPasswordExpiration, sessionId: $sessionId, rememberToken: $rememberToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullname,
      username,
      email,
      phoneNumber,
      isDeleted,
      resetPasswordExpiration,
      sessionId,
      rememberToken);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {final String? fullname,
      final String? username,
      final String? email,
      final String? phoneNumber,
      final bool? isDeleted,
      final String? resetPasswordExpiration,
      final String? sessionId,
      final String? rememberToken}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

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
  String? get sessionId;
  @override
  String? get rememberToken;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
