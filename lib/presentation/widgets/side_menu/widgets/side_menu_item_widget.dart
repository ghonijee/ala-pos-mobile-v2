import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SideMenuItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData iconData;
  const SideMenuItemWidget({
    required this.title,
    required this.onTap,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: AppSpacings.x2l.sp,
        right: AppSpacings.x2l.sp,
        bottom: AppSpacings.s,
      ),
      leading: Container(
        constraints: BoxConstraints(minHeight: 28.sp, minWidth: 28.sp),
        decoration: BoxDecoration(color: Theme.of(context).primaryColorDark.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Icon(
          iconData,
          size: AppSpacings.xl,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Theme.of(context).primaryColorDark,
            ),
      ),
      onTap: onTap,
    );
  }
}
