part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const ChangePasswordState._();

  const factory ChangePasswordState({
    int? id,
    @Default(PasswordField.pure()) PasswordField newPassword,
    @Default(PasswordConfirmField.pure()) PasswordConfirmField newPasswordConfirm,
    @Default(PasswordField.pure()) PasswordField oldPassword,
    @Default('') String message,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _ChangePasswordState;

  FormzStatus get status {
    return Formz.validate([
      newPassword,
      newPasswordConfirm,
      oldPassword,
    ]);
  }

  ChangePasswordModel toModel() => ChangePasswordModel(
        id: id!,
        newPassword: newPassword.value,
        oldPassword: oldPassword.value,
        newPasswordConfirm: newPasswordConfirm.value,
      );
}
