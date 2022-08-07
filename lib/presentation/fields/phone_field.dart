import 'package:formz/formz.dart';

enum PhoneValidationError {
  empty('Nomor telfon tidak boleh kosong'),
  invalid('Nomor telfon tidak valid');

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
    String pattern = r'^(?:[+6][1-9])?[0-9]{10,14}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return PhoneValidationError.invalid;

    return value.isEmpty ? PhoneValidationError.empty : null;
  }
}
