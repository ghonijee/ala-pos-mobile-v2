import 'package:ala_pos/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/styles/styles.dart';
import '../../../shared/widget/button/button_component.dart';
import '../router/auth_router.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.sp,
                ),
                Text(
                  "Pendaftaran Berhasil",
                  style: primeTheme.typography.h1.copyWith(
                    color: primeTheme.foreground.dflt,
                  ),
                ),
                SizedBox(
                  height: AppSpacings.l.sp,
                ),
                Text(
                  "Aplikasi kasirmu sudah siap digunakan\nmulai berjualan sekarang dengan Alapos!.",
                  style: primeTheme.typography.normal.copyWith(color: primeTheme.foreground.muted),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                Assets.images.shop.svg(),
                Expanded(child: SizedBox()),
                ButtonFullText(
                  onPress: FormzStatus.invalid == FormzStatus.invalid
                      ? () {
                          context.router.navigateNamed(AuthRouteName.RegisterLoading);
                        }
                      : () {},
                  text: "Mulai Sekarang",
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(child: Assets.images.logo.logoPrimarySecond.svg(width: 40.sp)),
            ),
          ],
        ),
      ),
    );
  }
}
