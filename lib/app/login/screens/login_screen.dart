import 'package:ala_pos/app/login/cubit/login_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/foundations/foundations.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
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
              style: Theme.of(context).textTheme.headline4?.apply(color: Theme.of(context).colorScheme.surface),
            ),
            SizedBox(
              height: AppSpacings.s.sp,
            ),
            Text(
              "Silahkan masuk terlebih dahulu untuk\nmenggunakan aplikasi Alapos!",
              style: Theme.of(context).textTheme.subtitle1?.apply(color: Theme.of(context).colorScheme.surface),
            ),
            SizedBox(
              height: AppSpacings.l.sp,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyText1?.apply(color: Theme.of(context).colorScheme.surface),
              decoration: InputDecoration(
                label: Text(
                  "Username / No HP",
                  style: Theme.of(context).textTheme.bodyText2?.apply(color: Theme.of(context).colorScheme.surface),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSpacings.m.sp,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyText1?.apply(color: Theme.of(context).colorScheme.surface),
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodyText2?.apply(color: Theme.of(context).colorScheme.surface),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorFoundation.enableBorderColorDark,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorFoundation.enableBorderColorDark,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.sp,
            ),
            ElevatedButton(
              onPressed: () {
                cubit.signIn(username: "test", password: "test");
              },
              child: Text(
                "MASUK",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorFoundation.buttonAccent,
                minimumSize: Size.fromHeight(40.sp),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.go(RouteName.Login);
                  // GoRouter.of(context).push(RouteName.Register);
                },
                child: Text(
                  "Belum punya akun? daftar disini.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
    );
  }
}
