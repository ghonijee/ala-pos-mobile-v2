import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/presentation/widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ionicons/ionicons.dart';

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
          width: 70.w,
          backgroundColor: Theme.of(context).primaryColor,
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100.sp,
                // width: 0.w,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp, vertical: AppSpacings.m.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Ionicons.person_circle,
                        size: 32.sp,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      SizedBox(
                        width: AppSpacings.l,
                      ),
                      state.maybeWhen(
                        orElse: () {
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
                        },
                        loaded: ((UserModel userModel) {
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
                                  userModel.fullname!,
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 2.sp,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),
                                      decoration: BoxDecoration(color: Theme.of(context).primaryColorDark, borderRadius: BorderRadius.all(Radius.circular(2.sp))),
                                      child: Text(
                                        userModel.userStatus ?? "Free",
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Text(
                                //   "Profil & Pengaturan",
                                //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                //         color: Theme.of(context).primaryColorDark,
                                //       ),
                                // ),
                              ],
                            ),
                          );
                        }),
                      ),
                      // Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSpacings.m.sp,
              ),
              SideMenuItemWidget(
                title: "Kasir",
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
