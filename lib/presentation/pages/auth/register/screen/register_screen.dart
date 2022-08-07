import 'package:ala_pos/presentation/pages/auth/register/cubit/register_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sizer/sizer.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        switch (state.statusSubmission) {
          case FormzStatus.submissionFailure:
            SnackbarMessage.failed(context, state.message);
            break;
          case FormzStatus.submissionSuccess:
            context.router.replaceNamed(RouteName.newStoreForm);
            break;
          default:
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: AppSpacings.xl.sp),
              constraints: BoxConstraints.loose(Size(100.w, 100.h)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Daftar Sekarang!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  Text(
                    "Dapatkan kemudahan untuk mengelola\ndan monitoring usahamu",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: AppSpacings.xl.sp,
                  ),
                  _UsernameField(),
                  SizedBox(
                    height: 16.sp,
                  ),
                  _PhoneField(),
                  SizedBox(
                    height: 16.sp,
                  ),
                  _PasswordFeild(),
                  SizedBox(
                    height: 24.sp,
                  ),
                  ElevatedButton(
                    onPressed: state.status == FormzStatus.invalid
                        ? null
                        : () {
                            cubit.submit();
                          },
                    child: state.statusSubmission == FormzStatus.submissionInProgress
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.surface,
                          )
                        : Text(
                            "DAFTAR",
                            style: Theme.of(context).primaryTextTheme.button,
                          ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      textStyle: Theme.of(context).textTheme.button,
                      minimumSize: Size.fromHeight(40.sp),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.router.navigateNamed(RouteName.login);
                      },
                      child: Text(
                        "Sudah punya akun? masuk disini.",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/pos_logo.png",
                      width: 60.sp,
                    ),
                  ),
                  SizedBox(
                    height: 32.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => cubit.usernameChange(value),
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            errorText: state.usernameField.invalid ? state.usernameField.error?.message : null,
            label: Text(
              "Username / No HP",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        );
      },
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => cubit.phoneChange(value),
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            errorText: state.phoneField.invalid ? state.phoneField.error?.message : null,
            contentPadding: EdgeInsets.all(AppSpacings.s.sp),
            label: Text(
              "Nomor HP",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordFeild extends HookWidget {
  const _PasswordFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    var hidePassword = useState<bool>(true);

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          obscureText: hidePassword.value,
          onChanged: (value) => cubit.passwordChange(value),
          decoration: InputDecoration(
              errorText: state.passwordField.invalid ? state.passwordField.error?.message : null,
              label: Text(
                "Password",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              suffixIcon: InkWell(
                child: hidePassword.value ? Icon(Ionicons.eye) : Icon(Ionicons.eye_off),
                onTap: () {
                  hidePassword.value = !hidePassword.value;
                },
              )),
        );
      },
    );
  }
}
