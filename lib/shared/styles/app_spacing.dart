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
  factory Spacing.width({double size = 8}) => Spacing(
        width: size,
      );
}
