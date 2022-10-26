import 'package:flutter/material.dart';

class AppSpacings {
  /// Double 4
  static const double xs = 4;

  /// Double 8
  static const double s = 8;

  /// Double 12
  static const double m = 12;

  /// Double 16
  static const double l = 16;

  /// Double 20
  static const double xl = 20;

  /// Double 24
  static const double x2l = 24;

  /// Double 28
  static const double x3l = 28;

  /// Double 32
  static const double x4l = 32;
}

class Spacing extends SizedBox {
  Spacing({double height = 0.0, double width = 0.0}) : super(height: height, width: width);

  factory Spacing.height({double size = 8}) => Spacing(
        height: size,
      );
  factory Spacing.large({double size = AppSpacings.l}) => Spacing(
        height: size,
        width: size,
      );
  factory Spacing.extraLarge({double size = AppSpacings.xl}) => Spacing(
        height: size,
        width: size,
      );
  factory Spacing.medium({double size = AppSpacings.m}) => Spacing(
        height: size,
        width: size,
      );
  factory Spacing.small({double size = AppSpacings.s}) => Spacing(
        height: size,
        width: size,
      );
  factory Spacing.extraSmall({double size = AppSpacings.xs}) => Spacing(
        height: size,
        width: size,
      );
  factory Spacing.width({double size = 8}) => Spacing(
        width: size,
      );
}
