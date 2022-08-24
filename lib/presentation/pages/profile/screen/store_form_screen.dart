import 'package:ala_pos/domain/models/store/store_category_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/form_input/dropdown_custom.dart';
import '../cubit/form_store/form_store_cubit.dart';
import '../cubit/user/user_profile_cubit.dart';

class StoreFormScreen extends StatelessWidget {
  const StoreFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formCubit = context.read<FormStoreCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Ionicons.arrow_back_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () async {
            await context.read<UserProfileCubit>().refreshUserData();
            context.router.pop();
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Ubah Profil Usaha",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: AppSpacings.l.sp),
        padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 80.h,
            child: BlocConsumer<FormStoreCubit, FormStoreState>(
              listener: (context, state) async {
                if (state.statusSubmission.isSubmissionSuccess) {
                  context.router.pop();
                  SnackbarMessage.failed(context, state.message);
                } else if (state.statusSubmission.isSubmissionFailure) {
                  SnackbarMessage.failed(context, state.message);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    _StoreNameField(),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    _AddressField(),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    _PhoneField(),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    _StoreCategoryField(),
                    // SizedBox(
                    //   height: AppSpacings.m.sp,
                    // ),
                    // _UseStockOpnameToggle(),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40.sp)),
                        onPressed: state.status == FormzStatus.invalid
                            ? null
                            : () {
                                formCubit.submit();
                              },
                        child: Text(
                          "Simpan Perubahan",
                          style: Theme.of(context).primaryTextTheme.button,
                        ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreNameField extends StatelessWidget {
  const _StoreNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormStoreCubit>();

    return BlocBuilder<FormStoreCubit, FormStoreState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Usaha *"),
            TextFormField(
              initialValue: state.storeNameField.value,
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: (value) => cubit.changeStoreName(value),
              decoration: InputDecoration(
                errorText: state.storeNameField.invalid ? state.storeNameField.error?.message : null,
                hintText: "Isikan nama usahamu!",
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
        );
      },
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormStoreCubit>();

    return BlocBuilder<FormStoreCubit, FormStoreState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alamat *"),
            TextFormField(
              initialValue: state.addressField.value,
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: (value) => cubit.changeAddress(value),
              decoration: InputDecoration(
                errorText: state.addressField.invalid ? state.addressField.error?.message : null,
                hintText: "Dimana alamat usahamu?",
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
        );
      },
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormStoreCubit>();

    return BlocBuilder<FormStoreCubit, FormStoreState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nomor Telfon"),
            TextFormField(
              initialValue: state.phoneField.value,
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: (value) => cubit.changePhone(value),
              decoration: InputDecoration(
                errorText: state.phoneField.invalid ? state.phoneField.error?.message : null,
                hintText: "Nomor telfon usahamu!",
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
        );
      },
    );
  }
}

class _StoreCategoryField extends StatelessWidget {
  const _StoreCategoryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormStoreCubit>();
    return BlocBuilder<FormStoreCubit, FormStoreState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jenis Usaha"),
            SizedBox(
              height: 40.sp,
              child: CustomDropDown<StoreCategoryModel>(
                defaultSelectedIndex: cubit.listCategory.indexWhere((element) => state.storeCategoryField.value!.id == element.id),
                maxListHeight: 300,
                hintText: "Pilih jenis usaha",
                // value: cubit.listCategory.first,
                items: cubit.listCategory.map((e) => CustomDropdownMenuItem<StoreCategoryModel>(value: e, child: Text(e.name))).toList(),
                onChanged: (StoreCategoryModel? value) {
                  cubit.changeCategory(value);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
