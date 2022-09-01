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

  test("User can't login with invalid credenstials", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("Credentials invalid")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.login("username", "password", "deviceName");

    expect(response, isA<APIResponse>());
  });

  test("User can login with valid credenstials", () async {
    when(() => apiProvider.post(any(), any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(status: true, data: {"token": "token-123"}, message: "berhasil")),
      ),
    );

    final remote = AuthRemoteSource(apiProvider);

    var response = await remote.login("username", "password", "deviceName");

    expect(response, isA<APIResponse>());
    var result = response.maybeWhen(
      orElse: () => null,
      success: (resource) => resource,
    );

    expect(result, isA<JsonResource>());
    expect(result!.status, true);
    expect(result.message, isNotNull);
    expect(result.data, isMap);
  });
}
