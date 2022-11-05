import 'package:ala_pos/feature/auth/provider/list_store_category_provider.dart';
import 'package:ala_pos/feature/auth/provider/store_register_provider.dart';
import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/shared/fields/store_name_field.dart';
import 'package:ala_pos/shared/styles/app_spacing.dart';
import 'package:ala_pos/shared/widget/button/button_full_component.dart';
import 'package:ala_pos/shared/widget/form/dropdown_component.dart';
import 'package:ala_pos/shared/widget/form/text_area_form_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../router/auth_router.dart';
import '../state/store/store_register_state.dart';

class NewStoreFormScreen extends HookConsumerWidget {
  const NewStoreFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primeTheme = PrimerTheme.of(context);

    var listStoreCategory = ref.watch(listStoreCategoryProvider);
    var controller = ref.read(storeRegisterProvider.notifier);
    var state = ref.watch(storeRegisterProvider);

    ref.listen<StoreRegisterState>(storeRegisterProvider, (previous, next) {
      if (next.statusSubmission.isSubmissionFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
          ),
        );
      } else if (next.statusSubmission.isSubmissionSuccess) {
        context.router.pushNamed(AuthRouteName.RegisterLoading);
      }
    });

    return Scaffold(
      backgroundColor: primeTheme.canvas.inset,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
            width: 100.w,
            height: 95.h,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.router.pop();
                          },
                          child: Icon(Ionicons.arrow_back),
                        ),
                        Text(
                          "2/2",
                          style: primeTheme.typography.normal.copyWith(
                            color: primeTheme.foreground.dflt,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      "Informasi Usaha",
                      style: primeTheme.typography.h1.copyWith(
                        color: primeTheme.foreground.dflt,
                      ),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    Text("Masukan beberapa informasi dibawah ini untuk mendaftar akun Alapos.", style: primeTheme.typography.normal.copyWith(color: primeTheme.foreground.muted)),
                    SizedBox(
                      height: AppSpacings.x2l.sp,
                    ),
                    // _FieldUsername(),
                    TextFieldComponent(
                      labelText: "Nama Usaha",
                      onChange: (value) => controller.changeName(value),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFieldComponent(
                      labelText: "Nomor Handphone Toko",
                      onChange: (value) => controller.changePhone(value),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    DropdownComponent<StoreCategoryModel>(
                      hintText: "Pilih Kategori Usaha",
                      labelText: "Kategori",
                      items: listStoreCategory.isLoading
                          ? []
                          : listStoreCategory.value!.map((e) {
                              return DropdownComponentMenuItem(
                                  value: e,
                                  child: Text(
                                    e.name,
                                    style: primeTheme.typography.normal.copyWith(
                                      color: primeTheme.foreground.dflt,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ));
                            }).toList(),
                      onChanged: (value) => controller.changeCategory(value),
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextAreaComponent(
                      labelText: "Alamat Usaha",
                      onChange: (value) => controller.changeAddress(value),
                    ),
                    SizedBox(
                      height: AppSpacings.x4l,
                    ),
                    ButtonFullText(
                      onPress: state.formStoreStatus == FormzStatus.valid
                          ? () {
                              // context.router.pushNamed(AuthRouteName.RegisterLoading);
                              controller.submit();
                            }
                          : null,
                      text: "Daftar Sekarang",
                      isLoading: state.statusSubmission == FormzStatus.submissionInProgress,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () {
                    //       context.router.navigateNamed(AuthRouteName.Login);
                    //     },
                    //     child: RichText(
                    //       text: TextSpan(
                    //         text: "Sudah punya akun? ",
                    //         style: primeTheme.typography.normal,
                    //         children: [
                    //           TextSpan(
                    //             text: "Masuk disini.",
                    //             style: primeTheme.typography.bold.copyWith(
                    //               color: primeTheme.brand.primary,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(child: Assets.images.logo.logoPrimarySecond.svg(width: 40.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
