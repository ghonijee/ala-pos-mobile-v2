import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sizer/sizer.dart';

import '../cubit/cart/cart_cubit.dart';

class CartItemDetailPage extends HookWidget implements AutoRouteWrapper {
  const CartItemDetailPage({Key? key, @PathParam('index') required this.indexItem}) : super(key: key);

  final int indexItem;

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

    var itemCart = useState(cartCubit.state.items[indexItem]);
    var namaProductField = useTextEditingController(text: itemCart.value.productName);
    var jumlahProductField = useTextEditingController(text: itemCart.value.quantity.toString());
    var hargaProductField = useTextEditingController(text: itemCart.value.price.toString());
    var discountProductField = useTextEditingController(text: itemCart.value.discountPrice.toString());
    var noteProductField = useTextEditingController(text: itemCart.value.note ?? "");

    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Detail Produk"),
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
                    hintText: "Nama Product",
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
                    hintText: "Jumlah Item",
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
                    hintText: "Catatan tambahan",
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
                  ElevatedButton.icon(
                    icon: Icon(
                      Ionicons.trash_sharp,
                      color: Theme.of(context).colorScheme.primary,
                      size: 15.sp,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.background,
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      minimumSize: Size.fromWidth(45.w),
                    ),
                    onPressed: () {
                      // context.pop();
                      cartCubit.deleteItem(indexItem);
                      context.router.pop();
                    },
                    label: Text(
                      "Hapus",
                      style: Theme.of(context).primaryTextTheme.button?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  // SizedBox(
                  //   width: AppSpacings.m.sp,
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromWidth(45.w),
                    ),
                    onPressed: () async {
                      // context.pop();
                      // context.router.pop();

                      itemCart.value.productName = namaProductField.text;
                      itemCart.value.price = hargaProductField.text.toNumber()!;
                      itemCart.value.quantity = jumlahProductField.text.toNumber()!;
                      itemCart.value.discountPrice = discountProductField.text.toNumber()!;
                      itemCart.value.note = noteProductField.text;
                      await cartCubit.updateItem(itemCart.value, indexItem);
                      context.router.pop();
                    },
                    child: Text(
                      "Simpan",
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
