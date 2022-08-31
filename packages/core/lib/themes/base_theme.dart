import 'package:core/styles/app_color.dart';
import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseTheme {
  static final ThemeData light = ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.sidebarLight),
    primaryColorDark: AppColors.surface,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundLight,
    disabledColor: AppColors.textSecondaryLight,
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      fillColor: AppColors.enableBackgroundLight,
      hintStyle: GoogleFonts.openSans(
        color: AppColors.textSecondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSpacings.s)),
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSpacings.s)),
        borderSide: BorderSide(
          color: AppColors.enableBorderLight,
        ),
      ),
    ),
    colorScheme: const ColorScheme.light(
      background: AppColors.backgroundLight,
      error: AppColors.errorLight,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      tertiary: AppColors.tertiary,
      surface: AppColors.surface,
      onSecondaryContainer: AppColors.emptyContainer,
    ),
    appBarTheme: AppBarTheme(
      elevation: 1.0,
      color: AppColors.backgroundLight,
      iconTheme: const IconThemeData(
        color: AppColors.primary,
      ),
      titleTextStyle: GoogleFonts.openSans(
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.enableBorderLight),
    fontFamily: "Open Sans",
    textTheme: GoogleFonts.openSansTextTheme(
      TextTheme(
        headline1: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.openSans(
          color: AppColors.textPrimaryLight,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline6: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.openSans(
          color: AppColors.textDefaultLight,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
    ),
  );
}
