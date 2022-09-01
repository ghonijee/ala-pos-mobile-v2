import 'package:ala_pos/shared/fields/fields.dart';
import 'package:ala_pos/shared/fields/validator_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Value is correct", () {
    var data = "Yunus Store";
    var field = StoreNameField.dirty(data);
    expect(field.value, data);
    expect(field.valid, true);
  });

  test("Value null is not valid", () {
    var data = null;
    var field = StoreNameField.dirty(data);
    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, ValidationError.emptyName.message);
  });

  test("Value empty string is not valid", () {
    var data = '';
    var field = StoreNameField.dirty(data);
    expect(field.value, data);
    expect(field.valid, false);
    expect(field.error!.message, ValidationError.emptyName.message);
  });
}
