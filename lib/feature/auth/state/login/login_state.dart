import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/fields/fields.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState({
    @Default(UsernameField.pure()) UsernameField usernameField,
    @Default(PasswordField.pure()) PasswordField passwordField,
    @Default('') String message,
    @Default(false) bool haveStore,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _LoginState;

  FormzStatus get status {
    return Formz.validate([passwordField, usernameField]);
  }
}
