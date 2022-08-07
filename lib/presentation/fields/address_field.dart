import 'package:formz/formz.dart';

import 'validator_error.dart';

class AddressField extends FormzInput<String, ValidationError> {
  // Call super.pure to represent an unmodified form input.
  const AddressField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const AddressField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  ValidationError? validator(String value) {
    return value.isEmpty ? ValidationError.emptyAddress : null;
  }
}
