import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/route_page.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.checkmark_done_circle_outline,
                    size: 80.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: AppSpacings.l,
                  ),
                  Text(
                    "Pembayaran Berhasil",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  SizedBox(
                    height: AppSpacings.l,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSpacings.m.sp, vertical: AppSpacings.s.sp),
                    padding: EdgeInsets.symmetric(horizontal: AppSpacings.m.sp, vertical: AppSpacings.s.sp),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(AppSpacings.m)),
                        border: Border.all(color: Theme.of(context).colorScheme.primary)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "50.000",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSpacings.s.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bayar",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "50.000",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSpacings.s.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kembalian",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: AppSpacings.m,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.l.sp,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Ionicons.print_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(45.w, 40.sp),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          context.go(RouteName.Pos);
                        },
                        label: Text(
                          "Cetak Struk",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(
                          Ionicons.share_social_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(45.w, 40.sp),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          //
                        },
                        label: Text(
                          "Share Struk",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSpacings.s.sp,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                    onPressed: () {
                      context.go(RouteName.Pos);
                    },
                    child: Text(
                      "Selesai",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
