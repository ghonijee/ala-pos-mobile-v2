import 'package:ala_pos/presentation/pages/profile/cubit/form_user/form_user_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/cubit/user/user_profile_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProfileUserFormScreen extends StatelessWidget {
  const ProfileUserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formCubit = context.read<FormUserCubit>();

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
          "Ubah Profile",
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
            child: BlocConsumer<FormUserCubit, FormUserState>(
              listener: (context, state) async {
                if (state.statusSubmission.isSubmissionSuccess) {
                  await context.read<UserProfileCubit>().refreshUserData();
                  context.router.pop();
                  SnackbarMessage.failed(context, state.message);
                } else if (state.statusSubmission.isSubmissionFailure) {
                  SnackbarMessage.failed(context, state.message);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Lengkap *"),
                        TextFormField(
                          initialValue: state.fullnameField.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => formCubit.fullnameChange(value),
                          decoration: InputDecoration(
                            errorText: state.fullnameField.invalid ? state.fullnameField.error?.message : null,
                            hintText: "Nama Lengkap",
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
                        Text("Username *"),
                        TextFormField(
                          initialValue: state.usernameField.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => formCubit.usernameChange(value),
                          decoration: InputDecoration(
                            errorText: state.usernameField.invalid ? state.usernameField.error?.message : null,
                            hintText: "Username",
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
                        Text("Email *"),
                        TextFormField(
                          initialValue: state.email.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => formCubit.emailChange(value),
                          decoration: InputDecoration(
                            errorText: state.email.invalid ? state.email.error?.message : null,
                            hintText: "Email",
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
                        Text("Nomer Handphone *"),
                        TextFormField(
                          initialValue: state.phone.value,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) => formCubit.phoneChange(value),
                          decoration: InputDecoration(
                            errorText: state.phone.invalid ? state.phone.error?.message : null,
                            hintText: "Nomer Handphone",
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
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40.sp)),
                        onPressed: state.status == FormzStatus.invalid
                            ? null
                            : () {
                                formCubit.submit();
                              },
                        child: Text(
                          "Simpan Perubahan",
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
