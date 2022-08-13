import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../cubit/form/form_product_cubit.dart';

class ProductFormDetailWidget extends HookWidget {
  const ProductFormDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formProductCubit = context.read<FormProductCubit>();

    var codeController = useTextEditingController();
    codeController.text = formProductCubit.state.code.value ?? "";

    return BlocBuilder<FormProductCubit, FormProductState>(
      builder: (context, state) {
        return Container(
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
                  Text("Kode Produk/SKU (Stock Keeping Unit)"),
                  TextFormField(
                    controller: codeController,
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (value) => formProductCubit.codeChange(value),
                    decoration: InputDecoration(
                      hintText: "SKU",
                      prefixStyle: Theme.of(context).textTheme.bodyText1,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          String barcodeScanRes;

                          try {
                            barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                              '#ff6666',
                              'Cancel',
                              true,
                              ScanMode.BARCODE,
                            );

                            formProductCubit.codeChange(barcodeScanRes);
                            codeController.text = barcodeScanRes;
                          } on PlatformException {
                            barcodeScanRes = 'Failed to get platform version.';
                          }
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
                  Text("Harga Modal Per Item"),
                  TextFormField(
                    initialValue: formProductCubit.state.cost.value.toThousandSeparator(),
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (value) => formProductCubit.costChange(value.toNumber()!),
                    inputFormatters: [
                      MoneyInputFormatter(
                        thousandSeparator: ThousandSeparator.Period,
                        mantissaLength: 0,
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: "Rp. 0",
                      helperText: "Isikan harga kulakan untuk menghitung keuntungan",
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
                    initialValue: formProductCubit.state.desc.value,
                    minLines: 3,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (value) => formProductCubit.descChange(value),
                    decoration: InputDecoration(
                      hintText: "Tuliskan deskripsi produk ",
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
                  Text("Satuan"),
                  TextFormField(
                    initialValue: formProductCubit.state.unit.value,
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (value) => formProductCubit.unitChange(value),
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
        );
      },
    );
  }
}
