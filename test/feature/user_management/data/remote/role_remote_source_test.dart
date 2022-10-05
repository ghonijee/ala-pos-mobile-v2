import 'dart:convert';

import 'package:ala_pos/feature/user_management/data/remote/role_remote_source.dart';
import 'package:ala_pos/feature/user_management/data/remote/user_remote_source.dart';
import 'package:ala_pos/feature/user_management/domain/models/role/role_model.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  late RoleRemoteSource roleRemoteSource;
  String resouce = "/role";

  setUp(() {
    roleRemoteSource = RoleRemoteSource(apiProvider);
  });
  test('List can response APISuccess when request success', () async {
    var filter = jsonEncode(["store_id", "=", "1"]);
    when(() => apiProvider.get(resouce, query: {"filter": filter})).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await roleRemoteSource.list(filter);
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test('List can response APIError when request failed', () async {
    var filter = jsonEncode(["store_id", "=", "1"]);

    when(() => apiProvider.get(resouce, query: {"filter": filter})).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );
    var response = await roleRemoteSource.list(filter);

    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });

  test("User role permission can return APISuccess when request success", () async {
    when(() => apiProvider.get("/role/user/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await roleRemoteSource.userRole("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test("User role permission can return APIError when request failed", () async {
    when(() => apiProvider.get("/role/user/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await roleRemoteSource.userRole("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });

  test('Create can response APISuccess when request success', () async {
    var data = RoleModel(id: 1, storeId: 2, name: "role-test", description: "iini role test", permissions: []);
    when(() => apiProvider.post(resouce, data.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await roleRemoteSource.create(data.toJson());
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test('Create can response APIError when request failed', () async {
    var data = RoleModel(id: 1, storeId: 2, name: "role-test", description: "iini role test", permissions: []);
    when(() => apiProvider.post(resouce, data.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await roleRemoteSource.create(data.toJson());
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
}
