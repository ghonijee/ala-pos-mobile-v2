import 'package:ala_pos/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    @JsonKey(name: 'personal_access_token') required String personalAccessToken,
    @JsonKey(name: 'user') required UserModel userModel,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}
