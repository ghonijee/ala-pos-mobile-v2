import 'package:formz/formz.dart';

enum PriceValidationError {
  empty('Harga tidak boleh kosong'),
  minus('Harga tidak boleh minus');

  final String message;

  const PriceValidationError(this.message);
}

class PriceField extends FormzInput<int?, PriceValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PriceField.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const PriceField.dirty([int? value]) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PriceValidationError? validator(int? value) {
    if (value == null) {
      return PriceValidationError.empty;
    } else if (value.isNegative) {
      return PriceValidationError.minus;
    } else {
      return null;
    }
  }
}
