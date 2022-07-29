// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangePasswordModel _$$_ChangePasswordModelFromJson(
        Map<String, dynamic> json) =>
    _$_ChangePasswordModel(
      id: json['id'] as int,
      newPassword: json['new_password'] as String,
      newPasswordConfirm: json['new_password_confirm'] as String,
      oldPassword: json['old_password'] as String,
    );

Map<String, dynamic> _$$_ChangePasswordModelToJson(
        _$_ChangePasswordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'new_password': instance.newPassword,
      'new_password_confirm': instance.newPasswordConfirm,
      'old_password': instance.oldPassword,
    };
