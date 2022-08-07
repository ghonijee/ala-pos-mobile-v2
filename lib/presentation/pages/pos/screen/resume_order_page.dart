import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ResumeOrderPage extends HookWidget {
  const ResumeOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var resumeCubit = BlocProvider.of<TransactionResumeCubit>(context);

    return BlocBuilder<TransactionResumeCubit, TransactionResumeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Keranjang"),
            actions: [
              // TextButton.icon(
              //   icon: Icon(
              //     Ionicons.close_outline,
              //     color: Theme.of(context).primaryColorDark,
              //   ),
              //   label: Text(
              //     "Bersihkan",
              //     style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColorDark),
              //   ),
              //   onPressed: () {
              //     cartCubit.resetCart();
              //   },
              // )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: 100.w,
              height: 90.h,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
              child: state.model!.items!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/empty/cart_empty.png"),
                          Text("Belum ada produk ditambahkan"),
                          SizedBox(
                            height: AppSpacings.xl.sp,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                            onPressed: () {
                              context.router.pop();
                            },
                            child: Text("Kembali"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        BlocConsumer<CartCubit, CartState>(
                          listener: (context, state) {
                            resumeCubit.init(
                              cartCubit.state.items.toList(),
                            );
                          },
                          builder: (context, state) {
                            return SizedBox(
                              width: 100.w,
                              height: 55.h,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                        height: 0,
                                        thickness: 0.2,
                                      ),
                                  shrinkWrap: false,
                                  itemCount: state.items.length,
                                  itemBuilder: (context, index) {
                                    TransactionItemModel itemModel = state.items[index];
                                    return ListTile(
                                      onTap: () {
                                        var routeName = RouteName.posCartItemDetail.replaceFirst(":index", index.toString());
                                        context.router.pushNamed(routeName);
                                      },
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: AppSpacings.m.sp,
                                      ),
                                      title: Text(
                                        itemModel.productName,
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          itemModel.discountPrice > 0
                                              ? Text.rich(
                                                  TextSpan(
                                                    text: itemModel.price.toIDR(),
                                                    style: TextStyle(decoration: TextDecoration.lineThrough),
                                                    children: [
                                                      TextSpan(
                                                        text: " " + itemModel.result.toIDR(),
                                                        style: TextStyle(
                                                          decoration: TextDecoration.none,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Text(
                                                  itemModel.result.toIDR(),
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                          Text(
                                            itemModel.note ?? "",
                                            style: Theme.of(context).textTheme.caption,
                                          ),
                                        ],
                                      ),
                                      trailing: SizedBox(
                                        width: 85.sp,
                                        height: 10.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: itemModel.quantity == 1
                                                  ? null
                                                  : () {
                                                      cartCubit.decrease(itemModel);
                                                    },
                                              icon: Icon(Ionicons.remove_circle_outline),
                                            ),
                                            Text(itemModel.quantity.toString()),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                cartCubit.increase(itemModel);
                                              },
                                              icon: Icon(Ionicons.add_circle_outline),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          },
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
                                    "Subtotal",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    state.model!.amount!.toIDR(),
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
                                    state.model!.discountPrice!.toIDR(),
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
                                    state.model!.result.toIDR(),
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacings.m.sp,
                            vertical: AppSpacings.m.sp,
                          ),
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              // ElevatedButton(
                              //   style: ElevatedButton.styleFrom(
                              //     fixedSize: Size(45.w, 40.sp),
                              //     primary: Theme.of(context).colorScheme.surface,
                              //     side: BorderSide(color: Theme.of(context).primaryColor),
                              //   ),
                              //   onPressed: () {
                              //     // context.go(RouteName.Pos);
                              //   },
                              //   child: Text(
                              //     "Simpan Order",
                              //     style: Theme.of(context)
                              //         .primaryTextTheme
                              //         .button!
                              //         .copyWith(color: Theme.of(context).primaryColor),
                              //   ),
                              // ),
                              // ],
                              // ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(40.sp),
                                  primary: Theme.of(context).colorScheme.surface,
                                  side: BorderSide(color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return OrderDiscountPage();
                                    },
                                  );
                                },
                                child: Text(
                                  "Tambahkan Diskon",
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
                                  // context.push(RouteName.PosPaymentCash);
                                  context.router.pushNamed(RouteName.posPaymentCash);
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
            ),
          ),
        );
      },
    );
  }
}
