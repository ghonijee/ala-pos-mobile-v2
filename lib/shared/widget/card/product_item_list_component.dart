import 'package:ala_pos/shared/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../feature/product/domain/models/product/product_model.dart';

class ProductItemListComponent extends StatefulWidget {
  const ProductItemListComponent({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductItemListComponent> createState() => _ProductItemListComponentState();
}

class _ProductItemListComponentState extends State<ProductItemListComponent> {
  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      textColor: Theme.of(context).colorScheme.primary,
      leading: Container(
        alignment: Alignment.center,
        width: 70.px,
        height: 70.px,
        color: primeTheme.brand.quaternary,
        child: Text(
          widget.productModel.name.initial(),
          style: primeTheme.typography.h3.copyWith(color: primeTheme.brand.primary),
        ),
      ),
      title: Text(
        widget.productModel.name,
        style: primeTheme.typography.normal,
      ),
      subtitle: Text(
        widget.productModel.price.toIDR(),
        style: primeTheme.typography.bold,
      ),
      // trailing: ,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Stok",
            style: primeTheme.typography.small,
          ),
          Text(
            widget.productModel.stock.toString(),
            style: primeTheme.typography.h4,
          ),
        ],
      ),
    );
  }
}
