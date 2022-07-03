import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentCashPage extends StatelessWidget {
  const PaymentCashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran")),
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 50.sp),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.s.sp,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "40.000",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              height: AppSpacings.m,
            ),
            SizedBox(
              height: AppSpacings.xl,
            ),
            Column(
              children: [
                Text(
                  "Pembayaran diterima",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: AppSpacings.m,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: InputDecoration(hintText: "Masukan nilai pembayaran"),
                ),
              ],
            ),
            SizedBox(
              height: AppSpacings.xl,
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacings.m.sp,
                  vertical: AppSpacings.s.sp,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: AppSpacings.s.sp,
                    mainAxisSpacing: AppSpacings.s.sp,
                    childAspectRatio: 3 / 1),
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 1,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 2,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 5,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 10,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 20,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 50,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size.fromWidth(0.w),
                      primary: Theme.of(context).colorScheme.surface,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rp. 100,000",
                      style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 130.sp,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.s.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kembalian",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "10.000",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: AppSpacings.m,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                    onPressed: () {
                      // context.push(RouteName.PosOrderSuccess);
                    },
                    child: Text(
                      "Bayar",
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
