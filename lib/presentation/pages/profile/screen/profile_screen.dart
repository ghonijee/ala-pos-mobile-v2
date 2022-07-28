import 'package:ala_pos/presentation/pages/profile/cubit/user/user_profile_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/widgets/profile_header_widget.dart';
import 'package:ala_pos/presentation/pages/profile/widgets/profile_menu_item_widget.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfileCubit = useBloc<UserProfileCubit>();
    userProfileCubit.load();
    final userProfileState = useBlocBuilder(
      userProfileCubit,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Ionicons.arrow_back_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: userProfileState.maybeWhen(
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (user, store) {
              return Column(
                children: [
                  SizedBox(
                    height: AppSpacings.l.sp,
                  ),
                  ProfileHeaderWidget(fullname: user.fullname!, email: user.email ?? "-", phone: user.phone ?? "-"),
                  SizedBox(
                    height: 40.sp,
                  ),
                  ProfileMenuItemWidget(
                    icon: Icon(Ionicons.person_outline),
                    title: "Ubah Profile User",
                    onTap: () {
                      context.router.pushNamed(RouteName.profileUserForm);
                    },
                    hasTrailIcon: true,
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: AppSpacings.x2l.sp,
                    indent: 10.sp,
                    endIndent: 10.sp,
                  ),
                  ProfileMenuItemWidget(
                    icon: Icon(Ionicons.lock_closed_outline),
                    title: "Ubah Password",
                    onTap: () {},
                    hasTrailIcon: true,
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: AppSpacings.x2l.sp,
                    indent: 10.sp,
                    endIndent: 10.sp,
                  ),
                  ProfileMenuItemWidget(
                    icon: Icon(Ionicons.storefront_outline),
                    title: "Ganti Toko",
                    subtitle: store.name,
                    onTap: () {},
                    hasTrailIcon: true,
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: AppSpacings.x2l.sp,
                    indent: 10.sp,
                    endIndent: 10.sp,
                  ),
                  ProfileMenuItemWidget(
                    icon: Icon(Ionicons.log_out_outline),
                    title: "Keluar Akun",
                    onTap: () async {
                      var status = await userProfileCubit.signOut();
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
                  ),
                ],
              );
            },
            orElse: () {}),
      ),
    );
  }
}
