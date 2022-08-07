import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sizer/sizer.dart';

import '../cubit/cart/cart_cubit.dart';

class CustomItemPage extends HookWidget implements AutoRouteWrapper {
  const CustomItemPage({Key? key}) : super(key: key);

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

    var namaProductField = useTextEditingController();
    var jumlahProductField = useTextEditingController();
    var hargaProductField = useTextEditingController();
    var discountProductField = useTextEditingController();
    var noteProductField = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Jual Produk Khusus"),
      ),
      body: Container(
        constraints: BoxConstraints.loose(
          Size.fromWidth(
            100.w,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSpacings.l, vertical: AppSpacings.m),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Produk"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  controller: namaProductField,
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
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
                Text("Jumlah Produk"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  controller: jumlahProductField,
                  decoration: InputDecoration(
                    hintText: "Jumlah item dijual",
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
                Text("Harga Produk"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  controller: hargaProductField,
                  inputFormatters: [
                    MoneyInputFormatter(
                      thousandSeparator: ThousandSeparator.Period,
                      mantissaLength: 0,
                    ),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: Text("Rp. "),
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
                Text("Diskon "),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  controller: discountProductField,
                  style: Theme.of(context).textTheme.bodyText1,
                  inputFormatters: [
                    MoneyInputFormatter(
                      thousandSeparator: ThousandSeparator.Period,
                      mantissaLength: 0,
                    ),
                  ],
                  decoration: InputDecoration(
                    // hintText: "Diskon untuk item ini",
                    prefix: Text("Rp. "),
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
                Text("Catatan Produk"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  controller: noteProductField,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi produk",
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
            Expanded(child: SizedBox()),
            Container(
              height: 55.sp,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromWidth(90.w),
                    ),
                    onPressed: () async {
                      var amount = jumlahProductField.text.toNumber()! * hargaProductField.text.toNumber()!;
                      var itemCart = TransactionItemModel(
                        productName: namaProductField.text,
                        amount: amount,
                        price: hargaProductField.text.toNumber()!,
                        quantity: jumlahProductField.text.toNumber()!,
                        note: noteProductField.text,
                        discountPrice: discountProductField.text.toNumber()!,
                      );

                      await cartCubit.addCustom(itemCart);
                      context.router.pop();
                    },
                    child: Text(
                      "Tambahkan",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
