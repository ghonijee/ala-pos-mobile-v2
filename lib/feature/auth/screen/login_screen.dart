import 'package:ala_pos/feature/auth/provider/login_provider.dart';
import 'package:ala_pos/feature/auth/router/auth_router.dart';
import 'package:ala_pos/feature/auth/state/login/login_state.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/shared/widget/button/button_full_component.dart';
import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../l10n/l10n.dart';
import '../../../shared/styles/app_spacing.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final localization = AppLocalizations.of(context);
    var primeTheme = PrimerTheme.of(context);
    var hidePassword = useState<bool>(true);

    final loginController = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.statusSubmission.isSubmissionFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
          ),
        );
      } else if (next.statusSubmission.isSubmissionSuccess) {
        context.router.replaceNamed(PosRouteName.Pos);
      }
    });

    return Scaffold(
      backgroundColor: primeTheme.canvas.inset,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSpacings.l.sp),
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.sp,
                  ),
                  Text(
                    "Login",
                    style: primeTheme.typography.h1.copyWith(
                      color: primeTheme.foreground.dflt,
                    ),
                  ),
                  SizedBox(
                    height: AppSpacings.l.sp,
                  ),
                  Text("Masukan username/nomor handphone yang digunakan untuk masuk ke aplikasi Alapos.", style: primeTheme.typography.normal.copyWith(color: primeTheme.foreground.muted)),
                  SizedBox(
                    height: AppSpacings.x2l.sp,
                  ),
                  // _FieldUsername(),
                  TextFieldComponent(
                    labelText: "Username/Nomor HP",
                    onChange: (value) => loginController.changeUsername(value),
                    errorText: loginState.usernameField.error?.message,
                    isValid: loginState.usernameField.pure ? true : loginState.usernameField.valid,
                  ),
                  SizedBox(
                    height: AppSpacings.l.sp,
                  ),
                  TextFieldComponent(
                    onChange: (value) => loginController.changePassword(value),
                    errorText: loginState.passwordField.error?.message,
                    isValid: loginState.passwordField.pure ? true : loginState.passwordField.valid,
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
                    onPress: loginState.status == FormzStatus.valid
                        ? () async {
                            await loginController.submit();
                          }
                        : null,
                    text: "Masuk",
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        context.router.pushNamed(AuthRouteName.Register);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Belum punya akun? ",
                          style: primeTheme.typography.normal,
                          children: [
                            TextSpan(
                              text: "Daftar disini.",
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
    );
  }
}
