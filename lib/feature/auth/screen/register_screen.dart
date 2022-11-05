import 'package:ala_pos/feature/auth/provider/register_provider.dart';
import 'package:ala_pos/feature/auth/state/register/register_state.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/shared/styles/app_spacing.dart';
import 'package:ala_pos/shared/widget/button/button_full_component.dart';
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

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primeTheme = PrimerTheme.of(context);
    var hidePassword = useState<bool>(true);
    final controller = ref.read(registerProvider.notifier);
    var state = ref.watch(registerProvider);

    ref.listen<RegisterState>(registerProvider, (previous, next) {
      if (next.statusSubmission.isSubmissionFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
          ),
        );
      } else if (next.statusSubmission.isSubmissionSuccess) {
        context.router.replaceNamed(AuthRouteName.NewStoreForm);
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "1/2",
                        style: primeTheme.typography.normal.copyWith(
                          color: primeTheme.foreground.dflt,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      "Daftar Sekarang",
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
                      labelText: "Username",
                      onChange: (value) => controller.changeUsername(value),
                      errorText: state.usernameField.error?.message,
                      isValid: state.usernameField.pure ? true : state.usernameField.valid,
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFieldComponent(
                      labelText: "Nomor Handphone",
                      onChange: (value) => controller.changePhone(value),
                      errorText: state.phoneField.error?.message,
                      isValid: state.phoneField.pure ? true : state.phoneField.valid,
                    ),
                    SizedBox(
                      height: AppSpacings.l.sp,
                    ),
                    TextFieldComponent(
                      onChange: (value) => controller.changePassword(value),
                      errorText: state.passwordField.error?.message,
                      isValid: state.passwordField.pure ? true : state.passwordField.valid,
                      labelText: "Katasandi",
                      isSecureText: hidePassword.value,
                      suffixIcon: InkWell(
                        child: hidePassword.value ? Icon(Ionicons.eye) : Icon(Ionicons.eye_off),
                        onTap: () {
                          hidePassword.value = !hidePassword.value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: AppSpacings.x4l,
                    ),
                    ButtonFullText(
                      onPress: state.formRegisteredStatus == FormzStatus.valid
                          ? () {
                              controller.submit();
                              // context.router.pushNamed(AuthRouteName.NewStoreForm);
                            }
                          : null,
                      text: "Selanjutnya",
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          context.router.pop();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Sudah punya akun? ",
                            style: primeTheme.typography.normal,
                            children: [
                              TextSpan(
                                text: "Masuk disini.",
                                style: primeTheme.typography.bold.copyWith(
                                  color: primeTheme.brand.primary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
