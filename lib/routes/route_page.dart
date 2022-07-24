import 'package:ala_pos/presentation/pages/pos/screen/order_result_page.dart';
import 'package:ala_pos/presentation/pages/receipt/screen/receipt_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_detail_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_list_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_wrapper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../presentation/pages/pages.dart';
import '../presentation/pages/product/product.dart';

part "route_name.dart";
part 'route_page.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
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
      AutoRoute(page: OrderResultPage, path: RouteName.posOrderSuccess),
    ]),
    AutoRoute(page: MasterProductWrapper, path: RouteName.product, children: [
      AutoRoute(page: ProductGridScreen, path: RouteName.productList, initial: true),
      AutoRoute(page: ProductFormScreen, path: RouteName.productForm),
    ]),
    AutoRoute(page: TransactionWrapper, path: RouteName.transaction, children: [
      AutoRoute(page: TransactionListScreen, path: RouteName.transactionList, initial: true),
      AutoRoute(page: TransactionDetailScreen, path: RouteName.transactionDetail),
    ]),
    AutoRoute(page: ReceiptScreen, path: RouteName.receiptScreen),
  ],
)

// extend the generated private router
class RoutePage extends _$RoutePage {}

RoutePage initRouter = RoutePage();
