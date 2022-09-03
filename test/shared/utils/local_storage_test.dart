import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:ala_pos/shared/utils/platform_type.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  final mockStorage = MockFlutterSecureStorage();

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test("Android device can store value on local storage", () async {
    String key = "key";
    String value = "value";
    when(() => mockStorage.write(key: key, value: value)).thenAnswer((invocation) => Future<void>.value());
    LocalStorage localStorage = LocalStorage(PlatformType.android, mockStorage);
    await localStorage.store(key, value);

    verify(
      () => mockStorage.write(key: key, value: value),
    ).called(1);
  });

  test("Android device can read local storage by key", () async {
    String key = "key";
    String value = "value";
    when(() => mockStorage.read(key: key)).thenAnswer((invocation) => Future<String?>.value(value));
    LocalStorage localStorage = LocalStorage(PlatformType.android, mockStorage);
    var result = await localStorage.read(key);

    verify(
      () => mockStorage.read(key: key),
    ).called(1);

    expect(result!, value);
  });
}
