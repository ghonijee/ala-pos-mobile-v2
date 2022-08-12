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
    TransactionWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TransactionWrapper());
    },
    ReceiptPageRoute.name: (routeData) {
      final args = routeData.argsAs<ReceiptPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ReceiptPage(
              key: args.key, transactionModel: args.transactionModel));
    },
    ProfileWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileWrapper());
    },
    PosPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PosPage());
    },
    CustomItemPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CustomItemPage());
    },
    CartPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartPage());
    },
    CartItemDetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CartItemDetailPageRouteArgs>(
          orElse: () => CartItemDetailPageRouteArgs(
              indexItem: pathParams.getInt('index')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CartItemDetailPage(key: args.key, indexItem: args.indexItem));
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
    },
    TransactionListScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TransactionListScreen());
    },
    TransactionDetailScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TransactionDetailScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileScreen());
    },
    ProfileUserFormScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileUserFormScreen());
    },
    ProfileChangePasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileChangePassword());
    },
    StoreListScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StoreListScreen());
    },
    StoreFormScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StoreFormScreen());
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
          RouteConfig(CustomItemPageRoute.name,
              path: 'pos/custom/product', parent: PosWrapperPageRoute.name),
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
            ]),
        RouteConfig(TransactionWrapperRoute.name,
            path: 'transaction/',
            children: [
              RouteConfig('#redirect',
                  path: '',
                  parent: TransactionWrapperRoute.name,
                  redirectTo: 'transaction/list',
                  fullMatch: true),
              RouteConfig(TransactionListScreenRoute.name,
                  path: 'transaction/list',
                  parent: TransactionWrapperRoute.name),
              RouteConfig(TransactionDetailScreenRoute.name,
                  path: 'transaction/detail',
                  parent: TransactionWrapperRoute.name)
            ]),
        RouteConfig(ReceiptPageRoute.name, path: 'receipt'),
        RouteConfig(ProfileWrapperRoute.name, path: 'profile', children: [
          RouteConfig('#redirect',
              path: '',
              parent: ProfileWrapperRoute.name,
              redirectTo: 'profile/user',
              fullMatch: true),
          RouteConfig(ProfileScreenRoute.name,
              path: 'profile/user', parent: ProfileWrapperRoute.name),
          RouteConfig(ProfileUserFormScreenRoute.name,
              path: 'profile/user/form', parent: ProfileWrapperRoute.name),
          RouteConfig(ProfileChangePasswordRoute.name,
              path: 'profile/change-password',
              parent: ProfileWrapperRoute.name),
          RouteConfig(StoreListScreenRoute.name,
              path: 'profile/store', parent: ProfileWrapperRoute.name),
          RouteConfig(StoreFormScreenRoute.name,
              path: 'profile/store/form', parent: ProfileWrapperRoute.name)
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
/// [TransactionWrapper]
class TransactionWrapperRoute extends PageRouteInfo<void> {
  const TransactionWrapperRoute({List<PageRouteInfo>? children})
      : super(TransactionWrapperRoute.name,
            path: 'transaction/', initialChildren: children);

  static const String name = 'TransactionWrapperRoute';
}

/// generated route for
/// [ReceiptPage]
class ReceiptPageRoute extends PageRouteInfo<ReceiptPageRouteArgs> {
  ReceiptPageRoute({Key? key, required TransactionModel transactionModel})
      : super(ReceiptPageRoute.name,
            path: 'receipt',
            args: ReceiptPageRouteArgs(
                key: key, transactionModel: transactionModel));

  static const String name = 'ReceiptPageRoute';
}

class ReceiptPageRouteArgs {
  const ReceiptPageRouteArgs({this.key, required this.transactionModel});

  final Key? key;

  final TransactionModel transactionModel;

  @override
  String toString() {
    return 'ReceiptPageRouteArgs{key: $key, transactionModel: $transactionModel}';
  }
}

/// generated route for
/// [ProfileWrapper]
class ProfileWrapperRoute extends PageRouteInfo<void> {
  const ProfileWrapperRoute({List<PageRouteInfo>? children})
      : super(ProfileWrapperRoute.name,
            path: 'profile', initialChildren: children);

  static const String name = 'ProfileWrapperRoute';
}

/// generated route for
/// [PosPage]
class PosPageRoute extends PageRouteInfo<void> {
  const PosPageRoute() : super(PosPageRoute.name, path: 'pos/product');

  static const String name = 'PosPageRoute';
}

/// generated route for
/// [CustomItemPage]
class CustomItemPageRoute extends PageRouteInfo<void> {
  const CustomItemPageRoute()
      : super(CustomItemPageRoute.name, path: 'pos/custom/product');

  static const String name = 'CustomItemPageRoute';
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

/// generated route for
/// [TransactionListScreen]
class TransactionListScreenRoute extends PageRouteInfo<void> {
  const TransactionListScreenRoute()
      : super(TransactionListScreenRoute.name, path: 'transaction/list');

  static const String name = 'TransactionListScreenRoute';
}

/// generated route for
/// [TransactionDetailScreen]
class TransactionDetailScreenRoute extends PageRouteInfo<void> {
  const TransactionDetailScreenRoute()
      : super(TransactionDetailScreenRoute.name, path: 'transaction/detail');

  static const String name = 'TransactionDetailScreenRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(ProfileScreenRoute.name, path: 'profile/user');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [ProfileUserFormScreen]
class ProfileUserFormScreenRoute extends PageRouteInfo<void> {
  const ProfileUserFormScreenRoute()
      : super(ProfileUserFormScreenRoute.name, path: 'profile/user/form');

  static const String name = 'ProfileUserFormScreenRoute';
}

/// generated route for
/// [ProfileChangePassword]
class ProfileChangePasswordRoute extends PageRouteInfo<void> {
  const ProfileChangePasswordRoute()
      : super(ProfileChangePasswordRoute.name, path: 'profile/change-password');

  static const String name = 'ProfileChangePasswordRoute';
}

/// generated route for
/// [StoreListScreen]
class StoreListScreenRoute extends PageRouteInfo<void> {
  const StoreListScreenRoute()
      : super(StoreListScreenRoute.name, path: 'profile/store');

  static const String name = 'StoreListScreenRoute';
}

/// generated route for
/// [StoreFormScreen]
class StoreFormScreenRoute extends PageRouteInfo<void> {
  const StoreFormScreenRoute()
      : super(StoreFormScreenRoute.name, path: 'profile/store/form');

  static const String name = 'StoreFormScreenRoute';
}
