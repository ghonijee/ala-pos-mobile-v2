import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'fullname') required String fullname,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'is_member') bool? isMember,
    @JsonKey(name: 'user_status') DateTime? userStatus,
    @JsonKey(name: 'expired_date') DateTime? expiredDate,
    @JsonKey(name: 'referal_code') DateTime? referalCode,
    @JsonKey(name: 'img_profile_path') String? imgProfilePath,
    @JsonKey(name: 'img_profile_url') String? imgProfileUrl,
    @JsonKey(name: 'device_name') String? deviceName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
