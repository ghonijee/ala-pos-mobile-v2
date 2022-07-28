import 'package:formz/formz.dart';

enum EmailValidationError {
  empty('Email tidak boleh kosong');

  final String message;

  const EmailValidationError(this.message);
}

class EmailField extends FormzInput<String, EmailValidationError> {
  // Call super.pure to represent an unmodified form input.
  const EmailField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailValidationError? validator(String value) {
    return value.isEmpty ? EmailValidationError.empty : null;
  }
}
