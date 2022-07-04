import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/payment/payment_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:sizer/sizer.dart';

class PaymentCashPage extends HookWidget {
  const PaymentCashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resumeCubit = context.read<TransactionResumeCubit>();
    var paymentCubit = context.read<PaymentCubit>();

    paymentCubit.init(resumeCubit.state.model!);

    var cashField = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran")),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("builder");
          return Container(
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
                      state.maybeWhen(loaded: (model) {
                        return Text(
                          model.result.toIDR(),
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                        );
                      }, orElse: () {
                        return Text(
                          "-",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                        );
                      }),
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
                      controller: cashField,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(hintText: "Masukan nilai pembayaran"),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        }
                      },
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
                        onPressed: () {
                          cashField.text = "1000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 1,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "2000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 2,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "5000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 5,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "10000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 10,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "20000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 20,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "50000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 50,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: Size.fromWidth(0.w),
                          primary: Theme.of(context).colorScheme.surface,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          cashField.text = "100000";
                          paymentCubit.setPayment(cashField.text.toNumber()!);
                        },
                        child: Text(
                          "Rp. 100,000",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button!
                              .copyWith(color: Theme.of(context).primaryColor),
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
                          state.maybeWhen(loaded: (model) {
                            return Text(
                              model.changeMoney!.toIDR(),
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            );
                          }, orElse: () {
                            return Text(
                              "-",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            );
                          }),
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
                          var check = paymentCubit.paymentValid();
                          if (!check) {
                            SnackbarMessage.failed(context, "Pembayaran masih kurang!");
                          } else {
                            print("Success");
                          }
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
          );
        },
      ),
    );
  }
}
