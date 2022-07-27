import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/submit_transaction/submit_transaction_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class OrderResultPage extends HookWidget {
  const OrderResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var submitCubit = context.read<SubmitTransactionCubit>();
    var cartCubit = context.read<CartCubit>();

    return BlocConsumer<SubmitTransactionCubit, SubmitTransactionState>(
      listener: (context, state) {
        state.maybeWhen(failed: (message, model) {
          SnackbarMessage.failed(context, "Submit Data Gagal!, $message");
        }, orElse: () {
          //
        });
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: state.maybeWhen(
                success: (model) {
                  return SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: AppSpacings.s.sp, vertical: AppSpacings.s.sp),
                          padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp, vertical: AppSpacings.x4l.sp),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.all(Radius.circular(AppSpacings.m)),
                              // border: Border.all(
                              //   color: Theme.of(context).colorScheme.primary,
                              // ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0.75,
                                  blurRadius: 1.25,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Ionicons.checkmark_circle,
                                size: 75.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                height: 24.sp,
                              ),
                              Text(
                                "Pembayaran Berhasil",
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: AppSpacings.m,
                              ),
                              Text(
                                "Transaksi berhasil dibuat, \nsilahkan cetak struk!",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                              ),
                              Divider(
                                height: 40.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    model.result.toIDR(),
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSpacings.xl.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bayar",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    model.receivedMoney!.toIDR(),
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSpacings.xl.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Kembalian",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    model.changeMoney!.toIDR(),
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 36.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    icon: Icon(
                                      Ionicons.print_sharp,
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(40.w, 40.sp),
                                      primary: Theme.of(context).colorScheme.primary,
                                      side: BorderSide(color: Theme.of(context).primaryColor),
                                    ),
                                    onPressed: () {
                                      context.router.push(
                                        ReceiptPageRoute(transactionModel: model),
                                      );
                                    },
                                    label: Text(
                                      "Cetak Struk",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .button!
                                          .copyWith(color: Theme.of(context).colorScheme.surface),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    icon: Icon(
                                      Ionicons.checkmark,
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(40.w, 40.sp),
                                    ),
                                    onPressed: () {
                                      cartCubit.resetCart();
                                      context.router.replaceAll([PosPageRoute()]);
                                    },
                                    label: Text(
                                      "Selesai",
                                      style: Theme.of(context).primaryTextTheme.button,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                failed: (message, model) {
                  return SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.close_circle,
                                size: 80.sp,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              SizedBox(
                                height: AppSpacings.l,
                              ),
                              Text(
                                "Pembayaran Gagal",
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Theme.of(context).colorScheme.error,
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
                                          model.result.toIDR(),
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
                                          model.receivedMoney!.toIDR(),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          model.changeMoney!.toIDR(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontWeight: FontWeight.bold),
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
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(40.sp),
                                ),
                                onPressed: () {
                                  submitCubit.submitData(model);
                                },
                                child: Text(
                                  "Coba Lagi",
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
                orElse: () => SizedBox()));
      },
    );
  }
}
