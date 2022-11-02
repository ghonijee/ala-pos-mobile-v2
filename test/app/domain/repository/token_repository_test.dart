import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/platform_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockTokenRemoteSource extends Mock implements TokenRemoteSource {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  final tokenRemoteSource = MockTokenRemoteSource();
  final mockStorage = MockFlutterSecureStorage();

  test("Delete token from localStorage", () async {
    var platformType = PlatformType.android;
    when(() => mockStorage.delete(key: Constant.token)).thenAnswer((invocation) => Future<void>.value());
    var repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    await repository.remove();
  });

  test("Save token to localStorage", () async {
    var platformType = PlatformType.android;
    Token tokenModel = Token(token: "token-asli");

    when(() => mockStorage.write(key: Constant.token, value: tokenToJson(tokenModel))).thenAnswer((invocation) => Future<void>.value());
    var repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    await repository.saveToken(tokenModel);
  });

  test("Fecth token to localStorage", () async {
    var platformType = PlatformType.android;
    Token tokenModel = Token(token: "token-asli");

    when(() => mockStorage.read(key: Constant.token)).thenAnswer((invocation) => Future<String?>.value(tokenToJson(tokenModel)));
    var repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    var result = await repository.fetchToken();
    expect(result!.token, tokenModel.token);
  });

  test("Check token is invalid", () async {
    var platformType = PlatformType.android;
    when(
      () => tokenRemoteSource.checkToken(),
    ).thenAnswer((invocation) => Future.value(APIResponse.error(AppExceptionErrorMessage("Token expired"))));
    var repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    var result = await repository.checkToken();
    expect(result, false);

    platformType = PlatformType.iOS;

    repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    result = await repository.checkToken();
    expect(result, false);
  });

  test("Check token is valid", () async {
    var platformType = PlatformType.android;
    when(
      () => tokenRemoteSource.checkToken(),
    ).thenAnswer((invocation) => Future.value(APIResponse.success(JsonResource(status: true))));
    var repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    var result = await repository.checkToken();
    expect(result, true);

    platformType = PlatformType.iOS;

    repository = TokenRepository(platformType, tokenRemoteSource, mockStorage);
    result = await repository.checkToken();
    expect(result, true);
  });
}
