// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

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
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {UsernameField usernameField,
      PasswordField passwordField,
      String message,
      bool haveStore,
      FormzStatus statusSubmission});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? passwordField = freezed,
    Object? message = freezed,
    Object? haveStore = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_value.copyWith(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      passwordField: passwordField == freezed
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      haveStore: haveStore == freezed
          ? _value.haveStore
          : haveStore // ignore: cast_nullable_to_non_nullable
              as bool,
      statusSubmission: statusSubmission == freezed
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UsernameField usernameField,
      PasswordField passwordField,
      String message,
      bool haveStore,
      FormzStatus statusSubmission});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, (v) => _then(v as _$_LoginState));

  @override
  _$_LoginState get _value => super._value as _$_LoginState;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? passwordField = freezed,
    Object? message = freezed,
    Object? haveStore = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_$_LoginState(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      passwordField: passwordField == freezed
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      haveStore: haveStore == freezed
          ? _value.haveStore
          : haveStore // ignore: cast_nullable_to_non_nullable
              as bool,
      statusSubmission: statusSubmission == freezed
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
            const DeepCollectionEquality()
                .equals(other.usernameField, usernameField) &&
            const DeepCollectionEquality()
                .equals(other.passwordField, passwordField) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.haveStore, haveStore) &&
            const DeepCollectionEquality()
                .equals(other.statusSubmission, statusSubmission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(usernameField),
      const DeepCollectionEquality().hash(passwordField),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(haveStore),
      const DeepCollectionEquality().hash(statusSubmission));

  @JsonKey(ignore: true)
  @override
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
  UsernameField get usernameField => throw _privateConstructorUsedError;
  @override
  PasswordField get passwordField => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  bool get haveStore => throw _privateConstructorUsedError;
  @override
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
