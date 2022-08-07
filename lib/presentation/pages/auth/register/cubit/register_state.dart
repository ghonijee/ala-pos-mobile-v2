part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    @Default(UsernameField.pure()) UsernameField usernameField,
    @Default(PhoneField.pure()) PhoneField phoneField,
    @Default(PasswordField.pure()) PasswordField passwordField,
    @Default('') String message,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _RegisterState;

  FormzStatus get status {
    return Formz.validate([passwordField, usernameField, phoneField]);
  }
}
