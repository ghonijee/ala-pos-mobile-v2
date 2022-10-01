import 'package:ala_pos/gen/assets.gen.dart';
import 'package:ala_pos/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/screen/example_theme.dart';
import '../../../l10n/l10n.dart';
import '../../../shared/styles/app_spacing.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);
    var primeTheme = PrimerTheme.of(context);

    return Scaffold(
      backgroundColor: primeTheme.canvas.dflt,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp),
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(localization.login_heading, style: primeTheme.typography.lead.copyWith(color: primeTheme.accent.emphasis, fontSize: 28.sp)),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  Text(
                    localization.login_subheading,
                    style: primeTheme.typography.normal,
                  ),
                  SizedBox(
                    height: AppSpacings.x4l.sp,
                  ),
                  _FieldUsername(),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  _FieldPassword(),
                  SizedBox(
                    height: 24.sp,
                  ),
                  ElevatedButton(
                    onPressed: FormzStatus.invalid == FormzStatus.invalid ? () {} : () {},
                    child: FormzStatus.invalid == FormzStatus.submissionInProgress
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.surface,
                          )
                        : Text(
                            localization.sign_in,
                            style: TextStyle(),
                          ),
                    style: ElevatedButton.styleFrom(
                      primary: primeTheme.accent.emphasis,
                      textStyle: PrimerTheme.of(context).typography.normal,
                      minimumSize: Size.fromHeight(45),
                    ),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // context.router.pushWidget(MyHomePage());
                        context.router.navigateNamed("/register");
                      },
                      child: Text(
                        localization.not_have_account,
                        style: primeTheme.typography.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(child: Assets.images.posLogoLight.image(width: 40.sp)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldUsername extends HookConsumerWidget {
  const _FieldUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);

    return TextField(
      // onChanged:
      style: PrimerTheme.of(context).typography.normal,
      decoration: InputDecoration(
        // errorText: state.usernameField.invalid ? state.usernameField.error?.message : null,
        labelStyle: PrimerTheme.of(context).typography.small,
        labelText: localization.field_login_username_label,
        floatingLabelStyle: PrimerTheme.of(context).typography.normal,
      ),
    );
  }
}

class _FieldPassword extends HookConsumerWidget {
  const _FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);

    var hidePassword = useState<bool>(true);

    return TextField(
      style: PrimerTheme.of(context).typography.normal,
      obscureText: hidePassword.value,
      // onChanged: (value) => cubit.passwordChange(value),
      decoration: InputDecoration(
          // errorText: state.passwordField.invalid ? state.passwordField.error?.message : null,
          labelStyle: PrimerTheme.of(context).typography.small,
          labelText: localization.field_password_label,
          floatingLabelStyle: PrimerTheme.of(context).typography.normal,
          suffixIcon: InkWell(
            child: hidePassword.value ? Icon(Ionicons.eye) : Icon(Ionicons.eye_off),
            onTap: () {
              hidePassword.value = !hidePassword.value;
            },
          )),
    );
  }
}
