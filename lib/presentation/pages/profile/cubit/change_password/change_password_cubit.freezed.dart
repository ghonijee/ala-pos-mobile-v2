// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'change_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePasswordState {
  int? get id => throw _privateConstructorUsedError;
  PasswordField get newPassword => throw _privateConstructorUsedError;
  PasswordConfirmField get newPasswordConfirm =>
      throw _privateConstructorUsedError;
  PasswordField get oldPassword => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
          ChangePasswordState value, $Res Function(ChangePasswordState) then) =
      _$ChangePasswordStateCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      PasswordField newPassword,
      PasswordConfirmField newPasswordConfirm,
      PasswordField oldPassword,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  final ChangePasswordState _value;
  // ignore: unused_field
  final $Res Function(ChangePasswordState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmField,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ChangePasswordStateCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$_ChangePasswordStateCopyWith(_$_ChangePasswordState value,
          $Res Function(_$_ChangePasswordState) then) =
      __$$_ChangePasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      PasswordField newPassword,
      PasswordConfirmField newPasswordConfirm,
      PasswordField oldPassword,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class __$$_ChangePasswordStateCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res>
    implements _$$_ChangePasswordStateCopyWith<$Res> {
  __$$_ChangePasswordStateCopyWithImpl(_$_ChangePasswordState _value,
      $Res Function(_$_ChangePasswordState) _then)
      : super(_value, (v) => _then(v as _$_ChangePasswordState));

  @override
  _$_ChangePasswordState get _value => super._value as _$_ChangePasswordState;

  @override
  $Res call({
    Object? id = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_$_ChangePasswordState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmField,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
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

class _$_ChangePasswordState extends _ChangePasswordState {
  const _$_ChangePasswordState(
      {this.id,
      this.newPassword = const PasswordField.pure(),
      this.newPasswordConfirm = const PasswordConfirmField.pure(),
      this.oldPassword = const PasswordField.pure(),
      this.message = '',
      this.statusSubmission = FormzStatus.pure})
      : super._();

  @override
  final int? id;
  @override
  @JsonKey()
  final PasswordField newPassword;
  @override
  @JsonKey()
  final PasswordConfirmField newPasswordConfirm;
  @override
  @JsonKey()
  final PasswordField oldPassword;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final FormzStatus statusSubmission;

  @override
  String toString() {
    return 'ChangePasswordState(id: $id, newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm, oldPassword: $oldPassword, message: $message, statusSubmission: $statusSubmission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPasswordConfirm, newPasswordConfirm) &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.statusSubmission, statusSubmission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(newPasswordConfirm),
      const DeepCollectionEquality().hash(oldPassword),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(statusSubmission));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      __$$_ChangePasswordStateCopyWithImpl<_$_ChangePasswordState>(
          this, _$identity);
}

abstract class _ChangePasswordState extends ChangePasswordState {
  const factory _ChangePasswordState(
      {final int? id,
      final PasswordField newPassword,
      final PasswordConfirmField newPasswordConfirm,
      final PasswordField oldPassword,
      final String message,
      final FormzStatus statusSubmission}) = _$_ChangePasswordState;
  const _ChangePasswordState._() : super._();

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  PasswordField get newPassword => throw _privateConstructorUsedError;
  @override
  PasswordConfirmField get newPasswordConfirm =>
      throw _privateConstructorUsedError;
  @override
  PasswordField get oldPassword => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
