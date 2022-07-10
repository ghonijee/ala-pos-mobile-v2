import 'package:formz/formz.dart';

enum StockValidationError {
  empty('Stok produk harus diisi');

  final String message;

  const StockValidationError(this.message);
}

class StockField extends FormzInput<int?, StockValidationError> {
  // Call super.pure to represent an unmodified form input.
  const StockField.pure() : super.pure(null);

  // Call super.dirty to represent a modified form input.
  const StockField.dirty(int? value) : super.dirty(value);

  @override
  StockValidationError? validator(int? value) {
    if (value == null || value.isNegative) {
      return StockValidationError.empty;
    } else {
      return null;
    }
  }
}
