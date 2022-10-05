import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();

  test("Check token return APIresponse.success when login valid", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.success(JsonResource(status: true, message: "Token is valid")),
      ),
    );

    final remote = TokenRemoteSource(apiProvider);

    var response = await remote.checkToken();
    expect(response, isA<APIResponse>());
    var result = response as APISuccess;
    expect(result.resource, isA<JsonResource>());
    var resouce = result.resource;
    expect(resouce.status, true);
    expect(resouce.message, isNotNull);
  });

  test("Check token return APIresponse.error when login invalid", () async {
    when(() => apiProvider.get(any())).thenAnswer(
      (invocation) => Future.value(
        APIResponse.error(AppException.errorWithMessage("Token invalid")),
      ),
    );

    final remote = TokenRemoteSource(apiProvider);

    var response = await remote.checkToken();

    expect(response, isA<APIResponse>());
    var result = response as APIError;
    expect(result, isA<APIError>());
    var exception = result.exception as AppExceptionErrorMessage;
    expect(exception, isA<AppExceptionErrorMessage>());
    expect(exception.message, "Token invalid");
  });
}
