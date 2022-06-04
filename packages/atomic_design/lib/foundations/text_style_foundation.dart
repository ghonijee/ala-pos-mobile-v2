import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextStyleFoundation {
  static TextStyle heading1 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading1.sp,
    // letterSpacing: TypographyTokens.letterSpaceH1.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle heading2 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading2.sp,
    // letterSpacing: TypographyTokens.letterSpaceH2.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle heading3 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading3.sp,
    // letterSpacing: TypographyTokens.letterSpaceH3.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle heading4 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading4.sp,
    // letterSpacing: TypographyTokens.letterSpaceH4.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle heading5 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading5.sp,
    // letterSpacing: TypographyTokens.letterSpaceH5.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading6 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeHeading6.sp,
    // letterSpacing: TypographyTokens.letterSpaceH6.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitle1 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeSubtitle1.sp,
    // letterSpacing: TypographyTokens.letterSubtitle1.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subtitle2 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeSubtitle2.sp,
    // letterSpacing: TypographyTokens.letterSubtitle2.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body1 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeBody1.sp,
    // letterSpacing: TypographyTokens.letterBody1.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle body2 = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeBody2.sp,
    // letterSpacing: TypographyTokens.letterBody2.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle button = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeButton.sp,
    // letterSpacing: TypographyTokens.letterButton.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle caption = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeCaption.sp,
    // letterSpacing: TypographyTokens.letterCaption.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle overline = GoogleFonts.openSans(
    color: ColorsToken.blackPrimary,
    fontSize: TypographyTokens.sizeOverline.sp,
    // letterSpacing: TypographyTokens.letterOverline.sp,
    fontWeight: FontWeight.w400,
  );
}
