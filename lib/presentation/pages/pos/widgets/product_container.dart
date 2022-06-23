import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductContainer extends StatelessWidget {
  final ProductModel product;
  const ProductContainer(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.sp,
      height: 90.sp,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      child: Stack(children: [
        Container(
          width: 102.sp,
          height: 90.sp,
          decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.,
              ),
          child: Center(
              child: Text(
            product.name.initial(),
            style: Theme.of(context).textTheme.headline4,
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(top: AppSpacings.s, right: AppSpacings.s, left: AppSpacings.s),
            width: 102.sp,
            height: 35.sp,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.titleProduct,
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
                Text(
                  product.price.toString(),
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
