import 'package:ala_pos/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Can convert from JSON to Object", () {
    var json = {"status": true, "message": "success", "data": null};
    var resource = JsonResource.fromJson(json);
    expect(resource, isA<JsonResource>());
    expect(resource.status, true);
    expect(resource.message, "success");
    expect(resource.data, null);
  });
}
