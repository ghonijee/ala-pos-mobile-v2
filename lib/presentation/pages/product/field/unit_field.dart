import 'package:formz/formz.dart';

class UnitField extends FormzInput<String, dynamic> {
  // Call super.pure to represent an unmodified form input.
  const UnitField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UnitField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  validator(String value) {
    return null;
  }
}
