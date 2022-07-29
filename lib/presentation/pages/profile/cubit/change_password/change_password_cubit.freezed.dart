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
  PasswordField get newPassword => throw _privateConstructorUsedError;
  PasswordField get newPasswordConfirm => throw _privateConstructorUsedError;
  PasswordField get oldPassword => throw _privateConstructorUsedError;

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
      {PasswordField newPassword,
      PasswordField newPasswordConfirm,
      PasswordField oldPassword});
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
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
  }) {
    return _then(_value.copyWith(
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
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
      {PasswordField newPassword,
      PasswordField newPasswordConfirm,
      PasswordField oldPassword});
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
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
  }) {
    return _then(_$_ChangePasswordState(
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as PasswordField,
    ));
  }
}

/// @nodoc

class _$_ChangePasswordState extends _ChangePasswordState {
  const _$_ChangePasswordState(
      {this.newPassword = const PasswordField.pure(),
      this.newPasswordConfirm = const PasswordField.pure(),
      this.oldPassword = const PasswordField.pure()})
      : super._();

  @override
  @JsonKey()
  final PasswordField newPassword;
  @override
  @JsonKey()
  final PasswordField newPasswordConfirm;
  @override
  @JsonKey()
  final PasswordField oldPassword;

  @override
  String toString() {
    return 'ChangePasswordState(newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm, oldPassword: $oldPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordState &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPasswordConfirm, newPasswordConfirm) &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(newPasswordConfirm),
      const DeepCollectionEquality().hash(oldPassword));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      __$$_ChangePasswordStateCopyWithImpl<_$_ChangePasswordState>(
          this, _$identity);
}

abstract class _ChangePasswordState extends ChangePasswordState {
  const factory _ChangePasswordState(
      {final PasswordField newPassword,
      final PasswordField newPasswordConfirm,
      final PasswordField oldPassword}) = _$_ChangePasswordState;
  const _ChangePasswordState._() : super._();

  @override
  PasswordField get newPassword => throw _privateConstructorUsedError;
  @override
  PasswordField get newPasswordConfirm => throw _privateConstructorUsedError;
  @override
  PasswordField get oldPassword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
