import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  late Icon icon;
  bool hasTrailIcon;
  late String title;
  late String subtitle;
  Function()? onTap;
  ProfileMenuItemWidget({
    Key? key,
    this.hasTrailIcon = false,
    required this.icon,
    required this.title,
    this.subtitle = '',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32.sp,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 50.sp,
            child: icon,
          ),
          subtitle.isNotEmpty
              ? Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyText2),
                    Text(subtitle, style: Theme.of(context).textTheme.bodyText2),
                  ],
                ))
              : Expanded(child: Text(title, style: Theme.of(context).textTheme.bodyText1)),
          hasTrailIcon
              ? SizedBox(
                  width: 50.sp,
                  child: Icon(Ionicons.arrow_forward),
                )
              : SizedBox(),
        ]),
      ),
    );
  }
}
