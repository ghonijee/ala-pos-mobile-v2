import 'package:ala_pos/presentation/pages/profile/cubit/form_user/form_user_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProfileUserFormScreen extends StatelessWidget {
  const ProfileUserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: BlocBuilder<FormUserCubit, FormUserState>(
          builder: (context, state) {
            return Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Lengkap *"),
                    TextFormField(
                      // initialValue: formProductCubit.state.name.value,
                      style: Theme.of(context).textTheme.bodyText1,
                      // onChanged: (value) => formProductCubit.nameChange(value),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
