// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      isMember: json['is_member'] as bool?,
      userStatus: json['user_status'] == null
          ? null
          : DateTime.parse(json['user_status'] as String),
      expiredDate: json['expired_date'] == null
          ? null
          : DateTime.parse(json['expired_date'] as String),
      referalCode: json['referal_code'] == null
          ? null
          : DateTime.parse(json['referal_code'] as String),
      imgProfilePath: json['img_profile_path'] as String?,
      imgProfileUrl: json['img_profile_url'] as String?,
      deviceName: json['device_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'phone': instance.phone,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'is_member': instance.isMember,
      'user_status': instance.userStatus?.toIso8601String(),
      'expired_date': instance.expiredDate?.toIso8601String(),
      'referal_code': instance.referalCode?.toIso8601String(),
      'img_profile_path': instance.imgProfilePath,
      'img_profile_url': instance.imgProfileUrl,
      'device_name': instance.deviceName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
