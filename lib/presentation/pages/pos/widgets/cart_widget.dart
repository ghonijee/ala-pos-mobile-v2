import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacings.m),
            child: Text(
              "Keranjang Belanjaan",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Divider(
            height: AppSpacings.m,
          ),
          Container(
            height: 55.h,
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSpacings.m.sp,
                    ),
                    title: Text("Pensil $index"),
                    subtitle: Text(
                      "5.000",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    trailing: Container(
                      width: 20.w,
                      height: 10.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Ionicons.add_circle_outline),
                          Text("1"),
                          Icon(Ionicons.remove_circle_outline),
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacings.m.sp,
              vertical: AppSpacings.m.sp,
            ),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40.sp),
                  ),
                  onPressed: () {
                    //
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
    );
  }
}
