// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  UsernameField get usernameField => throw _privateConstructorUsedError;
  PasswordField get passwordField => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get haveStore => throw _privateConstructorUsedError;
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {UsernameField usernameField,
      PasswordField passwordField,
      String message,
      bool haveStore,
      FormzStatus statusSubmission});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameField = null,
    Object? passwordField = null,
    Object? message = null,
    Object? haveStore = null,
    Object? statusSubmission = null,
  }) {
    return _then(_value.copyWith(
      usernameField: null == usernameField
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      haveStore: null == haveStore
          ? _value.haveStore
          : haveStore // ignore: cast_nullable_to_non_nullable
              as bool,
      statusSubmission: null == statusSubmission
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsernameField usernameField,
      PasswordField passwordField,
      String message,
      bool haveStore,
      FormzStatus statusSubmission});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameField = null,
    Object? passwordField = null,
    Object? message = null,
    Object? haveStore = null,
    Object? statusSubmission = null,
  }) {
    return _then(_$_LoginState(
      usernameField: null == usernameField
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      haveStore: null == haveStore
          ? _value.haveStore
          : haveStore // ignore: cast_nullable_to_non_nullable
              as bool,
      statusSubmission: null == statusSubmission
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_LoginState extends _LoginState {
  const _$_LoginState(
      {this.usernameField = const UsernameField.pure(),
      this.passwordField = const PasswordField.pure(),
      this.message = '',
      this.haveStore = false,
      this.statusSubmission = FormzStatus.pure})
      : super._();

  @override
  @JsonKey()
  final UsernameField usernameField;
  @override
  @JsonKey()
  final PasswordField passwordField;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool haveStore;
  @override
  @JsonKey()
  final FormzStatus statusSubmission;

  @override
  String toString() {
    return 'LoginState(usernameField: $usernameField, passwordField: $passwordField, message: $message, haveStore: $haveStore, statusSubmission: $statusSubmission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.usernameField, usernameField) ||
                other.usernameField == usernameField) &&
            (identical(other.passwordField, passwordField) ||
                other.passwordField == passwordField) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.haveStore, haveStore) ||
                other.haveStore == haveStore) &&
            (identical(other.statusSubmission, statusSubmission) ||
                other.statusSubmission == statusSubmission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameField, passwordField,
      message, haveStore, statusSubmission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState(
      {final UsernameField usernameField,
      final PasswordField passwordField,
      final String message,
      final bool haveStore,
      final FormzStatus statusSubmission}) = _$_LoginState;
  const _LoginState._() : super._();

  @override
  UsernameField get usernameField;
  @override
  PasswordField get passwordField;
  @override
  String get message;
  @override
  bool get haveStore;
  @override
  FormzStatus get statusSubmission;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
