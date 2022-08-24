import 'package:ala_pos/presentation/pages/product/cubit/form/form_product_cubit.dart';
import 'package:ala_pos/presentation/pages/product/cubit/master/master_product_cubit.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_detail_widget.dart';
import 'package:ala_pos/presentation/pages/product/widgets/product_form_stock_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../widgets/product_form_main_widget.dart';

class ProductFormScreen extends HookWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formCubit = context.read<FormProductCubit>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          formCubit.isUpdate ? "Update Produk" : "Tambah Produk",
        ),
        actions: [
          InkWell(
            child: Icon(
              Ionicons.trash_outline,
              size: 15.sp,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 20.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.trash_outline,
                              size: 32.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: AppSpacings.l.sp,
                            ),
                            Text(
                              "Kamu ingin menghapus product ini?",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: AppSpacings.s.sp,
                            ),
                            Text(
                              "Item yang dihapus tidak dapat dipulihkan kembali",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(30.w, 40),
                            primary: Theme.of(context).colorScheme.onPrimary,
                          ),
                          child: Text(
                            "Batal",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(30.w, 40),
                            ),
                            onPressed: () {
                              formCubit.deleteProduct();
                              context.router.pop();
                              context.router.pop();
                            },
                            child: Text("Hapus"))
                      ],
                    );
                  });
            },
          ),
          SizedBox(
            width: AppSpacings.m.sp,
          )
        ],
      ),
      body: BlocListener<FormProductCubit, FormProductState>(
        listener: (context, state) {
          if (state.statusSubmission.isSubmissionFailure) {
            SnackbarMessage.failed(context, state.message);
          } else if (state.statusSubmission.isSubmissionSuccess) {
            context.read<MasterProductCubit>().getProductList(initialData: true);
            context.router.pop();
          }
        },
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40.sp),
              ),
              onPressed: state.status == FormzStatus.invalid || state.status == FormzStatus.pure
                  ? null
                  : () {
                      if (context.read<FormProductCubit>().isUpdate) {
                        context.read<FormProductCubit>().updateProduct();
                      } else {
                        context.read<FormProductCubit>().storeProduct();
                      }
                    },
              child: Text(
                context.read<FormProductCubit>().isUpdate ? "Update" : "Simpan",
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),
          );
        },
      ),
    );
  }
}
