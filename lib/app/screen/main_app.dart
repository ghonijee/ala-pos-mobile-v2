import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../l10n/l10n.dart';
import '../../routes/router.dart';
import '../../routes/router.gr.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [AppRouteObserver()],
        ),
        routeInformationProvider: _appRouter.routeInfoProvider(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        builder: (context, child) {
          return PrimerApp(
            child: child!,
            parentBrightness: Theme.of(context).brightness,
          );
        },
      );
    });
  }
}
