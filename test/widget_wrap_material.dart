import 'package:ala_pos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
