import 'package:ala_pos/feature/store/data/remote/store_remote_source.dart';
import 'package:ala_pos/feature/store/domain/models/store/store_model.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  StoreRemoteSource storeRemoteSource;

  test("Create store can return APISuccess", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true))));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.create(
      phone: "08717171",
      address: "jl. merdeka",
      name: "Store Name",
    );

    var result = response as APISuccess;
    expect(result.resource.status, true);
  });

  test("Create store can return APIError", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer((invocation) => Future.value(APIResponse.error(AppException.error())));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.create(
      phone: "08717171",
      address: "jl. merdeka",
      name: "Store Name",
    );

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });
  test("Get main store can return APISuccess", () async {
    var storeModel = StoreModel(name: "Ahmad Yunus STore");
    when(() => apiProvider.get(any())).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true, data: storeModel.toJson()))));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.main();

    var result = response as APISuccess;
    expect(result.resource.status, true);
    expect(result.resource.data, storeModel.toJson());
  });

  test("Get main store can return APIError", () async {
    when(() => apiProvider.get(any())).thenAnswer((invocation) => Future.value(APIResponse.error(AppException.error())));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.main();

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });
  test("Update store can return APISuccess", () async {
    var storeModel = StoreModel(name: "Ahmad Yunus STore");
    when(() => apiProvider.put(any(), any())).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true, data: storeModel.toJson()))));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.update(storeModel.toJson(), 1);

    var result = response as APISuccess;
    expect(result.resource.status, true);
    expect(result.resource.data, storeModel.toJson());
  });

  test("Update store can return APIError", () async {
    var storeModel = StoreModel(name: "Ahmad Yunus STore");
    when(() => apiProvider.put(any(), any())).thenAnswer((invocation) => Future.value(APIResponse.error(AppException.errorWithMessage("updated failed"))));
    storeRemoteSource = StoreRemoteSource(apiProvider);
    var response = await storeRemoteSource.update(storeModel.toJson(), 1);

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });
}
