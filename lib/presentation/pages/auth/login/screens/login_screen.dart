import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:sizer/sizer.dart';

import '../cubit/login_cubit.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final username = useTextEditingController();
    final password = useTextEditingController();

    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        state.when(
            initial: () => null,
            loading: () => null,
            notHaveStore: () => context.router.replaceNamed(RouteName.newStoreForm),
            onSuccess: () {
              context.router.replaceNamed(RouteName.posWrapper);
            },
            onFailure: (message) {
              var snackBar = SnackBar(
                content: Text(message! ?? "Terjadi kesalahan"),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl.sp),
              width: 100.w,
              height: 100.h,
              child: Form(
                key: formKey,
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
                    TextFormField(
                      controller: username,
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      decoration: InputDecoration(
                        label: Text(
                          "Username / No HP",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    TextFormField(
                      controller: password,
                      style: Theme.of(context).textTheme.bodyText1,
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                      ]),
                      decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.sp,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        cubit.signIn(username: username.text, password: password.text);
                      },
                      child: state.maybeWhen(
                        loading: () => CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        orElse: () => Text(
                          "MASUK",
                          style: Theme.of(context).primaryTextTheme.button,
                        ),
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
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),
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
          ),
        );
      },
    );
  }
}
