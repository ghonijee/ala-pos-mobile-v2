import 'dart:convert';

import 'package:ala_pos/feature/user_management/data/remote/permission_remote_source.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  late PermissionRemoteSource remoteSource;
  String resouce = "/permission";

  setUp(() {
    remoteSource = PermissionRemoteSource(apiProvider);
  });
  test('List can response APISuccess when request success', () async {
    when(() => apiProvider.get(resouce)).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await remoteSource.list();
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test('List can response APIError when request failed', () async {
    when(() => apiProvider.get(resouce)).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );
    var response = await remoteSource.list();

    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
}
