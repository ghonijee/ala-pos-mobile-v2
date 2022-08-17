import 'package:ala_pos/presentation/pages/auth/store_form/cubit/store_form_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../../domain/models/store/store_category_model.dart';
import '../../../../../routes/route_page.dart';
import '../../../../widgets/form_input/dropdown_custom.dart';

class NewStoreFormPage extends StatelessWidget {
  const NewStoreFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<StoreFormCubit>(),
      child: NewStoreFormScreen(),
    );
  }
}

class NewStoreFormScreen extends HookWidget {
  const NewStoreFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final addressController = useTextEditingController();
    final selectedCategory = useState<StoreCategoryModel?>(null);

    final cubit = context.read<StoreFormCubit>();

    return BlocConsumer<StoreFormCubit, StoreFormState>(
      listener: (context, state) {
        state.maybeWhen(
            success: () => context.router.replaceNamed(RouteName.posWrapper),
            failed: (message) {
              SnackbarMessage.failed(context, message);
            },
            orElse: () {
              //
            });
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Form(
              key: formKey.value,
              child: Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.all(AppSpacings.xl.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Masukan Nama\nUsahamu!",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: AppSpacings.m.sp,
                        ),
                        Icon(
                          Ionicons.storefront_outline,
                          size: 60.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    Text(
                      "Lengkapi informasi terkait usahamu\ndibawah ini.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: AppSpacings.xl.sp,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      controller: nameController,
                      decoration: InputDecoration(label: Text("Nama Usaha")),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      controller: addressController,
                      decoration: InputDecoration(label: Text("Alamat")),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      controller: phoneController,
                      decoration: InputDecoration(label: Text("No. Telp")),
                    ),
                    // SizedBox(
                    //   height: AppSpacings.l.sp,
                    // ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       height: 40.sp,
                    //       decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 204, 204, 204)))),
                    //       child: CustomDropDown<StoreCategoryModel>(
                    //         // defaultSelectedIndex: cubit.listCategory.indexWhere((element) => state.storeCategoryField.value!.id == element.id),
                    //         maxListHeight: 300,
                    //         hintText: "Pilih jenis usaha",
                    //         underline: false,
                    //         items: cubit.listCategory.map((e) => CustomDropdownMenuItem<StoreCategoryModel>(value: e, child: Text(e.name))).toList(),
                    //         onChanged: (StoreCategoryModel? value) {
                    //           cubit.changeCategory(value);
                    //           selectedCategory.value = value;
                    //         },
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 24.sp,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.value.currentState!.validate()) {
                          return;
                        }
                        cubit.submitted(nameController.text, addressController.text, phoneController.text);
                      },
                      child: state.maybeWhen(
                          submitted: () => CircularProgressIndicator(
                                color: Theme.of(context).primaryColorLight,
                              ),
                          orElse: () => Text(
                                "Simpan",
                                style: Theme.of(context).primaryTextTheme.button,
                              )),
                      style: ElevatedButton.styleFrom(
                        // primary: ColorFoundation.buttonAccent,
                        minimumSize: Size.fromHeight(40.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
