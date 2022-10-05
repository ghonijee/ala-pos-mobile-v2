import 'package:ala_pos/feature/store/data/remote/store_category_remote_source.dart';
import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  test("Get list store category can return APISuccess", () async {
    var storeModel = [StoreCategoryModel(id: 1, name: "Test-category").toJson(), StoreCategoryModel(id: 1, name: "Test-category").toJson()];
    when(() => apiProvider.get(any())).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true, data: storeModel))));
    var storeCategorySource = StoreCategoryRemoteSource(apiProvider);
    var response = await storeCategorySource.all();

    var result = response as APISuccess;
    expect(result.resource.status, true);
    expect(result.resource.data, storeModel);
  });

  test("Get list store category can return APIError", () async {
    when(() => apiProvider.get(any())).thenAnswer((invocation) => Future.value(APIResponse.error(AppException.error())));
    var storeCategorySource = StoreCategoryRemoteSource(apiProvider);
    var response = await storeCategorySource.all();

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });
}
