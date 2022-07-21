import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/cart/cart_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../cubit/resume/transaction_resume_cubit.dart';

class CartPage extends HookWidget implements AutoRouteWrapper {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CartCubit>(context),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var resumeCubit = BlocProvider.of<TransactionResumeCubit>(context);

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        resumeCubit.init(
          cartCubit.state.items.toList(),
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Keranjang"),
          ),
          body: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
            child: Column(
              children: [
                Expanded(
                  // height: 50.h,
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
                            width: 80.sp,
                            height: 10.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    cartCubit.increase(itemModel);
                                  },
                                  icon: Icon(Ionicons.add_circle_outline),
                                ),
                                Text(itemModel.quantity.toString()),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: itemModel.quantity == 1
                                      ? null
                                      : () {
                                          cartCubit.decrease(itemModel);
                                        },
                                  icon: Icon(Ionicons.remove_circle_outline),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Divider(
                  height: AppSpacings.m,
                  thickness: 0.8,
                ),
                Container(
                  height: 15.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacings.m.sp,
                    vertical: AppSpacings.m.sp,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.amountPrice.toIDR(),
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSpacings.m,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40.sp),
                        ),
                        onPressed: () {
                          // context.push(RouteName.PosOrderResume);
                          context.router.pushNamed(RouteName.posOrderResume);
                        },
                        child: Text(
                          "Checkout",
                          style: Theme.of(context).primaryTextTheme.button,
                        ),
                      ),
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
