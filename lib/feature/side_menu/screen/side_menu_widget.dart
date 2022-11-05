import 'package:ala_pos/feature/auth/router/auth_router.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/side_menu/provider/sidebar_provider.dart';
import 'package:ala_pos/shared/utils/permission_check.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../shared/styles/app_spacing.dart';
import 'side_menu_item_widget.dart';

class SideMenuView extends HookConsumerWidget {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ref.watch(userProfileProvider).maybeWhen(
                      data: (data) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!.fullname,
                            style: primerTheme.typography.bold,
                          ),
                          Spacing.extraSmall(),
                          Text(
                            data.userStatus?.toUpperCase() ?? "Free",
                            style: primerTheme.typography.small,
                          ),
                        ],
                      ),
                      orElse: () => SizedBox(),
                    ),
                Expanded(child: SizedBox()),
                Icon(
                  FeatherIcons.chevronRight,
                  size: 28,
                ),
              ],
            )),
          ),
          SizedBox(
            height: AppSpacings.m.sp,
          ),
          FutureBuilder<bool>(
            future: Permission.can("create-transaction"),
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.data == false) {
                return SizedBox();
              }
              return SideMenuItemWidget(
                title: "Kasir",
                onTap: () {
                  // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
                },
                iconData: FeatherIcons.plusSquare,
                isActive: context.router.currentPath == PosRouteName.Pos,
              );
            },
          ),
          Spacing.small(),
          SideMenuItemWidget(
            title: "Riwayat Transaksi",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
            },
            iconData: FeatherIcons.book,
          ),
          Spacing.small(),
          SideMenuItemWidget(
            title: "Laporan",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
            },
            iconData: FeatherIcons.bookOpen,
          ),
          Spacing.small(),
          SideMenuItemWidget(
            title: "Kelola Produk",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
            },
            iconData: FeatherIcons.package,
          ),
          Spacing.small(),
          SideMenuItemWidget(
            title: "Kelola Toko",
            onTap: () {
              // AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
            },
            iconData: FeatherIcons.settings,
          ),
          Expanded(child: SizedBox()),
          SideMenuItemWidget(
            title: "Keluar ",
            onTap: () async {
              var status = ref.watch(logoutProvider);

              if (status) {
                context.router.replaceNamed(AuthRouteName.Login);
              } else {
                context.router.pop();
                var snackBar = SnackBar(
                  content: Text("Terjadi kesalahan"),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            iconData: Icons.logout_rounded,
          ),
          Spacing.small(),
        ],
      ),
    );
  }
}
