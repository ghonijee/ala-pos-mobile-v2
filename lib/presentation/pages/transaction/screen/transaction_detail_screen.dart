import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Detail",
          // style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: AppSpacings.m),
              padding: EdgeInsets.symmetric(vertical: AppSpacings.s, horizontal: AppSpacings.m),
              height: 60.sp,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "No. Transaksi",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "TR202207010001",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Senin, 12 Juli 2022",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: AppSpacings.s.sp),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 0.2,
                          ),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            alignment: Alignment.center,
                            width: 15.w,
                            height: 40.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            ),
                            child: Text(
                              "Teh Gelas".initial(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSpacings.m.sp,
                          ),
                          title: Text(
                            "Product Name karuan",
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "12.000",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          trailing: Text("1 x Pcs"),
                        );
                      }),
                ],
              ),
            ),
            Container(
              // constraints: BoxConstraints(minHeight: 8.h),
              height: 80.sp,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
                vertical: AppSpacings.s.sp,
              ),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        "0",
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
                        "50.000",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 100.w,
        height: 60.sp,
        padding: EdgeInsets.symmetric(vertical: AppSpacings.m.sp, horizontal: AppSpacings.m),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, boxShadow: [
          BoxShadow(color: Theme.of(context).shadowColor),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.error,
                minimumSize: Size.fromWidth(45.w),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Ionicons.close_outline,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text(
                    "Batalkan",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                minimumSize: Size.fromWidth(45.w),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Ionicons.receipt_outline,
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text("Invoice"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
