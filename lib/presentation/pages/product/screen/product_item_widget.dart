import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  const ProductItemWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      minLeadingWidth: 15.w,
      textColor: Theme.of(context).colorScheme.primary,
      leading: Container(
        alignment: Alignment.center,
        width: 20.w,
        height: 50.sp,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        child: Text(
          product.name.initial(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        product.stock.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
