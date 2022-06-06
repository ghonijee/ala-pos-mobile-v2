import 'package:ala_pos/routes/route_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AlaApp extends StatelessWidget {
  const AlaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        theme: Core.themeLight,
        routeInformationParser: initRouter.routeInformationParser,
        routerDelegate: initRouter.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: "Ala Pos",
        useInheritedMediaQuery: true,
      );
    });
  }
}
