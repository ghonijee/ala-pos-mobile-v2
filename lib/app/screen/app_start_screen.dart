import 'package:ala_pos/app/screen/splash_screen.dart';
import 'package:ala_pos/feature/auth/screen/login_screen.dart';
import 'package:ala_pos/feature/pos/routes/pos_router.dart';
import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widget/connection_unavailable_widget.dart';
import '../../shared/widget/loading_widget.dart';
import '../provider/app_start_provider.dart';

class AppStartScreen extends ConsumerWidget {
  const AppStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.maybeWhen(
      initial: () => const SplashScreen(),
      authenticated: () => PosMainScreen(),
      unauthenticated: () => LoginScreen(),
      internetUnAvailable: () => const ConnectionUnavailableWidget(),
      orElse: () => const LoadingWidget(),
    );
  }
}
