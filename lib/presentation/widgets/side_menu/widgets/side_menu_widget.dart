import 'package:ala_pos/presentation/widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:sizer/sizer.dart';
import 'side_menu_item_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SideMenuCubit>(
      create: (context) => GetIt.I.get<SideMenuCubit>(),
      child: SideMenuView(),
    );
  }
}

class SideMenuView extends StatelessWidget {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sideMenuCubit = context.read<SideMenuCubit>();
    sideMenuCubit.getUserProfile();

    return BlocBuilder<SideMenuCubit, SideMenuState>(
      builder: (context, state) {
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
                      state.maybeWhen(orElse: () {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.sp,
                              height: 10.sp,
                              color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                            ),
                            SizedBox(
                              height: AppSpacings.m,
                            ),
                            Container(
                              width: 40.sp,
                              height: 10.sp,
                              color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                            )
                          ],
                        );
                      }, loaded: ((userModel) {
                        return GestureDetector(
                          onTap: () {
                            context.router.pop();

                            AutoRouter.of(context).pushNamed(RouteName.profile);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userModel.username!,
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
                          ),
                        );
                      })),
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
                  AutoRouter.of(context).replaceNamed(RouteName.posWrapper);
                },
                iconData: Icons.cases_rounded,
              ),
              SideMenuItemWidget(
                title: "Transaksi ",
                onTap: () {
                  AutoRouter.of(context).replaceNamed(RouteName.transaction);
                },
                iconData: Icons.outbox_rounded,
              ),
              SideMenuItemWidget(
                  title: "Produk ",
                  onTap: () {
                    AutoRouter.of(context).replaceNamed(RouteName.product);
                  },
                  iconData: Icons.shopping_bag_rounded),
              Expanded(child: SizedBox()),
              SideMenuItemWidget(
                title: "Keluar ",
                onTap: () async {
                  var status = await sideMenuCubit.singOut();
                  if (status) {
                    context.router.replaceNamed(RouteName.login);
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
            ],
          ),
        );
      },
    );
  }
}
