// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  UsernameField get usernameField => throw _privateConstructorUsedError;
  PhoneField get phoneField => throw _privateConstructorUsedError;
  PasswordField get passwordField => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {UsernameField usernameField,
      PhoneField phoneField,
      PasswordField passwordField,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? phoneField = freezed,
    Object? passwordField = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_value.copyWith(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      phoneField: phoneField == freezed
          ? _value.phoneField
          : phoneField // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      passwordField: passwordField == freezed
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusSubmission: statusSubmission == freezed
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UsernameField usernameField,
      PhoneField phoneField,
      PasswordField passwordField,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, (v) => _then(v as _$_RegisterState));

  @override
  _$_RegisterState get _value => super._value as _$_RegisterState;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? phoneField = freezed,
    Object? passwordField = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_$_RegisterState(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      phoneField: phoneField == freezed
          ? _value.phoneField
          : phoneField // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      passwordField: passwordField == freezed
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusSubmission: statusSubmission == freezed
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_RegisterState extends _RegisterState {
  const _$_RegisterState(
      {this.usernameField = const UsernameField.pure(),
      this.phoneField = const PhoneField.pure(),
      this.passwordField = const PasswordField.pure(),
      this.message = '',
      this.statusSubmission = FormzStatus.pure})
      : super._();

  @override
  @JsonKey()
  final UsernameField usernameField;
  @override
  @JsonKey()
  final PhoneField phoneField;
  @override
  @JsonKey()
  final PasswordField passwordField;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final FormzStatus statusSubmission;

  @override
  String toString() {
    return 'RegisterState(usernameField: $usernameField, phoneField: $phoneField, passwordField: $passwordField, message: $message, statusSubmission: $statusSubmission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            const DeepCollectionEquality()
                .equals(other.usernameField, usernameField) &&
            const DeepCollectionEquality()
                .equals(other.phoneField, phoneField) &&
            const DeepCollectionEquality()
                .equals(other.passwordField, passwordField) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.statusSubmission, statusSubmission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(usernameField),
      const DeepCollectionEquality().hash(phoneField),
      const DeepCollectionEquality().hash(passwordField),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(statusSubmission));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  const factory _RegisterState(
      {final UsernameField usernameField,
      final PhoneField phoneField,
      final PasswordField passwordField,
      final String message,
      final FormzStatus statusSubmission}) = _$_RegisterState;
  const _RegisterState._() : super._();

  @override
  UsernameField get usernameField;
  @override
  PhoneField get phoneField;
  @override
  PasswordField get passwordField;
  @override
  String get message;
  @override
  FormzStatus get statusSubmission;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
