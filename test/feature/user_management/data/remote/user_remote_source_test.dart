import 'dart:convert';
import 'dart:math';
import 'package:ala_pos/feature/user_management/domain/models/user/user_model.dart';
import 'package:ala_pos/feature/user_management/data/remote/user_remote_source.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  late UserRemoteSource userRemoteSource;
  String resouce = "/user";

  setUp(() {
    userRemoteSource = UserRemoteSource(apiProvider);
  });

  test("Paginate can return APISuccess when request success", () async {
    String? filter;
    String? sortBy;
    bool desc = true;
    int take = 15;
    int page = 1;

    when(() => apiProvider.get(resouce, query: {
          "filter": filter,
          "sort": jsonEncode([
            {"selector": sortBy, "desc": desc}
          ]),
          "take": take.toString(),
          "page": page.toString(),
        })).thenAnswer((_) => Future.value(APIResponse.success(JsonResource(status: true, data: []))));

    var response = await userRemoteSource.paginate(
      page: 1,
      sortBy: sortBy,
      filter: filter,
    );

    var result = response as APISuccess;
    expect(result.resource.status, true);
  });
  test("Paginate can return APIError when request failed", () async {
    String? filter;
    String? sortBy;
    bool desc = true;
    int take = 15;
    int page = 1;

    when(() => apiProvider.get(resouce, query: {
          "filter": filter,
          "sort": jsonEncode([
            {"selector": sortBy, "desc": desc}
          ]),
          "take": take.toString(),
          "page": page.toString(),
        })).thenAnswer((_) => Future.value(
          APIResponse.error(AppException.error()),
        ));

    var response = await userRemoteSource.paginate(
      page: 1,
      sortBy: sortBy,
      filter: filter,
    );

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });

  test("Create can return APISuccess when request success", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");
    when(() => apiProvider.post(resouce, model.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: model.toJson()),
      ),
    );

    var response = await userRemoteSource.create(model.toJson());
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, model.toJson());
  });
  test("Create can return APIError when request failed", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.post(resouce, model.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await userRemoteSource.create(model.toJson());
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Show data can return APISuccess when request success", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.get("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: model.toJson()),
      ),
    );

    var response = await userRemoteSource.show("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, model.toJson());
  });
  test("Show data can return APIError when request failed", () async {
    when(() => apiProvider.get("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("product not found")),
    );

    var response = await userRemoteSource.show("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Update can return APISuccess when request success", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.put("$resouce/1", model.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: model.toJson()),
      ),
    );

    var response = await userRemoteSource.update(model.toJson(), "1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, model.toJson());
  });
  test("Update can return APIError when request failed", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.put("$resouce/1", model.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await userRemoteSource.update(model.toJson(), "1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Delete can return APISuccess when request success", () async {
    when(() => apiProvider.delete("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await userRemoteSource.delete("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test("Delete can return APIError when request failed", () async {
    when(() => apiProvider.delete("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await userRemoteSource.delete("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });

  test("Change Password can return APISuccess when request success", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.post("/change-password/1", model.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: model.toJson()),
      ),
    );

    var response = await userRemoteSource.changePassword(model.toJson(), "1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, model.toJson());
  });
  test("Change Password can return APIError when request failed", () async {
    UserModel model = UserModel(id: 1, fullname: "test name", username: "test", phone: "0816171771");

    when(() => apiProvider.post("/change-password/1", model.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await userRemoteSource.changePassword(model.toJson(), "1");
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

    var response = await userRemoteSource.rolePermission("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test("User role permission can return APIError when request failed", () async {
    when(() => apiProvider.get("/role/user/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await userRemoteSource.rolePermission("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
}
