import 'package:ala_pos/presentation/pages/profile/cubit/form_user/form_user_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../cubit/change_password/change_password_cubit.dart';

class ProfileChangePassword extends HookWidget {
  const ProfileChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChangePasswordCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Ionicons.arrow_back_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Ubah Password",
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
            child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state.statusSubmission == FormzStatus.submissionFailure) {
                  SnackbarMessage.failed(context, state.message);
                } else if (state.statusSubmission == FormzStatus.submissionSuccess) {
                  context.router.pop();
                  SnackbarMessage.success(context, state.message);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password Baru *"),
                        TextFormField(
                          initialValue: state.newPassword.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => cubit.newPasswordChange(value),
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: state.newPassword.invalid ? state.newPassword.error?.message : null,
                            hintText: "Password Baru",
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
                    ),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Konfirmasi New Password *"),
                        TextFormField(
                          obscureText: true,
                          initialValue: state.newPasswordConfirm.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => cubit.newPasswordConfirmChange(value),
                          decoration: InputDecoration(
                            errorText:
                                state.newPasswordConfirm.invalid ? state.newPasswordConfirm.error?.message : null,
                            hintText: "Konfirmasi Password",
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
                    ),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password Sebelumnya *"),
                        TextFormField(
                          obscureText: true,
                          initialValue: state.oldPassword.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => cubit.oldPasswordChange(value),
                          decoration: InputDecoration(
                            errorText: state.oldPassword.invalid ? state.oldPassword.error?.message : null,
                            hintText: "Password",
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
                    ),
                    SizedBox(
                      height: AppSpacings.m.sp,
                    ),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40.sp)),
                        onPressed: state.status == FormzStatus.invalid
                            ? null
                            : () async {
                                await cubit.submit();
                              },
                        child: Text(
                          "Submit",
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
