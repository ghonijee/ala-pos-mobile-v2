import 'package:ala_pos/presentation/pages/profile/cubit/change_password/change_password_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/cubit/form_store/form_store_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/cubit/form_user/form_user_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/cubit/user/user_profile_cubit.dart';
import 'package:ala_pos/presentation/pages/profile/screen/profile_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<UserProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<FormUserCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<ChangePasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<FormStoreCubit>(),
        ),
      ],
      child: AutoRouter(),
    );
  }
}
