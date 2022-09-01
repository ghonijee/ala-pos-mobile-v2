import 'package:ala_pos/app/provider/app_start_provider.dart';
import 'package:ala_pos/app/screen/app_start_screen.dart';
import 'package:ala_pos/l10n/l10n.dart';
import 'package:ala_pos/shared/models/token/token.dart';
import 'package:ala_pos/shared/repository/token_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// 1. Create mock tokenRepo
class MockTokenRepository extends Mock implements TokenRepository {}

// 2. Create mock appStartNotifier
class MockAppStartNotifier extends Mock implements AppStartNotifier {}

// 3/ Create mock appStateProvider

// final fakeAppStartProvider = StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
//   return MockAppStartNotifier(AppStartState.initial(), ref.read);
// });

startWidget(widgetChild) {
  return ResponsiveSizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return PrimerApp(
          child: widgetChild,
          parentBrightness: Theme.of(context).brightness,
        );
      },
    );
  });
}

// Start Testing widget
void main() {
  testWidgets("Open login screen when token not found", (widgetTester) async {
    final mockRepository = MockTokenRepository();
    // final mockAppStartNotifier = MockAppStartNotifier();
    when(() => mockRepository.fetchToken()).thenAnswer((_) => Future.value(null));

    final testerWidget = ProviderScope(
      overrides: [
        tokenRepositoryProvider.overrideWithValue(mockRepository),
      ],
      child: AppStartScreen(),
    );
    // Start Pump
    await widgetTester.pumpWidget(startWidget(testerWidget));

    final imageFinder = find.byWidgetPredicate(
      (widget) {
        return widget is Image;
      },
    );
    // await widgetTester.pump();
    expect(imageFinder, findsOneWidget);
    await widgetTester.pump(Duration(seconds: 3));
    expect(find.byType(TextField), findsWidgets);
  });

  testWidgets("Open login screen when token  invalid", (widgetTester) async {
    final mockRepository = MockTokenRepository();
    // final mockAppStartNotifier = MockAppStartNotifier();
    when(() => mockRepository.fetchToken()).thenAnswer((_) => Future.value(Token(token: "token-valid")));
    when(() => mockRepository.checkToken()).thenAnswer((_) => Future.value(false));

    final testerWidget = ProviderScope(
      overrides: [
        tokenRepositoryProvider.overrideWithValue(mockRepository),
      ],
      child: AppStartScreen(),
    );
    // Start Pump
    await widgetTester.pumpWidget(startWidget(testerWidget));

    final imageFinder = find.byWidgetPredicate(
      (widget) {
        return widget is Image;
      },
    );
    // await widgetTester.pump();
    expect(imageFinder, findsOneWidget);
    await widgetTester.pump(Duration(seconds: 3));
    expect(find.byType(TextField), findsWidgets);
    expect(find.text("Masuk"), findsWidgets);
    expect(find.text("Belum punya akun? Daftar disini!"), findsWidgets);
  });

  testWidgets("Open Main POS Screen when token is valid", (widgetTester) async {
    final mockRepository = MockTokenRepository();
    // final mockAppStartNotifier = MockAppStartNotifier();
    when(() => mockRepository.fetchToken()).thenAnswer((_) => Future.value(Token(token: "token-valid")));
    when(() => mockRepository.checkToken()).thenAnswer((_) => Future.value(true));

    final testerWidget = ProviderScope(
      overrides: [
        tokenRepositoryProvider.overrideWithValue(mockRepository),
      ],
      child: AppStartScreen(),
    );
    // Start Pump
    await widgetTester.pumpWidget(startWidget(testerWidget));

    final imageFinder = find.byWidgetPredicate(
      (widget) {
        return widget is Image;
      },
    );
    // await widgetTester.pump();
    expect(imageFinder, findsOneWidget);
    await widgetTester.pump(Duration(seconds: 3));
    expect(find.text("Pos Main Screen"), findsWidgets);
  });
}
// Tested  when state is unauthenticated
// Tested when state is Initial
// Tested when state is authenticated
