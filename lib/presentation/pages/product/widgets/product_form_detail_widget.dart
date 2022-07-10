import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../cubit/form/form_product_cubit.dart';

class ProductFormDetailWidget extends HookWidget {
  const ProductFormDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var codeField = useTextEditingController();
    var descField = useTextEditingController();
    var costField = useTextEditingController();
    var unitField = useTextEditingController();

    var formProductCubit = context.read<FormProductCubit>();

    codeField.text = formProductCubit.state.code.value.toString();
    descField.text = formProductCubit.state.desc.value.toString();
    costField.text = formProductCubit.state.cost.value.toString();
    unitField.text = formProductCubit.state.unit.value.toString();

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
        );
      },
    );
  }
}
