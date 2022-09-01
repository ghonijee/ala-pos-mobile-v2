import 'package:ala_pos/shared/fields/password_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Value is correct", () {
    var data = "password";
    var field = PasswordField.dirty(data);

    expect(field.value, data);
    expect(field.valid, true);
  });

  test("Null value is given", () {
    var data = null;
    var field = PasswordField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PasswordValidationError.empty.message);
  });

  test("Empty string is given", () {
    var data = '';
    var field = PasswordField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PasswordValidationError.empty.message);
  });

  test("Password length < 8 string character", () {
    var data = '123456';
    var field = PasswordField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PasswordValidationError.length.message);
  });
}
