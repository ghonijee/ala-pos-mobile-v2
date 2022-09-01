import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty('Username tidak boleh kosong');

  final String message;

  const UsernameValidationError(this.message);
}

class UsernameField extends FormzInput<String?, UsernameValidationError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameField.dirty([String? value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameValidationError? validator(String? value) {
    return value == null || value.isEmpty ? UsernameValidationError.empty : null;
  }
}
