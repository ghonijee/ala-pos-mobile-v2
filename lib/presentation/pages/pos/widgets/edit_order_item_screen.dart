import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class EditOrderItemScreen extends StatelessWidget {
  const EditOrderItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Produk"),
      ),
      body: Container(
        constraints: BoxConstraints.loose(Size(100.w, 90.h)),
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
                  decoration: InputDecoration(
                    hintText: "Harga Jual",
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
                Text("Diskon"),
                SizedBox(
                    // height: AppSpacings.s,
                    ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Diskon untuk item ini",
                    suffixText: "%",
                    suffixStyle: Theme.of(context).textTheme.bodyMedium,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40.sp),
              ),
              onPressed: () {
                // context.pop();
              },
              child: Text(
                "Simpan",
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),
            SizedBox(
              height: AppSpacings.m.sp,
            ),
          ],
        ),
      ),
    );
  }
}
