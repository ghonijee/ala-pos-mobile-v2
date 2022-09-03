import 'package:ala_pos/feature/auth/data/remote/auth_remote_source.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();

  test("Login method return APIresponse.error when login invalid", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("Credentials invalid")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.login("username", "password", "deviceName");

    expect(response, isA<APIResponse>());
    var result = response as APIError;
    expect(result, isA<APIError>());
    var exception = result.exception as AppExceptionErrorMessage;
    expect(exception, isA<AppExceptionErrorMessage>());
    expect(exception.message, "Credentials invalid");
  });

  test("Login method return APIresponse.success when login with valid credentials", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(status: true, data: {"token": "token-123"}, message: "berhasil")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.login("username", "password", "deviceName");
    expect(response, isA<APIResponse>());
    var result = response as APISuccess;
    expect(result.resource, isA<JsonResource>());
    var resouce = result.resource;
    expect(resouce.status, true);
    expect(resouce.message, isNotNull);
    expect(resouce.data, isMap);
  });

  test("Register method return APIResponse.success when success request", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(status: true, data: {"token": "token-123"}, message: "success")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.register(
      deviceName: '',
      phone: '',
      username: '',
      password: '',
    );
    expect(response, isA<APIResponse>());
    var result = response as APISuccess;
    expect(result.resource, isA<JsonResource>());
    var resouce = result.resource;
    expect(resouce.status, true);
    expect(resouce.message, isNotNull);
    expect(resouce.data, isMap);
  });
  test("Register method return APIResponse.error when success failed request", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("failed")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);
    var response = await remote.register(
      deviceName: '',
      phone: '',
      username: '',
      password: '',
    );
    expect(response, isA<APIResponse>());
    var result = response as APIError;
    expect(result, isA<APIError>());
    var exception = result.exception as AppExceptionErrorMessage;
    expect(exception, isA<AppExceptionErrorMessage>());
    expect(exception.message, "failed");
  });
  test("Logout method return APIResponse.success when success request", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(status: true, message: "success")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.logout();
    expect(response, isA<APIResponse>());
    var result = response as APISuccess;
    expect(result.resource, isA<JsonResource>());
    var resouce = result.resource;
    expect(resouce.status, true);
    expect(resouce.message, isNotNull);
  });
  test("Logout method return APIResponse.error when success failed request", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("failed")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);
    var response = await remote.logout();
    expect(response, isA<APIResponse>());
    var result = response as APIError;
    expect(result, isA<APIError>());
    var exception = result.exception as AppExceptionErrorMessage;
    expect(exception, isA<AppExceptionErrorMessage>());
    expect(exception.message, "failed");
  });
}
