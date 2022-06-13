import 'package:ala_pos/domain/models/user_model.dart';
import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'side_menu_item_widget.dart';

class SideMenuWidget extends StatelessWidget {
  final Function() logoutAction;
  final UserModel userModel;
  const SideMenuWidget({
    Key? key,
    required this.logoutAction,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 113.sp,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(AppSpacings.x2l.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: AppSpacings.x3l.sp,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  SizedBox(
                    width: AppSpacings.l,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.fullname!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "Profile",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).primaryColorDark,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSpacings.x2l.sp,
          ),
          SideMenuItemWidget(
            title: "POS",
            onTap: () {
              //
            },
            iconData: Icons.cases_rounded,
          ),
          SideMenuItemWidget(
            title: "Penjualan ",
            onTap: () {
              //
            },
            iconData: Icons.outbox_rounded,
          ),
          Expanded(child: SizedBox()),
          SideMenuItemWidget(
            title: "Keluar ",
            onTap: logoutAction,
            iconData: Icons.logout_rounded,
          ),
        ],
      ),
    );
  }
}
