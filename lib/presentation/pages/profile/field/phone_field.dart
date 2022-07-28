import 'package:formz/formz.dart';

enum PhoneValidationError {
  empty('Phone tidak boleh kosong');

  final String message;

  const PhoneValidationError(this.message);
}

class PhoneField extends FormzInput<String, PhoneValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PhoneField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PhoneField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PhoneValidationError? validator(String value) {
    return value.isEmpty ? PhoneValidationError.empty : null;
  }
}
