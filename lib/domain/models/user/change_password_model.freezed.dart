// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'change_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) {
  return _ChangePasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "new_password")
  String get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "new_password_confirm")
  String get newPasswordConfirm => throw _privateConstructorUsedError;
  @JsonKey(name: "old_password")
  String get oldPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordModelCopyWith<ChangePasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordModelCopyWith<$Res> {
  factory $ChangePasswordModelCopyWith(
          ChangePasswordModel value, $Res Function(ChangePasswordModel) then) =
      _$ChangePasswordModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "new_password") String newPassword,
      @JsonKey(name: "new_password_confirm") String newPasswordConfirm,
      @JsonKey(name: "old_password") String oldPassword});
}

/// @nodoc
class _$ChangePasswordModelCopyWithImpl<$Res>
    implements $ChangePasswordModelCopyWith<$Res> {
  _$ChangePasswordModelCopyWithImpl(this._value, this._then);

  final ChangePasswordModel _value;
  // ignore: unused_field
  final $Res Function(ChangePasswordModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ChangePasswordModelCopyWith<$Res>
    implements $ChangePasswordModelCopyWith<$Res> {
  factory _$$_ChangePasswordModelCopyWith(_$_ChangePasswordModel value,
          $Res Function(_$_ChangePasswordModel) then) =
      __$$_ChangePasswordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "new_password") String newPassword,
      @JsonKey(name: "new_password_confirm") String newPasswordConfirm,
      @JsonKey(name: "old_password") String oldPassword});
}

/// @nodoc
class __$$_ChangePasswordModelCopyWithImpl<$Res>
    extends _$ChangePasswordModelCopyWithImpl<$Res>
    implements _$$_ChangePasswordModelCopyWith<$Res> {
  __$$_ChangePasswordModelCopyWithImpl(_$_ChangePasswordModel _value,
      $Res Function(_$_ChangePasswordModel) _then)
      : super(_value, (v) => _then(v as _$_ChangePasswordModel));

  @override
  _$_ChangePasswordModel get _value => super._value as _$_ChangePasswordModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirm = freezed,
    Object? oldPassword = freezed,
  }) {
    return _then(_$_ChangePasswordModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangePasswordModel implements _ChangePasswordModel {
  _$_ChangePasswordModel(
      {required this.id,
      @JsonKey(name: "new_password") required this.newPassword,
      @JsonKey(name: "new_password_confirm") required this.newPasswordConfirm,
      @JsonKey(name: "old_password") required this.oldPassword});

  factory _$_ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChangePasswordModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "new_password")
  final String newPassword;
  @override
  @JsonKey(name: "new_password_confirm")
  final String newPasswordConfirm;
  @override
  @JsonKey(name: "old_password")
  final String oldPassword;

  @override
  String toString() {
    return 'ChangePasswordModel(id: $id, newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm, oldPassword: $oldPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPasswordConfirm, newPasswordConfirm) &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(newPasswordConfirm),
      const DeepCollectionEquality().hash(oldPassword));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePasswordModelCopyWith<_$_ChangePasswordModel> get copyWith =>
      __$$_ChangePasswordModelCopyWithImpl<_$_ChangePasswordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangePasswordModelToJson(
      this,
    );
  }
}

abstract class _ChangePasswordModel implements ChangePasswordModel {
  factory _ChangePasswordModel(
      {required final int id,
      @JsonKey(name: "new_password")
          required final String newPassword,
      @JsonKey(name: "new_password_confirm")
          required final String newPasswordConfirm,
      @JsonKey(name: "old_password")
          required final String oldPassword}) = _$_ChangePasswordModel;

  factory _ChangePasswordModel.fromJson(Map<String, dynamic> json) =
      _$_ChangePasswordModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "new_password")
  String get newPassword;
  @override
  @JsonKey(name: "new_password_confirm")
  String get newPasswordConfirm;
  @override
  @JsonKey(name: "old_password")
  String get oldPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordModelCopyWith<_$_ChangePasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
