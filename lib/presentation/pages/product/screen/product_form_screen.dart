import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/side_menu/widgets/side_menu_widget.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Produk"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacings.m.sp,
              vertical: AppSpacings.m.sp,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama *"),
                      SizedBox(
                          // height: AppSpacings.s,
                          ),
                      TextFormField(
                        // controller: discountProductField,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: "Nama Produk",
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
                      Text("Harga *"),
                      SizedBox(
                          // height: AppSpacings.s,
                          ),
                      TextFormField(
                        // controller: discountProductField,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: "Rp. 0",
                          // prefix: Text("Rp. "),
                          // prefixText: "Rp. ",
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
          ),
          SizedBox(
            height: AppSpacings.m.sp,
          ),
          Container(
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
          ),
          SizedBox(
            height: AppSpacings.m.sp,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: ExpansionTile(
              collapsedBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("Detail"),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: AppSpacings.m.sp,
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kode / SKU Produk"),
                    TextFormField(
                      // controller: discountProductField,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "SKU",
                        prefixStyle: Theme.of(context).textTheme.bodyText1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            //
                          },
                          child: Icon(
                            Ionicons.barcode_outline,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
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
                    Text("Modal Produk"),
                    TextFormField(
                      // controller: discountProductField,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "Rp. 0",
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
                    Text("Deskripsi"),
                    TextFormField(
                      // controller: discountProductField,
                      minLines: 3,
                      maxLines: 5,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "Deskripsi",
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
                    Text("Satuan / Unit"),
                    TextFormField(
                      // controller: discountProductField,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "Kg/Lembar/Lusin dll.",
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
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacings.m.sp,
          vertical: AppSpacings.l.sp,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(40.sp),
          ),
          onPressed: () {},
          child: Text(
            "Simpan",
            style: Theme.of(context).primaryTextTheme.button,
          ),
        ),
      ),
    );
  }
}
