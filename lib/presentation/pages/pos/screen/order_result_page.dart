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
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: state.maybeWhen(
                success: (model) {
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
                                Ionicons.checkmark_circle_outline,
                                size: 60.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                height: AppSpacings.l,
                              ),
                              Text(
                                "Pembayaran Berhasil",
                                style: Theme.of(context).textTheme.headline6!.copyWith(
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
                                      context.router.pushNamed(RouteName.receiptScreen);
                                    },
                                    label: Text(
                                      "Lihat Struk",
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
                                  cartCubit.resetCart();
                                  context.router.replaceAll([PosPageRoute()]);
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
