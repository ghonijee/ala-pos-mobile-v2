import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:sizer/sizer.dart';

import '../cubit/form/form_product_cubit.dart';

class ProductFormMainWidget extends HookWidget {
  const ProductFormMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formProductCubit = context.read<FormProductCubit>();

    return BlocBuilder<FormProductCubit, FormProductState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacings.m.sp,
            vertical: AppSpacings.m.sp,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama *"),
                TextFormField(
                  initialValue: state.name.value,
                  style: Theme.of(context).textTheme.bodyText1,
                  onChanged: (value) => formProductCubit.nameChange(value),
                  decoration: InputDecoration(
                    errorText: state.name.invalid ? state.name.error?.message : null,
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
                  // controller: priceField,
                  initialValue: state.price.value?.toThousandSeparator(),
                  onChanged: (value) => formProductCubit.priceChange(value.toNumber()),
                  style: Theme.of(context).textTheme.bodyText1,
                  inputFormatters: [
                    MoneyInputFormatter(
                      thousandSeparator: ThousandSeparator.Period,
                      mantissaLength: 0,
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: "Rp. 0",
                    errorText: state.price.invalid ? state.price.error?.message : null,
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
          ]),
        );
      },
    );
  }
}
