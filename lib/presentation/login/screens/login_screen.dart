import 'package:ala_pos/presentation/login/cubit/login_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = useTextEditingController();
    final password = useTextEditingController();
    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        state.when(
            initial: () => null,
            loading: () => null,
            onSuccess: () {
              context.go(RouteName.HomePos);
            },
            onFailure: (message) {
              var snackBar = SnackBar(
                content: Text(message! ?? "Terjadi kesalahan"),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp),
              width: 100.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Selamat Datang!",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: AppSpacings.s.sp,
                  ),
                  Text(
                    "Silahkan masuk terlebih dahulu!\nselanjutnya mulai berjualan dengan Alapos.",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: AppSpacings.l.sp,
                  ),
                  TextFormField(
                    controller: username,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      label: Text(
                        "Username / No HP",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.enableBorderLight,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.enableBorderLight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  TextFormField(
                    controller: password,
                    style: Theme.of(context).textTheme.bodyText1,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.enableBorderLight,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.enableBorderLight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cubit.signIn(username: username.text, password: password.text);
                    },
                    child: Text(
                      "MASUK",
                      style: Theme.of(context).textTheme.button?.copyWith(color: AppColors.textPrimaryDark),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      textStyle: Theme.of(context).textTheme.button?.copyWith(color: AppColors.textPrimaryDark),
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.go(RouteName.Register);
                        // GoRouter.of(context).push(RouteName.Register);
                      },
                      child: state.maybeWhen(
                          loading: () => CircularProgressIndicator(),
                          orElse: () => Text(
                                "Belum punya akun? daftar disini.",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: AppColors.textDefaultLight,
                                    ),
                              )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/pos_logo.png",
                      width: 60.sp,
                    ),
                  ),
                  SizedBox(
                    height: 32.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
