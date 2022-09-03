import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();

  test("Create store can return APISuccess", () async {
    //
  });

  test("Create store can return APIError", () async {
    //
  });
  test("Get main store can return APISuccess", () async {
    //
  });

  test("Get main store can return APIError", () async {
    //
  });
  test("Update store can return APISuccess", () async {
    //
  });

  test("Update store can return APIError", () async {
    //
  });
}
