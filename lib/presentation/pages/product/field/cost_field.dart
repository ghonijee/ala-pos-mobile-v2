import 'package:formz/formz.dart';

enum CostValidationError {
  negative('Harga modal tidak boleh kurang dari 0');

  final String message;

  const CostValidationError(this.message);
}

class CostField extends FormzInput<int?, CostValidationError> {
  // Call super.pure to represent an unmodified form input.
  const CostField.pure() : super.pure(null);

  // Call super.dirty to represent a modified form input.
  const CostField.dirty(int? value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  CostValidationError? validator(int? value) {
    if (value == null) return null;
    return value.isNegative ? CostValidationError.negative : null;
  }
}
