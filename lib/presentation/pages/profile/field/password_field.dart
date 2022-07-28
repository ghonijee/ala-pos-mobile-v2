import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty('Password tidak boleh kosong');

  final String message;

  const PasswordValidationError(this.message);
}

class PasswordField extends FormzInput<String, PasswordValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordValidationError? validator(String value) {
    return value.isEmpty ? PasswordValidationError.empty : null;
  }
}
