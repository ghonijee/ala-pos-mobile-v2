import 'dart:convert';

import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/user_management/domain/models/permission/permission_model.dart';
import 'package:ala_pos/feature/user_management/domain/models/role/role_model.dart';
import 'package:ala_pos/feature/user_management/domain/models/user/user_model.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRolePermissionRemoteSource extends Mock implements RolePermissionRemoteSource {}

class MockTokenRemoteSource extends Mock implements TokenRemoteSource {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  var localStorage = MockLocalStorage();
  var tokenRemoteResource = MockTokenRemoteSource();
  var rolePermissionRemote = MockRolePermissionRemoteSource();
  var userId = "1";
  var userEncoded = jsonEncode(UserModel(id: 1, fullname: "test", username: "test", phone: "0817171").toJson());
  RoleModel roleModelTemp = RoleModel(id: 1, storeId: 1, name: "Owner", description: "Owner role", permissions: [
    PermissionModel(id: 1, key: "test-key", name: "test key", description: "test permission", isActive: 1),
  ]);

  test("User role can return RoleModel when success", () async {
    // Setting Mock
    when(() => rolePermissionRemote.userRole(userId)).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true, data: roleModelTemp.toJson()))));
    when(() => localStorage.read(Constant.userModel)).thenAnswer((invocation) => Future.value(userEncoded));
    when(() => localStorage.store(any(), any())).thenAnswer((_) => Future.value());

    var repository = AppStartRepository(rolePermissionRemoteSource: rolePermissionRemote, tokenRemoteSource: tokenRemoteResource, localStorage: localStorage);
    var result = await repository.userRole();
    expect(result.isSuccess, true);
    expect(result.success, isA<RoleModel>());
  });
  test("User role return AppException when failure", () async {
    // Setting Mock
    when(() => rolePermissionRemote.userRole(userId)).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(
          AppException.errorWithMessage("User not found"),
        ),
      ),
    );
    when(() => localStorage.read(Constant.userModel)).thenAnswer((invocation) => Future.value(userEncoded));

    var repository = AppStartRepository(rolePermissionRemoteSource: rolePermissionRemote, tokenRemoteSource: tokenRemoteResource, localStorage: localStorage);
    var result = await repository.userRole();
    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
    expect(result.failure, isA<AppException>());
  });
  test("Token validate return true if token is valid from backend", () async {
    when(() => tokenRemoteResource.checkToken()).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true))));
    var repository = AppStartRepository(rolePermissionRemoteSource: rolePermissionRemote, tokenRemoteSource: tokenRemoteResource, localStorage: localStorage);
    var result = await repository.tokenValidate();
    expect(result, true);
  });
  test("Token validate return false if token  invalid from backend", () async {
    when(() => tokenRemoteResource.checkToken()).thenAnswer((invocation) => Future.value(
          APIResponse.error(
            AppException.errorWithMessage("User not found"),
          ),
        ));

    var repository = AppStartRepository(rolePermissionRemoteSource: rolePermissionRemote, tokenRemoteSource: tokenRemoteResource, localStorage: localStorage);
    var result = await repository.tokenValidate();
    expect(result, false);
  });
}
