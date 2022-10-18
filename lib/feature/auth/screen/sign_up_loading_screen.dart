import 'package:ala_pos/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/styles/styles.dart';
import '../router/auth_router.dart';

class SignUpLoadingScreen extends HookConsumerWidget {
  const SignUpLoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primeTheme = PrimerTheme.of(context);

    Future.delayed(Duration(seconds: 5), () {
      context.router.pushNamed(AuthRouteName.RegisterSuccess);
    });

    return Scaffold(
      body: Container(
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
                  "Memproses Data",
                  style: primeTheme.typography.h1.copyWith(
                    color: primeTheme.foreground.dflt,
                  ),
                ),
                SizedBox(
                  height: AppSpacings.l.sp,
                ),
                Text(
                  "Aplikasi kasirmu sedang disiapkan,\nselanjutnya usahamu akan semakin mudah dikelola",
                  style: primeTheme.typography.normal.copyWith(color: primeTheme.foreground.muted),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                Assets.images.rocketLoading.svg(),
                SizedBox(
                  height: AppSpacings.x4l.sp,
                ),
                SpinKitCircle(
                  color: primeTheme.brand.primary,
                  size: 24.sp,
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
