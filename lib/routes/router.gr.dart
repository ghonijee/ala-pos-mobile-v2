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
import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AppStartScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.AppStartScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    NewStoreFormScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.NewStoreFormScreen());
    },
    PosMainScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.PosMainScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AppStartScreenRoute.name, path: '/'),
        _i6.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i6.RouteConfig(RegisterScreenRoute.name, path: '/register'),
        _i6.RouteConfig(NewStoreFormScreenRoute.name, path: '/register/store'),
        _i6.RouteConfig(PosMainScreenRoute.name, path: '/pos/index')
      ];
}

/// generated route for
/// [_i1.AppStartScreen]
class AppStartScreenRoute extends _i6.PageRouteInfo<void> {
  const AppStartScreenRoute() : super(AppStartScreenRoute.name, path: '/');

  static const String name = 'AppStartScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i6.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(RegisterScreenRoute.name, path: '/register');

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.NewStoreFormScreen]
class NewStoreFormScreenRoute extends _i6.PageRouteInfo<void> {
  const NewStoreFormScreenRoute()
      : super(NewStoreFormScreenRoute.name, path: '/register/store');

  static const String name = 'NewStoreFormScreenRoute';
}

/// generated route for
/// [_i5.PosMainScreen]
class PosMainScreenRoute extends _i6.PageRouteInfo<void> {
  const PosMainScreenRoute()
      : super(PosMainScreenRoute.name, path: '/pos/index');

  static const String name = 'PosMainScreenRoute';
}
