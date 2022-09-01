import 'package:ala_pos/shared/fields/phone_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Value is correct", () {
    var data = "081510897758";
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, true);
  });

  test("Value is correct with country code", () {
    var data = "+681510897758";
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, true);
  });

  test("Null value is given", () {
    var data = null;
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PhoneValidationError.empty.message);
  });

  test("Empty string is given", () {
    var data = '';
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PhoneValidationError.empty.message);
  });

  test("Invalid number given", () {
    var data = '098786762uui';
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PhoneValidationError.length.message);
  });

  test("Number string lenght < 10", () {
    var data = '098786762';
    var field = PhoneField.dirty(data);

    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, PhoneValidationError.length.message);
  });
}
