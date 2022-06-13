import 'package:ala_pos/presentation/splashscreen/cubit/splash_cubit.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:atomic_design/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().startTime();

    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        state.when(
          loading: () {
            print("Loading Splash");
          },
          loaded: (authStatus) {
            print("Loaded");

            if (authStatus) {
              context.go(RouteName.HomePos);
            } else {
              context.go(RouteName.Login);
            }
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorFoundation.backgroundColorDark,
          body: Container(
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: Image.asset("assets/images/pos_logo.png"),
            ),
          ),
        );
      },
    );
  }
}
