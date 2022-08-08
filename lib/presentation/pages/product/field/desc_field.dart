import 'package:formz/formz.dart';

class DescField extends FormzInput<String?, dynamic> {
  // Call super.pure to represent an unmodified form input.
  const DescField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const DescField.dirty([String? value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  validator(String? value) {
    return null;
  }
}
