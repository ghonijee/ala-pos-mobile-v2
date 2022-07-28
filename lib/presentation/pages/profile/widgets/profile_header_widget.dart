import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String fullname;
  final String email;
  final String phone;
  const ProfileHeaderWidget({
    Key? key,
    required this.fullname,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 60.sp,
            height: 60.sp,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            child: Text(
              fullname.initial(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(
            width: AppSpacings.l.sp,
          ),
          SizedBox(
            // height: 60.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: AppSpacings.xs.sp,
                ),
                Text(phone, style: Theme.of(context).textTheme.bodyText2),
                SizedBox(
                  height: AppSpacings.xs.sp,
                ),
                Text(email, style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
