// 1. Create mock tokenRepo
import 'package:ala_pos/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockTokenRepository extends Mock implements TokenRepository {}

class MockAppStartNotifier extends Mock implements AppStartNotifier {}

class Listener extends Mock {
  void call(previous, value);
}

void main() {
  TokenRepository tokenRepository;
  AppStartNotifier appStartNotifier;

  setUp(() {
    tokenRepository = MockTokenRepository();
    appStartNotifier = MockAppStartNotifier();
  });

  group("App Start Provider Test", () {
    tokenRepository = MockTokenRepository();
    test("State is unauthenticated when token not found", () async {
      when(() => tokenRepository.fetchToken()).thenAnswer((_) => Future.value(null));
      // when(() => mockRepository.checkToken()).thenAnswer((_) => Future.value(false));
      final container = ProviderContainer(overrides: [
        tokenRepositoryProvider.overrideWithValue(tokenRepository),
        appStartProvider.overrideWithProvider(StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
          return AppStartNotifier(AppStartState.initial(), ref.read);
        }))
      ]);

      expect(container.read(appStartProvider), AppStartState.initial());
      await container.read(appStartProvider.notifier).authCheck();
      expect(container.read(appStartProvider), AppStartState.unauthenticated());
    });

    test("State is unauthenticated when token invalid", () async {
      when(() => tokenRepository.fetchToken()).thenAnswer((_) => Future.value(Token(token: "token-invalid")));
      when(() => tokenRepository.checkToken()).thenAnswer((_) => Future.value(false));
      final container = ProviderContainer(overrides: [
        tokenRepositoryProvider.overrideWithValue(tokenRepository),
        appStartProvider.overrideWithProvider(StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
          return AppStartNotifier(AppStartState.initial(), ref.read);
        }))
      ]);

      expect(container.read(appStartProvider), AppStartState.initial());
      await container.read(appStartProvider.notifier).authCheck();
      expect(container.read(appStartProvider), AppStartState.unauthenticated());
    });

    test("State is unauthenticated when token is valid", () async {
      when(() => tokenRepository.fetchToken()).thenAnswer((_) => Future.value(Token(token: "token-valid")));
      when(() => tokenRepository.checkToken()).thenAnswer((_) => Future.value(true));
      final container = ProviderContainer(overrides: [
        tokenRepositoryProvider.overrideWithValue(tokenRepository),
        appStartProvider.overrideWithProvider(StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
          return AppStartNotifier(AppStartState.initial(), ref.read);
        }))
      ]);

      expect(container.read(appStartProvider), AppStartState.initial());
      await container.read(appStartProvider.notifier).authCheck();
      expect(container.read(appStartProvider), AppStartState.authenticated());
    });
  });
}
