// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:ala_pos/feature/auth/screen/new_store_form_screen.dart';
import 'package:ala_pos/feature/auth/screen/register_screen.dart';
import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../app/screen/app_start_screen.dart';
import '../feature/auth/screen/login_screen.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: AppStartScreen, initial: true),
    AutoRoute(page: LoginScreen, path: "/login"),
    AutoRoute(page: RegisterScreen, path: "/register"),
    AutoRoute(page: NewStoreFormScreen, path: "/register/store"),
    AutoRoute(page: PosMainScreen, path: "/pos/index"),
  ],
)
class $AppRouter {}
