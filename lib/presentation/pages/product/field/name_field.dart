import 'package:formz/formz.dart';

enum NameValidationError {
  empty('Name can\'t be empty');

  final String message;

  const NameValidationError(this.message);
}

class NameField extends FormzInput<String, NameValidationError> {
  // Call super.pure to represent an unmodified form input.
  const NameField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NameValidationError? validator(String value) {
    return value.isEmpty ? NameValidationError.empty : null;
  }
}
