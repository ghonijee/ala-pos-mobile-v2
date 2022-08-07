import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sizer/sizer.dart';

import '../cubit/login_cubit.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        if (state.statusSubmission.isSubmissionFailure) {
          var snackBar = SnackBar(
            content: Text(state.message),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        if (state.statusSubmission.isSubmissionSuccess) {
          if (state.haveStore) {
            context.router.replaceNamed(RouteName.posWrapper);
          } else {
            context.router.replaceNamed(RouteName.newStoreForm);
          }
          return;
        }
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp),
              width: 100.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "SELAMAT DATANG!",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  SizedBox(
                    height: AppSpacings.m.sp,
                  ),
                  Text(
                    "Silahkan masuk terlebih dahulu!\nselanjutnya mulai berjualan dengan Alapos.",
                    style: Theme.of(context).textTheme.subtitle1,
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
                    onPressed: state.status == FormzStatus.invalid
                        ? null
                        : () {
                            cubit.signIn();
                          },
                    child: state.statusSubmission == FormzStatus.submissionInProgress
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.surface,
                          )
                        : Text(
                            "MASUK",
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
                        context.router.navigateNamed(RouteName.register);
                      },
                      child: Text(
                        "Belum punya akun? daftar disini.",
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
                      "assets/images/pos_logo_light.png",
                      width: 60.sp,
                    ),
                  ),
                  SizedBox(
                    height: 40.sp,
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

class _FieldUsername extends HookWidget {
  const _FieldUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
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

class _FieldPassword extends HookWidget {
  const _FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cubit = useBloc<LoginCubit>();
    var cubit = context.read<LoginCubit>();
    var hidePassword = useState<bool>(true);

    return BlocBuilder<LoginCubit, LoginState>(
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
