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
import 'package:ala_pos/feature/pos/screen/pos_cart_item_screen.dart' as _i9;
import 'package:ala_pos/feature/pos/screen/pos_cart_screen.dart' as _i8;
import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart' as _i7;
import 'package:ala_pos/feature/pos/screen/pos_payment_screen.dart' as _i10;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppStartScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    NewStoreFormScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.NewStoreFormScreen(),
      );
    },
    SignUpLoadingScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpLoadingScreen(),
      );
    },
    SignUpSuccessScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpSuccessScreen(),
      );
    },
    PosMainScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.PosMainScreen(),
      );
    },
    PosCartScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.PosCartScreen(),
      );
    },
    PosCartItemScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.PosCartItemScreen(),
      );
    },
    PosPaymentScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.PosPaymentScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          AppStartScreenRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i11.RouteConfig(
          RegisterScreenRoute.name,
          path: '/register',
        ),
        _i11.RouteConfig(
          NewStoreFormScreenRoute.name,
          path: '/new-store-form',
        ),
        _i11.RouteConfig(
          SignUpLoadingScreenRoute.name,
          path: '/register-loading',
        ),
        _i11.RouteConfig(
          SignUpSuccessScreenRoute.name,
          path: '/register-success',
        ),
        _i11.RouteConfig(
          PosMainScreenRoute.name,
          path: '/pos',
        ),
        _i11.RouteConfig(
          PosCartScreenRoute.name,
          path: '/pos/cart',
        ),
        _i11.RouteConfig(
          PosCartItemScreenRoute.name,
          path: '/pos/cart/:id',
        ),
        _i11.RouteConfig(
          PosPaymentScreenRoute.name,
          path: '/pos/payment',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartScreen]
class AppStartScreenRoute extends _i11.PageRouteInfo<void> {
  const AppStartScreenRoute()
      : super(
          AppStartScreenRoute.name,
          path: '/',
        );

  static const String name = 'AppStartScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i11.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i11.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.NewStoreFormScreen]
class NewStoreFormScreenRoute extends _i11.PageRouteInfo<void> {
  const NewStoreFormScreenRoute()
      : super(
          NewStoreFormScreenRoute.name,
          path: '/new-store-form',
        );

  static const String name = 'NewStoreFormScreenRoute';
}

/// generated route for
/// [_i5.SignUpLoadingScreen]
class SignUpLoadingScreenRoute extends _i11.PageRouteInfo<void> {
  const SignUpLoadingScreenRoute()
      : super(
          SignUpLoadingScreenRoute.name,
          path: '/register-loading',
        );

  static const String name = 'SignUpLoadingScreenRoute';
}

/// generated route for
/// [_i6.SignUpSuccessScreen]
class SignUpSuccessScreenRoute extends _i11.PageRouteInfo<void> {
  const SignUpSuccessScreenRoute()
      : super(
          SignUpSuccessScreenRoute.name,
          path: '/register-success',
        );

  static const String name = 'SignUpSuccessScreenRoute';
}

/// generated route for
/// [_i7.PosMainScreen]
class PosMainScreenRoute extends _i11.PageRouteInfo<void> {
  const PosMainScreenRoute()
      : super(
          PosMainScreenRoute.name,
          path: '/pos',
        );

  static const String name = 'PosMainScreenRoute';
}

/// generated route for
/// [_i8.PosCartScreen]
class PosCartScreenRoute extends _i11.PageRouteInfo<void> {
  const PosCartScreenRoute()
      : super(
          PosCartScreenRoute.name,
          path: '/pos/cart',
        );

  static const String name = 'PosCartScreenRoute';
}

/// generated route for
/// [_i9.PosCartItemScreen]
class PosCartItemScreenRoute extends _i11.PageRouteInfo<void> {
  const PosCartItemScreenRoute()
      : super(
          PosCartItemScreenRoute.name,
          path: '/pos/cart/:id',
        );

  static const String name = 'PosCartItemScreenRoute';
}

/// generated route for
/// [_i10.PosPaymentScreen]
class PosPaymentScreenRoute extends _i11.PageRouteInfo<void> {
  const PosPaymentScreenRoute()
      : super(
          PosPaymentScreenRoute.name,
          path: '/pos/payment',
        );

  static const String name = 'PosPaymentScreenRoute';
}
