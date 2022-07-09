import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class ProductFormStockWidget extends HookWidget {
  const ProductFormStockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: ExpansionTile(
          initiallyExpanded: true,
          collapsedBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Stok"),
          childrenPadding: EdgeInsets.symmetric(
            horizontal: AppSpacings.m.sp,
            // vertical: AppSpacings.m.sp,
          ),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Stok Produk *"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  // controller: discountProductField,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: "Jumlah Produk",
                    prefixStyle: Theme.of(context).textTheme.bodyText1,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSpacings.m.sp,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Minimal Stok"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  // controller: discountProductField,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: "0",
                    prefixStyle: Theme.of(context).textTheme.bodyText1,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
