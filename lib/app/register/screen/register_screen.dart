import 'package:ala_pos/routes/route_page.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFoundation.backgroundColorDark,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 88.sp,
            ),
            Text(
              "Daftar Sekarang!",
              style: TextStyleFoundation.heading5.copyWith(color: ColorFoundation.textPrimaryDark),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Text(
              "Dapatkan kemudahan untuk mengelola dan\nmonitoring usahamu",
              style: TextStyleFoundation.caption.copyWith(color: ColorFoundation.textPrimaryDark),
            ),
            SizedBox(
              height: 32.sp,
            ),
            TextFormField(
              style: TextStyleFoundation.body2.copyWith(color: ColorFoundation.textPrimaryDark),
              decoration: InputDecoration(
                label: Text(
                  "Username",
                  style: TextStyleFoundation.caption.copyWith(
                    color: ColorFoundation.textPrimaryDark,
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
              height: 16.sp,
            ),
            TextFormField(
              style: TextStyleFoundation.body2.copyWith(color: ColorFoundation.textPrimaryDark),
              decoration: InputDecoration(
                label: Text(
                  "No HP",
                  style: TextStyleFoundation.caption.copyWith(
                    color: ColorFoundation.textPrimaryDark,
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
              height: 16.sp,
            ),
            TextFormField(
              style: TextStyleFoundation.body2.copyWith(color: ColorFoundation.textPrimaryDark),
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyleFoundation.caption.copyWith(
                    color: ColorFoundation.textPrimaryDark,
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
              onPressed: () {},
              child: Text(
                "DAFTAR",
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
                  GoRouter.of(context).go(RouteName.Login);
                },
                child: Text(
                  "Sudah punya akun? masuk disini.",
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
