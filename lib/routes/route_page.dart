import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../presentation/pages/pages.dart';

part "route_name.dart";
part 'route_page.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreenPage, initial: true),
    AutoRoute(page: LoginPage, path: RouteName.login),
    AutoRoute(page: RegisterPage, path: RouteName.register),
    AutoRoute(page: NewStoreFormPage, path: RouteName.newStoreForm),
    AutoRoute(page: PosWrapperPage, path: RouteName.posWrapper, children: [
      AutoRoute(page: PosPage, path: RouteName.posProduct, initial: true),
      AutoRoute(page: CartPage, path: RouteName.posCart),
      AutoRoute(page: CartItemDetailPage, path: RouteName.posCartItemDetail),
      AutoRoute(page: ResumeOrderPage, path: RouteName.posOrderResume),
      AutoRoute(page: PaymentCashPage, path: RouteName.posPaymentCash),
    ]),
  ],
)

// extend the generated private router
class RoutePage extends _$RoutePage {}

RoutePage initRouter = RoutePage();
