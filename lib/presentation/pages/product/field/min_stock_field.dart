import 'package:formz/formz.dart';

enum MinStockValidationError {
  smaller('Min. stok harus lebih besar dari 0');

  final String message;

  const MinStockValidationError(this.message);
}

class MinStockField extends FormzInput<int, MinStockValidationError> {
  // Call super.pure to represent an unmodified form input.
  const MinStockField.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const MinStockField.dirty([int value = 0]) : super.dirty(value);

  @override
  MinStockValidationError? validator(int value) {
    if (value < 0) {
      return MinStockValidationError.smaller;
    } else {
      return null;
    }
  }
}
