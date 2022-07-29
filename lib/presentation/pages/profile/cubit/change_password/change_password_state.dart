part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const ChangePasswordState._();

  const factory ChangePasswordState({
    @Default(PasswordField.pure()) PasswordField newPassword,
    @Default(PasswordField.pure()) PasswordField newPasswordConfirm,
    @Default(PasswordField.pure()) PasswordField oldPassword,
  }) = _ChangePasswordState;

  FormzStatus get status {
    return Formz.validate([
      newPassword,
      newPasswordConfirm,
      oldPassword,
    ]);
  }

  ChangePasswordModel toModel() => ChangePasswordModel(
        newPassword: newPassword.value,
        oldPassword: oldPassword.value,
        newPasswordConfirm: newPasswordConfirm.value,
      );
}
