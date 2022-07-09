import 'package:ala_pos/presentation/pages/product/cubit/form/form_product_cubit.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_detail_widget.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_stock_widget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class ProductFormScreen extends HookWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameField = useTextEditingController();
    var priceField = useTextEditingController();

    var formProductCubit = context.read<FormProductCubit>();
    nameField.text = formProductCubit.state.name.value;
    priceField.text = formProductCubit.state.price.value;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Produk"),
        actions: [],
      ),
      body: BlocConsumer<FormProductCubit, FormProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
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
                            controller: nameField,
                            style: Theme.of(context).textTheme.bodyText1,
                            onChanged: (value) => formProductCubit.nameChange(value),
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
                            controller: priceField,
                            onChanged: (value) => formProductCubit.priceChange(value),
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
              ProductFormStockWidget(),
              SizedBox(
                height: AppSpacings.m.sp,
              ),
              ProductFormDetailWidget(),
            ]),
          );
        },
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
