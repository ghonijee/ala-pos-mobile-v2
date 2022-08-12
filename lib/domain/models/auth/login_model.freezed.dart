// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  @JsonKey(name: 'personal_access_token')
  String get personalAccessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserModel get userModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'personal_access_token') String personalAccessToken,
      @JsonKey(name: 'user') UserModel userModel});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res> implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

  final LoginModel _value;
  // ignore: unused_field
  final $Res Function(LoginModel) _then;

  @override
  $Res call({
    Object? personalAccessToken = freezed,
    Object? userModel = freezed,
  }) {
    return _then(_value.copyWith(
      personalAccessToken: personalAccessToken == freezed
          ? _value.personalAccessToken
          : personalAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
      userModel: userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginModelCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$_LoginModelCopyWith(
          _$_LoginModel value, $Res Function(_$_LoginModel) then) =
      __$$_LoginModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'personal_access_token') String personalAccessToken,
      @JsonKey(name: 'user') UserModel userModel});
}

/// @nodoc
class __$$_LoginModelCopyWithImpl<$Res> extends _$LoginModelCopyWithImpl<$Res>
    implements _$$_LoginModelCopyWith<$Res> {
  __$$_LoginModelCopyWithImpl(
      _$_LoginModel _value, $Res Function(_$_LoginModel) _then)
      : super(_value, (v) => _then(v as _$_LoginModel));

  @override
  _$_LoginModel get _value => super._value as _$_LoginModel;

  @override
  $Res call({
    Object? personalAccessToken = freezed,
    Object? userModel = freezed,
  }) {
    return _then(_$_LoginModel(
      personalAccessToken: personalAccessToken == freezed
          ? _value.personalAccessToken
          : personalAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
      userModel: userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginModel implements _LoginModel {
  _$_LoginModel(
      {@JsonKey(name: 'personal_access_token')
          required this.personalAccessToken,
      @JsonKey(name: 'user')
          required this.userModel});

  factory _$_LoginModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginModelFromJson(json);

  @override
  @JsonKey(name: 'personal_access_token')
  final String personalAccessToken;
  @override
  @JsonKey(name: 'user')
  final UserModel userModel;

  @override
  String toString() {
    return 'LoginModel(personalAccessToken: $personalAccessToken, userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginModel &&
            const DeepCollectionEquality()
                .equals(other.personalAccessToken, personalAccessToken) &&
            const DeepCollectionEquality().equals(other.userModel, userModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(personalAccessToken),
      const DeepCollectionEquality().hash(userModel));

  @JsonKey(ignore: true)
  @override
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      __$$_LoginModelCopyWithImpl<_$_LoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginModelToJson(
      this,
    );
  }
}

abstract class _LoginModel implements LoginModel {
  factory _LoginModel(
      {@JsonKey(name: 'personal_access_token')
          required final String personalAccessToken,
      @JsonKey(name: 'user')
          required final UserModel userModel}) = _$_LoginModel;

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$_LoginModel.fromJson;

  @override
  @JsonKey(name: 'personal_access_token')
  String get personalAccessToken;
  @override
  @JsonKey(name: 'user')
  UserModel get userModel;
  @override
  @JsonKey(ignore: true)
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}
