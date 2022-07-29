import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.freezed.dart';
part 'change_password_model.g.dart';

@freezed
class ChangePasswordModel with _$ChangePasswordModel {
  factory ChangePasswordModel({
    required int id,
    @JsonKey(name: "new_password") required String newPassword,
    @JsonKey(name: "new_password_confirm") required String newPasswordConfirm,
    @JsonKey(name: "old_password") required String oldPassword,
  }) = _ChangePasswordModel;

  factory ChangePasswordModel.fromJson(json) => _$ChangePasswordModelFromJson(json);
}
