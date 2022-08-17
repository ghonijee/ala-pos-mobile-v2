import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'routes/route_page.dart';

class AlaApp extends StatelessWidget {
  const AlaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        theme: Core.themeLight,
        routeInformationParser: initRouter.defaultRouteParser(),
        routerDelegate: initRouter.delegate(),
        debugShowCheckedModeBanner: false,
        title: "Ala Pos",
        useInheritedMediaQuery: true,
        // supportedLocales: [
        //   Locale('en'),
        //   Locale('id'),
        // ],
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
      );
    });
  }
}
