import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  factory SignUpModel({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'phone') required String phone,
  }) = _SignUpModel;
}
