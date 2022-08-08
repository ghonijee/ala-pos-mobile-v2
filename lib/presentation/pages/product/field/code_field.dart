import 'package:formz/formz.dart';

enum CodeValidationError {
  empty('Code can\'t be empty');

  final String message;

  const CodeValidationError(this.message);
}

class CodeField extends FormzInput<String?, dynamic> {
  // Call super.pure to represent an unmodified form input.
  const CodeField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const CodeField.dirty([String? value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  validator(String? value) {
    return null;
  }
}
