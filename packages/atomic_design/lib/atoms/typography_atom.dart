import 'package:atomic_design/foundations/foundations.dart';
import 'package:flutter/material.dart';

extension HeadingText on Text {
  /// Style Text to Heading 4
  Text heading4() {
    return Text(
      data!,
      style: TextStyleFoundation.heading4,
    );
  }

  /// Style Text to Heading 5
  /// for Background Dark
  Text darkHeading5() {
    return Text(
      data!,
      style: TextStyleFoundation.heading5.copyWith(color: ColorFoundation.textPrimaryDark),
    );
  }

  /// Style Text to Heading 5
  /// for Background Light
  Text heading5() {
    return Text(
      data!,
      style: TextStyleFoundation.heading5,
    );
  }
}
