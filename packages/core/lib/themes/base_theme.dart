import 'package:core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BaseTheme {
  static final ThemeData light = ThemeData(
      colorScheme: const ColorScheme.light(
        background: AppColors.backgroundLight,
        error: AppColors.errorLight,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.iconLight,
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.enableBorderLight),
      fontFamily: "Open Sans",
      textTheme: TextTheme(
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
          color: AppColors.textDefaultLight,
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
      ));
}
