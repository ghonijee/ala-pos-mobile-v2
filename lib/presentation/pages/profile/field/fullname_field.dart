import 'package:formz/formz.dart';

enum FullnameValidationError {
  empty('Fullname tidak boleh kosong');

  final String message;

  const FullnameValidationError(this.message);
}

class FullnameField extends FormzInput<String, FullnameValidationError> {
  // Call super.pure to represent an unmodified form input.
  const FullnameField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const FullnameField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  FullnameValidationError? validator(String value) {
    return value.isEmpty ? FullnameValidationError.empty : null;
  }
}
