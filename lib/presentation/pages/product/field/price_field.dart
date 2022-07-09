import 'package:formz/formz.dart';

enum PriceValidationError {
  empty('Price can\'t be empty');

  final String message;

  const PriceValidationError(this.message);
}

class PriceField extends FormzInput<String, PriceValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PriceField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PriceField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PriceValidationError? validator(String value) {
    return value.isEmpty ? PriceValidationError.empty : null;
  }
}
