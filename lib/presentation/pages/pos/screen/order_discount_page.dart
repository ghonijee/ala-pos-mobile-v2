import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:sizer/sizer.dart';

class OrderDiscountPage extends HookWidget {
  const OrderDiscountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resumeCubit = BlocProvider.of<TransactionResumeCubit>(context);
    var model = resumeCubit.state.model;
    var discountField = useTextEditingController(text: model!.discountPrice!.toThousandSeparator());

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
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Satuan Diskon",
          //       style: Theme.of(context).textTheme.bodyMedium,
          //     ),
          //     SizedBox(
          //       height: AppSpacings.s.sp,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Radio(
          //                 value: DiscountType.cash,
          //                 groupValue: DiscountType.cash,
          //                 onChanged: (value) {
          //                   //
          //                 }),
          //             Text("Cash")
          //           ],
          //         ),
          //         SizedBox(
          //           width: AppSpacings.x4l.sp,
          //         ),
          //         Row(
          //           children: [
          //             Radio(
          //                 value: DiscountType.percent,
          //                 groupValue: DiscountType.cash,
          //                 onChanged: (value) {
          //                   //
          //                 }),
          //             Text("Percent")
          //           ],
          //         ),
          //       ],
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: AppSpacings.l.sp,
          // ),
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
              TextFormField(
                inputFormatters: [
                  MoneyInputFormatter(
                    thousandSeparator: ThousandSeparator.Period,
                    mantissaLength: 0,
                  ),
                ],
                controller: discountField,
              )
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
              primary: Theme.of(context).colorScheme.surface,
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              resumeCubit.applyDiscount(0);
              context.router.pop();
            },
            child: Text(
              "Hapus Diskon",
              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: AppSpacings.s.sp,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(40.sp),
            ),
            onPressed: () {
              resumeCubit.applyDiscount(discountField.text.toNumber());
              context.router.pop();
            },
            child: Text(
              "Terapkan Diskon",
              style: Theme.of(context).primaryTextTheme.button,
            ),
          ),
          // SizedBox(
          //   height: AppSpacings.m,
          // ),
        ],
      ),
    );
  }
}
