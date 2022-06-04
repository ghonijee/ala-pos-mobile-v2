import 'package:atomic_design/atomic_design.dart';
import 'package:atomic_design/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              "Selamat Datang!",
              style: TextStyleFoundation.heading5.copyWith(color: ColorFoundation.textPrimaryDark),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Text(
              "Silahkan masuk terlebih dahulu untuk\nlanjut menggunakan aplikasi",
              style: TextStyleFoundation.caption.copyWith(color: ColorFoundation.textPrimaryDark),
            ),
            SizedBox(
              height: 32.sp,
            ),
            TextFormField(
              style: TextStyleFoundation.body2.copyWith(color: ColorFoundation.textPrimaryDark),
              decoration: InputDecoration(
                label: Text(
                  "Username / No HP",
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
                "Masuk",
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
                onPressed: () {},
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
