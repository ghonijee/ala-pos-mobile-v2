import 'package:ala_pos/presentation/pages/product/cubit/form/form_product_cubit.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_detail_widget.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_stock_widget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:sizer/sizer.dart';

import '../widgets/product_form_main_widget.dart';

class ProductFormScreen extends HookWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Produk"),
        actions: [],
      ),
      body: BlocListener<FormProductCubit, FormProductState>(
        listener: (context, state) {},
        child: SingleChildScrollView(
          child: Column(children: [
            ProductFormMainWidget(),
            SizedBox(
              height: AppSpacings.m.sp,
            ),
            ProductFormStockWidget(),
            SizedBox(
              height: AppSpacings.m.sp,
            ),
            ProductFormDetailWidget(),
          ]),
        ),
      ),
      bottomNavigationBar: BlocBuilder<FormProductCubit, FormProductState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacings.m.sp,
              vertical: AppSpacings.l.sp,
            ),
            child: context.read<FormProductCubit>().isUpdate
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                    onPressed: state.status == FormzStatus.invalid
                        ? null
                        : () {
                            context.read<FormProductCubit>().updateProduct();
                          },
                    child: Text(
                      "Update",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                    onPressed: state.status == FormzStatus.invalid
                        ? null
                        : () {
                            context.read<FormProductCubit>().storeProduct();
                          },
                    child: Text(
                      "Simpan",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
