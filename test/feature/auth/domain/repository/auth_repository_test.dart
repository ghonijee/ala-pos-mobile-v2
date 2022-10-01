import 'package:ala_pos/feature/auth/data/remote/auth_remote_source.dart';
import 'package:ala_pos/feature/auth/domain/models/login/login_model.dart';
import 'package:ala_pos/feature/user_management/domain/models/user/user_model.dart';
import 'package:ala_pos/feature/auth/domain/repository/auth_repository.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:ala_pos/shared/utils/device_info.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:ala_pos/shared/utils/platform_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

// Create Mock Class with Mocktail
class MockAuthRemoteSource extends Mock implements AuthRemoteSource {}

class MockDeviceInfo extends Mock implements DeviceInfo {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  // Create instance from Mock class
  final AuthRemoteSource remoteSource = MockAuthRemoteSource();
  final DeviceInfo deviceInfo = MockDeviceInfo();
  final LocalStorage localStorage = MockLocalStorage();

  test("Login method return LoginModel when login success", () async {
    // Setup Dummy Response Data
    var dataResponse = {
      "personal_access_token": "token",
      "user": UserModel(id: 1, fullname: '', phone: '', username: '').toJson(),
    };
    var jsonResource = JsonResource(status: true, message: "success", data: dataResponse);

    // Setup Dummy Mock Response
    when(
      () => remoteSource.login("username", "password", "unit-test"),
    ).thenAnswer((invocation) => Future.value(APIResponse.success(jsonResource)));
    when(() => deviceInfo.deviceName).thenAnswer((_) => Future.value("unit-test"));
    when(() => localStorage.store(any(), any())).thenAnswer((_) => Future.value());

    // Create instance from Repository Provider
    var authRepository = AuthRepository(remoteSource, deviceInfo, localStorage);
    var result = await authRepository.signIn("username", "password");

    // Check Expected Result
    expect(result.isSuccess, true);
    expect(result.success, isA<LoginModel>());
    expect(result.success.userModel.id, 1);
    expect(result.success.personalAccessToken, "token");
  });

  test("Login method return AppException when login failed", () async {
    // Setup for override provider
    var container = ProviderContainer(overrides: [
      authRepositoryProvider.overrideWithValue(
        AuthRepository(remoteSource, deviceInfo, localStorage),
      )
    ]);
    // Setup App Exception Mock
    var appException = AppException.errorWithMessage("Credentials failure");

    // Setup Mock Remote source
    when(() => remoteSource.login("username", "password", "unit-test")).thenAnswer(
      (invocation) => Future.value(APIResponse.error(appException)),
    );
    // Setup Mock device info response
    when(() => deviceInfo.deviceName).thenAnswer((_) => Future.value("unit-test"));

    // create instance authrepository from provider
    var authRepository = container.read(authRepositoryProvider);

    // get Result from Sign in mtehod
    var result = await authRepository.signIn("username", "password");
    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });
}
