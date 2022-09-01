import 'package:ala_pos/shared/fields/address_field.dart';
import 'package:ala_pos/shared/fields/validator_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Value is correct", () {
    var address = "Jl. Ahmad Yani No. 12";
    var field = AddressField.dirty(address);

    expect(field.value, address);
    expect(field.valid, true);
  });

  test("Null value is given", () {
    var address = null;
    var field = AddressField.dirty(address);

    expect(field.value, address);
    expect(field.valid, false);
    expect(field.error!.message, ValidationError.emptyAddress.message);
  });

  test("Empty string is given", () {
    var address = '';
    var field = AddressField.dirty(address);

    expect(field.value, address);
    expect(field.valid, false);
    expect(field.error!.message, ValidationError.emptyAddress.message);
  });
}
