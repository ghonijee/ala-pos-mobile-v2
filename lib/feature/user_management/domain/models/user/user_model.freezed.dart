// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullname')
  String get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_member')
  bool? get isMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_status')
  String? get userStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'referal_code')
  String? get referalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'img_profile_path')
  String? get imgProfilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'img_profile_url')
  String? get imgProfileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_name')
  String? get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'fullname') String fullname,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'is_member') bool? isMember,
      @JsonKey(name: 'user_status') String? userStatus,
      @JsonKey(name: 'expired_date') DateTime? expiredDate,
      @JsonKey(name: 'referal_code') String? referalCode,
      @JsonKey(name: 'img_profile_path') String? imgProfilePath,
      @JsonKey(name: 'img_profile_url') String? imgProfileUrl,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
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
    Object? id = null,
    Object? fullname = null,
    Object? username = null,
    Object? phone = null,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isMember = freezed,
    Object? userStatus = freezed,
    Object? expiredDate = freezed,
    Object? referalCode = freezed,
    Object? imgProfilePath = freezed,
    Object? imgProfileUrl = freezed,
    Object? deviceName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isMember: freezed == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProfilePath: freezed == imgProfilePath
          ? _value.imgProfilePath
          : imgProfilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProfileUrl: freezed == imgProfileUrl
          ? _value.imgProfileUrl
          : imgProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'fullname') String fullname,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'is_member') bool? isMember,
      @JsonKey(name: 'user_status') String? userStatus,
      @JsonKey(name: 'expired_date') DateTime? expiredDate,
      @JsonKey(name: 'referal_code') String? referalCode,
      @JsonKey(name: 'img_profile_path') String? imgProfilePath,
      @JsonKey(name: 'img_profile_url') String? imgProfileUrl,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? username = null,
    Object? phone = null,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isMember = freezed,
    Object? userStatus = freezed,
    Object? expiredDate = freezed,
    Object? referalCode = freezed,
    Object? imgProfilePath = freezed,
    Object? imgProfileUrl = freezed,
    Object? deviceName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isMember: freezed == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProfilePath: freezed == imgProfilePath
          ? _value.imgProfilePath
          : imgProfilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imgProfileUrl: freezed == imgProfileUrl
          ? _value.imgProfileUrl
          : imgProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'fullname') required this.fullname,
      @JsonKey(name: 'username') required this.username,
      @JsonKey(name: 'phone') required this.phone,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'is_member') this.isMember,
      @JsonKey(name: 'user_status') this.userStatus,
      @JsonKey(name: 'expired_date') this.expiredDate,
      @JsonKey(name: 'referal_code') this.referalCode,
      @JsonKey(name: 'img_profile_path') this.imgProfilePath,
      @JsonKey(name: 'img_profile_url') this.imgProfileUrl,
      @JsonKey(name: 'device_name') this.deviceName,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'fullname')
  final String fullname;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'is_member')
  final bool? isMember;
  @override
  @JsonKey(name: 'user_status')
  final String? userStatus;
  @override
  @JsonKey(name: 'expired_date')
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'referal_code')
  final String? referalCode;
  @override
  @JsonKey(name: 'img_profile_path')
  final String? imgProfilePath;
  @override
  @JsonKey(name: 'img_profile_url')
  final String? imgProfileUrl;
  @override
  @JsonKey(name: 'device_name')
  final String? deviceName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, fullname: $fullname, username: $username, phone: $phone, email: $email, emailVerifiedAt: $emailVerifiedAt, isMember: $isMember, userStatus: $userStatus, expiredDate: $expiredDate, referalCode: $referalCode, imgProfilePath: $imgProfilePath, imgProfileUrl: $imgProfileUrl, deviceName: $deviceName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.isMember, isMember) ||
                other.isMember == isMember) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.referalCode, referalCode) ||
                other.referalCode == referalCode) &&
            (identical(other.imgProfilePath, imgProfilePath) ||
                other.imgProfilePath == imgProfilePath) &&
            (identical(other.imgProfileUrl, imgProfileUrl) ||
                other.imgProfileUrl == imgProfileUrl) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullname,
      username,
      phone,
      email,
      emailVerifiedAt,
      isMember,
      userStatus,
      expiredDate,
      referalCode,
      imgProfilePath,
      imgProfileUrl,
      deviceName,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'fullname') required final String fullname,
      @JsonKey(name: 'username') required final String username,
      @JsonKey(name: 'phone') required final String phone,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'is_member') final bool? isMember,
      @JsonKey(name: 'user_status') final String? userStatus,
      @JsonKey(name: 'expired_date') final DateTime? expiredDate,
      @JsonKey(name: 'referal_code') final String? referalCode,
      @JsonKey(name: 'img_profile_path') final String? imgProfilePath,
      @JsonKey(name: 'img_profile_url') final String? imgProfileUrl,
      @JsonKey(name: 'device_name') final String? deviceName,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'fullname')
  String get fullname;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'is_member')
  bool? get isMember;
  @override
  @JsonKey(name: 'user_status')
  String? get userStatus;
  @override
  @JsonKey(name: 'expired_date')
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'referal_code')
  String? get referalCode;
  @override
  @JsonKey(name: 'img_profile_path')
  String? get imgProfilePath;
  @override
  @JsonKey(name: 'img_profile_url')
  String? get imgProfileUrl;
  @override
  @JsonKey(name: 'device_name')
  String? get deviceName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
