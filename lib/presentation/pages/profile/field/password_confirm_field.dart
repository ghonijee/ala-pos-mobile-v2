import 'package:ala_pos/presentation/pages/profile/field/password_field.dart';
import 'package:formz/formz.dart';

enum PasswordConfirmValidationError {
  empty('Password Confirm tidak boleh kosong'),
  invalid('Password Confirm kurang tepat');

  final String message;

  const PasswordConfirmValidationError(this.message);
}

class PasswordConfirmField extends FormzInput<String, PasswordConfirmValidationError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordConfirmField.pure()
      : compare = const PasswordField.pure(),
        super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordConfirmField.dirty({String value = "", required this.compare}) : super.dirty(value);

  // Compare Password
  final PasswordField compare;
  // Override validator to handle validating a given input value.
  @override
  PasswordConfirmValidationError? validator(String value) {
    if (value != compare.value) {
      return PasswordConfirmValidationError.invalid;
    }

    if (value.isEmpty) {
      return PasswordConfirmValidationError.empty;
    }

    return null;
  }
}
