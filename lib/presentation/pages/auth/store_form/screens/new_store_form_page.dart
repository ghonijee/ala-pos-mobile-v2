import 'package:ala_pos/presentation/pages/auth/store_form/cubit/store_form_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core/styles/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../../routes/route_page.dart';

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
