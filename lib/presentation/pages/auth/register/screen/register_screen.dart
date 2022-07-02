import 'package:ala_pos/presentation/pages/auth/register/cubit/register_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:sizer/sizer.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final username = useTextEditingController();
    final phone = useTextEditingController();
    final password = useTextEditingController();

    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.maybeWhen(
            success: () => context.router.replaceNamed(RouteName.newStoreForm),
            failed: (message) {
              SnackbarMessage.failed(context, message);
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Form(
            key: formKey.value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: AppSpacings.xl.sp),
              width: 100.w,
              height: 100.h,
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
                  TextFormField(
                    controller: username,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(AppSpacings.s.sp),
                      label: Text(
                        "Username",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  TextFormField(
                    controller: phone,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(AppSpacings.s.sp),
                      label: Text(
                        "No HP",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  TextFormField(
                    controller: password,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          letterSpacing: 1.5,
                        ),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(AppSpacings.s.sp),
                      label: Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!formKey.value.currentState!.validate()) {
                        return;
                      }

                      cubit.submit(username: username.text, phone: phone.text, password: password.text);
                    },
                    child: state.maybeWhen(
                        loading: () => CircularProgressIndicator(
                              color: Theme.of(context).primaryColorLight,
                            ),
                        orElse: () => Text(
                              "DAFTAR",
                              style: Theme.of(context).primaryTextTheme.button,
                            )),
                    style: ElevatedButton.styleFrom(
                      // primary: ColorFoundation.buttonAccent,
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
