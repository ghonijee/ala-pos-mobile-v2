import 'package:ala_pos/shared/fields/use_stock_opname_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Value is correct", () {
    var field = UseStockOpnameField.dirty(true);
    expect(field.value, true);
    expect(field.valid, true);
  });

  test("Value null is valid", () {
    var field = UseStockOpnameField.dirty();

    expect(field.value, false);
    expect(field.valid, true);
  });

  test("Value empty string is not valid", () {
    var field = UseStockOpnameField.dirty(false);

    expect(field.value, false);
    expect(field.valid, true);
  });
}
