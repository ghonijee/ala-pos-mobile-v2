import 'package:ala_pos/presentation/pages/transaction/cubit/transaction_detail/transaction_detail_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detailCubit = context.read<TransactionDetailCubit>();
    return BlocConsumer<TransactionDetailCubit, TransactionDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(
              "Detail",
            ),
            actions: [],
          ),
          body: BlocBuilder<TransactionDetailCubit, TransactionDetailState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (item) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: AppSpacings.m),
                          padding: EdgeInsets.symmetric(vertical: AppSpacings.s, horizontal: AppSpacings.m),
                          height: 80.sp,
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
                                    item.invoiceNumber!,
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
                                    DateFormat("EEEE, dd-MM-y", "id").format(item.date!),
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
                                  itemCount: item.items!.length,
                                  itemBuilder: (context, index) {
                                    var transactionItem = item.items![index];
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
                                          transactionItem.productName.initial(),
                                          style: Theme.of(context).textTheme.headline5,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: AppSpacings.m.sp,
                                      ),
                                      title: Text(
                                        transactionItem.productName,
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        transactionItem.result.toIDR(),
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                      trailing: Text("x ${transactionItem.quantity.toString()} Pcs"),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          // constraints: BoxConstraints(minHeight: 8.h),
                          // height: 80.sp,
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
                                    "Subtotal",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    item.amount!.toIDR(),
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
                                    "Diskon",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    item.discountPrice!.toIDR(),
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
                                    item.result.toIDR(),
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                orElse: () {
                  return SizedBox();
                },
              );
            },
          ),
          bottomNavigationBar: Container(
            width: 100.w,
            height: 60.sp,
            padding: EdgeInsets.symmetric(vertical: AppSpacings.m.sp, horizontal: AppSpacings.m),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, boxShadow: [
              BoxShadow(color: Theme.of(context).shadowColor),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     side: BorderSide(color: Theme.of(context).primaryColor),
                //     primary: Theme.of(context).colorScheme.background,
                //     minimumSize: Size.fromWidth(5.w),
                //     textStyle: Theme.of(context).textTheme.bodyMedium,
                //   ),
                //   onPressed: () {},
                //   child: Row(
                //     children: [
                //       Icon(
                //         Ionicons.ellipsis_vertical_outline,
                //         size: 18.sp,
                //         color: Theme.of(context).primaryColor,
                //       ),
                //       // SizedBox(
                //       //   width: AppSpacings.s.sp,
                //       // ),
                //       // Text(
                //       //   ,
                //       //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),
                //       // ),
                //     ],
                //   ),
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    minimumSize: Size.fromWidth(90.w),
                  ),
                  onPressed: () {
                    state.maybeWhen(loaded: (item) {
                      context.router.push(
                        ReceiptPageRoute(transactionModel: item),
                      );
                    }, orElse: () {
                      SnackbarMessage.failed(context, "Maaf!, gagal membuat struk");
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.receipt_outline,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: AppSpacings.s.sp,
                      ),
                      Text("Struk"),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
