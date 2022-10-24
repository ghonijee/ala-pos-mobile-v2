import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/gen/assets.gen.dart';
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

class NewStoreFormScreen extends HookConsumerWidget {
  const NewStoreFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primeTheme = PrimerTheme.of(context);
    var hidePassword = useState<bool>(true);
    var isSubmitLoading = useState<bool>(false);

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
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFieldComponent(
                      labelText: "Nomor Handphone Toko",
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    DropdownComponent<StoreCategoryModel>(
                      hintText: "Pilih Kategori Usaha",
                      labelText: "Kategori",
                      items: [
                        DropdownComponentMenuItem(
                            value: StoreCategoryModel(id: 1, name: "Pilih test"),
                            child: Text(
                              "Kelontong",
                              style: primeTheme.typography.normal.copyWith(
                                color: primeTheme.foreground.dflt,
                                fontWeight: FontWeight.normal,
                              ),
                            ))
                      ],
                      onChanged: (value) {
                        //
                      },
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextAreaComponent(
                      labelText: "Alamat Usaha",
                    ),
                    SizedBox(
                      height: AppSpacings.x4l,
                    ),
                    ButtonFullText(
                      onPress: FormzStatus.invalid == FormzStatus.invalid
                          ? () {
                              context.router.pushNamed(AuthRouteName.RegisterLoading);
                            }
                          : () {},
                      text: "Daftar Sekarang",
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
