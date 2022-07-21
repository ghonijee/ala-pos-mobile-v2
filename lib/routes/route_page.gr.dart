// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'route_page.dart';

class _$RoutePage extends RootStackRouter {
  _$RoutePage([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreenPage());
    },
    LoginPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    NewStoreFormPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewStoreFormPage());
    },
    PosWrapperPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PosWrapperPage());
    },
    MasterProductWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MasterProductWrapper());
    },
    PosPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PosPage());
    },
    CartPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const CartPage()));
    },
    CartItemDetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CartItemDetailPageRouteArgs>(
          orElse: () => CartItemDetailPageRouteArgs(
              indexItem: pathParams.getInt('index')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(
              child: CartItemDetailPage(
                  key: args.key, indexItem: args.indexItem)));
    },
    ResumeOrderPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ResumeOrderPage());
    },
    PaymentCashPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PaymentCashPage());
    },
    OrderResultPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OrderResultPage());
    },
    ProductGridScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProductGridScreen());
    },
    ProductFormScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProductFormScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashScreenPageRoute.name, path: '/'),
        RouteConfig(LoginPageRoute.name, path: 'login'),
        RouteConfig(RegisterPageRoute.name, path: 'register'),
        RouteConfig(NewStoreFormPageRoute.name, path: 'new/store/form'),
        RouteConfig(PosWrapperPageRoute.name, path: 'pos/', children: [
          RouteConfig('#redirect',
              path: '',
              parent: PosWrapperPageRoute.name,
              redirectTo: 'pos/product',
              fullMatch: true),
          RouteConfig(PosPageRoute.name,
              path: 'pos/product', parent: PosWrapperPageRoute.name),
          RouteConfig(CartPageRoute.name,
              path: 'pos/cart', parent: PosWrapperPageRoute.name),
          RouteConfig(CartItemDetailPageRoute.name,
              path: 'pos/cart/edit/:index', parent: PosWrapperPageRoute.name),
          RouteConfig(ResumeOrderPageRoute.name,
              path: 'pos/order/resume', parent: PosWrapperPageRoute.name),
          RouteConfig(PaymentCashPageRoute.name,
              path: 'pos/payment/cash', parent: PosWrapperPageRoute.name),
          RouteConfig(OrderResultPageRoute.name,
              path: 'pos/order/success', parent: PosWrapperPageRoute.name)
        ]),
        RouteConfig(MasterProductWrapperRoute.name,
            path: 'product/',
            children: [
              RouteConfig('#redirect',
                  path: '',
                  parent: MasterProductWrapperRoute.name,
                  redirectTo: 'product/list',
                  fullMatch: true),
              RouteConfig(ProductGridScreenRoute.name,
                  path: 'product/list', parent: MasterProductWrapperRoute.name),
              RouteConfig(ProductFormScreenRoute.name,
                  path: 'product/create',
                  parent: MasterProductWrapperRoute.name)
            ])
      ];
}

/// generated route for
/// [SplashScreenPage]
class SplashScreenPageRoute extends PageRouteInfo<void> {
  const SplashScreenPageRoute() : super(SplashScreenPageRoute.name, path: '/');

  static const String name = 'SplashScreenPageRoute';
}

/// generated route for
/// [LoginPage]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterPageRoute extends PageRouteInfo<void> {
  const RegisterPageRoute() : super(RegisterPageRoute.name, path: 'register');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [NewStoreFormPage]
class NewStoreFormPageRoute extends PageRouteInfo<void> {
  const NewStoreFormPageRoute()
      : super(NewStoreFormPageRoute.name, path: 'new/store/form');

  static const String name = 'NewStoreFormPageRoute';
}

/// generated route for
/// [PosWrapperPage]
class PosWrapperPageRoute extends PageRouteInfo<void> {
  const PosWrapperPageRoute({List<PageRouteInfo>? children})
      : super(PosWrapperPageRoute.name,
            path: 'pos/', initialChildren: children);

  static const String name = 'PosWrapperPageRoute';
}

/// generated route for
/// [MasterProductWrapper]
class MasterProductWrapperRoute extends PageRouteInfo<void> {
  const MasterProductWrapperRoute({List<PageRouteInfo>? children})
      : super(MasterProductWrapperRoute.name,
            path: 'product/', initialChildren: children);

  static const String name = 'MasterProductWrapperRoute';
}

/// generated route for
/// [PosPage]
class PosPageRoute extends PageRouteInfo<void> {
  const PosPageRoute() : super(PosPageRoute.name, path: 'pos/product');

  static const String name = 'PosPageRoute';
}

/// generated route for
/// [CartPage]
class CartPageRoute extends PageRouteInfo<void> {
  const CartPageRoute() : super(CartPageRoute.name, path: 'pos/cart');

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [CartItemDetailPage]
class CartItemDetailPageRoute
    extends PageRouteInfo<CartItemDetailPageRouteArgs> {
  CartItemDetailPageRoute({Key? key, required int indexItem})
      : super(CartItemDetailPageRoute.name,
            path: 'pos/cart/edit/:index',
            args: CartItemDetailPageRouteArgs(key: key, indexItem: indexItem),
            rawPathParams: {'index': indexItem});

  static const String name = 'CartItemDetailPageRoute';
}

class CartItemDetailPageRouteArgs {
  const CartItemDetailPageRouteArgs({this.key, required this.indexItem});

  final Key? key;

  final int indexItem;

  @override
  String toString() {
    return 'CartItemDetailPageRouteArgs{key: $key, indexItem: $indexItem}';
  }
}

/// generated route for
/// [ResumeOrderPage]
class ResumeOrderPageRoute extends PageRouteInfo<void> {
  const ResumeOrderPageRoute()
      : super(ResumeOrderPageRoute.name, path: 'pos/order/resume');

  static const String name = 'ResumeOrderPageRoute';
}

/// generated route for
/// [PaymentCashPage]
class PaymentCashPageRoute extends PageRouteInfo<void> {
  const PaymentCashPageRoute()
      : super(PaymentCashPageRoute.name, path: 'pos/payment/cash');

  static const String name = 'PaymentCashPageRoute';
}

/// generated route for
/// [OrderResultPage]
class OrderResultPageRoute extends PageRouteInfo<void> {
  const OrderResultPageRoute()
      : super(OrderResultPageRoute.name, path: 'pos/order/success');

  static const String name = 'OrderResultPageRoute';
}

/// generated route for
/// [ProductGridScreen]
class ProductGridScreenRoute extends PageRouteInfo<void> {
  const ProductGridScreenRoute()
      : super(ProductGridScreenRoute.name, path: 'product/list');

  static const String name = 'ProductGridScreenRoute';
}

/// generated route for
/// [ProductFormScreen]
class ProductFormScreenRoute extends PageRouteInfo<void> {
  const ProductFormScreenRoute()
      : super(ProductFormScreenRoute.name, path: 'product/create');

  static const String name = 'ProductFormScreenRoute';
}