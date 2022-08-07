import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/payment/payment_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:sizer/sizer.dart';

import '../cubit/submit_transaction/submit_transaction_cubit.dart';

class PaymentCashPage extends HookWidget {
  const PaymentCashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoading = useState(false);
    var resumeCubit = context.read<TransactionResumeCubit>();
    var paymentCubit = context.read<PaymentCubit>();
    var submitCubit = context.read<SubmitTransactionCubit>();

    paymentCubit.init(resumeCubit.state.model!);

    var cashField = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran")),
      body: SingleChildScrollView(
        child: BlocListener<SubmitTransactionCubit, SubmitTransactionState>(
          listener: (context, state) {
            state.maybeWhen(
              failed: (message, model) {
                isLoading.value = false;
                SnackbarMessage.failed(context, message);
              },
              loading: () {
                isLoading.value = true;
              },
              success: (model) {
                context.router.pushNamed(RouteName.posOrderSuccess);
              },
              orElse: () {
                isLoading.value = false;
                print(isLoading.value.toString());
              },
            );
          },
          child: BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              return Container(
                width: 100.w,
                height: 90.h,
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
                          "Pembayaran Diterima",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: AppSpacings.m,
                        ),
                        TextFormField(
                          controller: cashField,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          decoration: InputDecoration(hintText: "Masukkan nilai pembayaran"),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            }
                          },
                          inputFormatters: [
                            MoneyInputFormatter(
                              thousandSeparator: ThousandSeparator.Period,
                              mantissaLength: 0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSpacings.xl,
                    ),
                    SizedBox(
                      height: 150.sp,
                      child: GridView(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacings.m.sp,
                          vertical: AppSpacings.s.sp,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: AppSpacings.s.sp, mainAxisSpacing: AppSpacings.s.sp, childAspectRatio: 3 / 1),
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 1000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 1.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 2000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 2.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 5000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 5.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 10000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 10.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 20000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 20.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 50000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 50.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 100000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 100.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 150000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 150.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // maximumSize: Size.fromWidth(0.w),
                              primary: Theme.of(context).colorScheme.surface,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              cashField.text = 200000.toThousandSeparator();
                              paymentCubit.setPayment(cashField.text.toNumber()!);
                            },
                            child: Text(
                              "Rp. 200.000",
                              style: Theme.of(context).primaryTextTheme.button!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      constraints: BoxConstraints(minHeight: 18.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacings.m.sp,
                        vertical: AppSpacings.s.sp,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            height: AppSpacings.x3l,
                          ),
                          SizedBox(
                            height: AppSpacings.s.sp,
                          ),
                          BlocBuilder<SubmitTransactionCubit, SubmitTransactionState>(
                            builder: (context, stateSubmit) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(40.sp),
                                ),
                                onPressed: isLoading.value
                                    ? null
                                    : () {
                                        var check = paymentCubit.paymentValid();
                                        if (!check) {
                                          SnackbarMessage.failed(context, "Pembayaran masih kurang!");
                                        } else {
                                          var model = state.maybeWhen(orElse: () => null, loaded: (model) => model);
                                          submitCubit.submitData(model!);
                                          // paymentCubit.setPayment(cashField.text.toNumber()!);
                                        }
                                      },
                                child: isLoading.value
                                    ? CircularProgressIndicator()
                                    : Text(
                                        "Bayar",
                                        style: Theme.of(context).primaryTextTheme.button,
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
