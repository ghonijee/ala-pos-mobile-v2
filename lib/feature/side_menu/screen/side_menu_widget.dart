import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../shared/styles/app_spacing.dart';
import 'side_menu_item_widget.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);
    return Drawer(
      width: 70.w,
      backgroundColor: primerTheme.canvas.dflt,
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 150,
            child: DrawerHeader(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                        color: primerTheme.border.muted,
                        width: 2,
                      )),
                  child: Icon(
                    FeatherIcons.user,
                    size: 30,
                  ),
                ),
                Spacing.large(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ghoni Jee",
                      style: primerTheme.typography.bold,
                    ),
                    Spacing.small(),
                    Text(
                      "Owner",
                      style: primerTheme.typography.small,
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  FeatherIcons.chevronRight,
                  size: 32,
                ),
              ],
            )),
          ),
          SizedBox(
            height: AppSpacings.m.sp,
          ),
          SideMenuItemWidget(
            title: "Kasir",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
            },
            iconData: Icons.cases_rounded,
          ),
          SideMenuItemWidget(
            title: "Transaksi ",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.transaction);
            },
            iconData: Icons.outbox_rounded,
          ),
          SideMenuItemWidget(
            title: "Produk ",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.product);
            },
            iconData: Icons.shopping_bag_rounded,
          ),
          SideMenuItemWidget(
            title: "Pengaturan ",
            onTap: () {
              // AutoRouter.of(context).pushNamed(RouteName.setting);
            },
            iconData: Ionicons.settings_outline,
          ),
          Expanded(child: SizedBox()),
          SideMenuItemWidget(
            title: "Keluar ",
            onTap: () async {
              // var status = await sideMenuCubit.singOut();
              // if (status) {
              //   context.router.replaceNamed(RouteName.login);
              // } else {
              //   context.router.pop();
              //   var snackBar = SnackBar(
              //     content: Text("Terjadi kesalahan"),
              //   );

              //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // }
            },
            iconData: Icons.logout_rounded,
          ),
        ],
      ),
    );
  }
}
