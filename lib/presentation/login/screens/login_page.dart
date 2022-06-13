import 'package:ala_pos/presentation/login/cubit/login_cubit.dart';
import 'package:ala_pos/presentation/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<LoginCubit>(),
      child: LoginScreen(),
    );
  }
}
