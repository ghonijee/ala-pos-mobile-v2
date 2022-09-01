import 'dart:math';

import 'package:ala_pos/shared/fields/username_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Get value and valid status", () {
    var data = "username";
    var field = UsernameField.pure();

    expect(field.value, '');
    expect(field.valid, false);

    field = UsernameField.dirty(data);

    expect(field.value, data);
    expect(field.valid, true);
  });

  test("Check if value is null", () {
    var data = "username";
    var field = UsernameField.pure();

    expect(field.value, '');
    expect(field.valid, false);

    field = UsernameField.dirty(null);

    expect(field.value, null);
    expect(field.valid, false);
  });
}
