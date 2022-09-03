import 'package:ala_pos/app/data/role_permission_remote_source.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();

  test("User role return APIresponse.success when login valid", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(
          status: true,
        )),
      ),
    );

    final remote = RolePermissionRemoteSource(apiProvider);

    var response = await remote.userRole("1");
    expect(response, isA<APIResponse>());
    var result = response as APISuccess;
    expect(result.resource, isA<JsonResource>());
    var resouce = result.resource;
    expect(resouce.status, true);
  });

  test("User role return APIresponse.error when login invalid", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("failed")),
      ),
    );

    final remote = RolePermissionRemoteSource(apiProvider);

    var response = await remote.userRole("1");

    expect(response, isA<APIResponse>());
    var result = response as APIError;
    expect(result, isA<APIError>());
    var exception = result.exception as AppExceptionErrorMessage;
    expect(exception, isA<AppExceptionErrorMessage>());
    expect(exception.message, "failed");
  });
}
