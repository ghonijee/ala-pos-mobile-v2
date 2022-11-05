import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/styles/app_spacing.dart';

class SideMenuItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData iconData;
  final bool isActive;
  const SideMenuItemWidget({
    required this.title,
    required this.onTap,
    required this.iconData,
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? primerTheme.brand.tertiary : primerTheme.canvas.dflt,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isActive ? primerTheme.brand.primary : primerTheme.foreground.dflt,
            ),
            Spacing.large(),
            Text(
              title,
              style: primerTheme.typography.smallBold.copyWith(
                color: isActive ? primerTheme.brand.primary : primerTheme.foreground.dflt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
