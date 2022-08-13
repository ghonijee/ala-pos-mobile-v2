import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:sizer/sizer.dart';

import '../cubit/form/form_product_cubit.dart';

class ProductFormStockWidget extends HookWidget {
  const ProductFormStockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formProductCubit = context.read<FormProductCubit>();

    var stockField = useTextEditingController();
    var minStockField = useTextEditingController();
    var formater = MoneyInputFormatter(
      thousandSeparator: ThousandSeparator.Period,
      mantissaLength: 0,
    );

    stockField.text = formProductCubit.state.stock.value.toString();
    minStockField.text = formProductCubit.state.minStock.value.toString();

    return BlocBuilder<FormProductCubit, FormProductState>(
      builder: (context, state) {
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
                    Text("Stok Produk"),
                    TextFormField(
                      key: Key("field_stock_product"),
                      initialValue: state.stock.value?.toThousandSeparator(),
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: (value) => formProductCubit.stockChange(value.toNumber()),
                      inputFormatters: [
                        formater,
                      ],
                      decoration: InputDecoration(
                        hintText: "Jumlah Produk",
                        errorText: state.stock.invalid ? state.stock.error!.message : null,
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
                      inputFormatters: [
                        formater,
                      ],
                      initialValue: formProductCubit.state.minStock.value?.toThousandSeparator(),
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: (value) => formProductCubit.minStockChange(value.toNumber()),
                      decoration: InputDecoration(
                        errorText: state.minStock.invalid ? state.minStock.error!.message : null,
                        hintText: "Minimal stock untuk peringatan",
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
      },
    );
  }
}
