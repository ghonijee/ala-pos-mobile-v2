import 'package:formz/formz.dart';

import 'validator_error.dart';

class UseStockOpnameField extends FormzInput<bool, ValidationError> {
  // Call super.pure to represent an unmodified form input.
  const UseStockOpnameField.pure() : super.pure(false);

  // Call super.dirty to represent a modified form input.
  const UseStockOpnameField.dirty([bool value = false]) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  ValidationError? validator(value) {
    return null;
  }
}
