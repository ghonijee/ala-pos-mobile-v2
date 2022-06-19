import 'package:ala_pos/presentation/pages/pos/data/pos_data.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderDiscountScreen extends StatelessWidget {
  const OrderDiscountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 100.w,
      padding: EdgeInsets.only(left: AppSpacings.l.sp, right: AppSpacings.l.sp, bottom: AppSpacings.xl.sp),
      child: Column(
        children: [
          SizedBox(
            height: AppSpacings.m,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacings.s),
            child: Text(
              "Tambahkan Diskon",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 20.w,
            endIndent: 20.w,
            height: AppSpacings.m.sp,
          ),
          SizedBox(
            height: AppSpacings.m.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Satuan Diskon",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: AppSpacings.s.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: DiscountType.cash,
                          groupValue: DiscountType.cash,
                          onChanged: (value) {
                            //
                          }),
                      Text("Cash")
                    ],
                  ),
                  SizedBox(
                    width: AppSpacings.x4l.sp,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: DiscountType.percent,
                          groupValue: DiscountType.cash,
                          onChanged: (value) {
                            //
                          }),
                      Text("Percent")
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: AppSpacings.l.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nilai Diskon",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: AppSpacings.s.sp,
              ),
              TextFormField()
            ],
          ),
          Expanded(
            child: SizedBox(
              height: AppSpacings.s.sp,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(40.sp),
            ),
            onPressed: () {
              //
            },
            child: Text(
              "Tambah Diskon",
              style: Theme.of(context).primaryTextTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
