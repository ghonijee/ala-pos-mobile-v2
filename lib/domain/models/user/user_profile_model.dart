import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "fullname") required String fullname,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phone") required String phone,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(json) => _$UserProfileModelFromJson(json);
}
