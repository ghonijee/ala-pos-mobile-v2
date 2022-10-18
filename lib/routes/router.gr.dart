// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ala_pos/app/screen/app_start_screen.dart' as _i1;
import 'package:ala_pos/feature/auth/screen/login_screen.dart' as _i2;
import 'package:ala_pos/feature/auth/screen/new_store_form_screen.dart' as _i4;
import 'package:ala_pos/feature/auth/screen/register_screen.dart' as _i3;
import 'package:ala_pos/feature/auth/screen/sign_up_loading_screen.dart' as _i5;
import 'package:ala_pos/feature/auth/screen/sign_up_success_screen.dart' as _i6;
import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AppStartScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    NewStoreFormScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.NewStoreFormScreen(),
      );
    },
    SignUpLoadingScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpLoadingScreen(),
      );
    },
    SignUpSuccessScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpSuccessScreen(),
      );
    },
    PosMainScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.PosMainScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          AppStartScreenRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i8.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register',
        ),
        _i8.RouteConfig(
          NewStoreFormScreenRoute.name,
          path: '/new-store-form',
        ),
        _i8.RouteConfig(
          SignUpLoadingScreenRoute.name,
          path: '/register-loading',
        ),
        _i8.RouteConfig(
          SignUpSuccessScreenRoute.name,
          path: '/register-success',
        ),
        _i8.RouteConfig(
          PosMainScreenRoute.name,
          path: '/pos',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartScreen]
class AppStartScreenRoute extends _i8.PageRouteInfo<void> {
  const AppStartScreenRoute()
      : super(
          AppStartScreenRoute.name,
          path: '/',
        );

  static const String name = 'AppStartScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i8.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.NewStoreFormScreen]
class NewStoreFormScreenRoute extends _i8.PageRouteInfo<void> {
  const NewStoreFormScreenRoute()
      : super(
          NewStoreFormScreenRoute.name,
          path: '/new-store-form',
        );

  static const String name = 'NewStoreFormScreenRoute';
}

/// generated route for
/// [_i5.SignUpLoadingScreen]
class SignUpLoadingScreenRoute extends _i8.PageRouteInfo<void> {
  const SignUpLoadingScreenRoute()
      : super(
          SignUpLoadingScreenRoute.name,
          path: '/register-loading',
        );

  static const String name = 'SignUpLoadingScreenRoute';
}

/// generated route for
/// [_i6.SignUpSuccessScreen]
class SignUpSuccessScreenRoute extends _i8.PageRouteInfo<void> {
  const SignUpSuccessScreenRoute()
      : super(
          SignUpSuccessScreenRoute.name,
          path: '/register-success',
        );

  static const String name = 'SignUpSuccessScreenRoute';
}

/// generated route for
/// [_i7.PosMainScreen]
class PosMainScreenRoute extends _i8.PageRouteInfo<void> {
  const PosMainScreenRoute()
      : super(
          PosMainScreenRoute.name,
          path: '/pos',
        );

  static const String name = 'PosMainScreenRoute';
}
