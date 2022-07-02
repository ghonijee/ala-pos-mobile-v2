import 'package:ala_pos/routes/route_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'order_discount_screen.dart';

class ResumeOrderScreen extends StatelessWidget {
  const ResumeOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resume Order")),
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 55.h,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: false,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // context.push(RouteName.PosOrderItemEdit);
                      },
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSpacings.l.sp,
                      ),
                      title: Text(
                        "Pensil $index",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      trailing: Container(
                        constraints: BoxConstraints(
                          maxWidth: 20.w,
                          maxHeight: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "1 x ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "5.000",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Divider(
              height: AppSpacings.m,
            ),
            Container(
              constraints: BoxConstraints(minHeight: 8.h),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.s.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subotal",
                        style: Theme.of(context).textTheme.bodyMedium,
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
                        "Discount",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "10.000",
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
                        "Total",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "40.000",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
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
                vertical: AppSpacings.m.sp,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(45.w, 40.sp),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          // context.go(RouteName.Pos);
                        },
                        child: Text(
                          "Simpan Order",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(45.w, 40.sp),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return OrderDiscountScreen();
                            },
                          );
                        },
                        child: Text(
                          "Tambah Diskon",
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
                      // context.push(RouteName.PosPaymentCash);
                    },
                    child: Text(
                      "Lanjut Pembayaran",
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
