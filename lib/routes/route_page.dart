import 'package:ala_pos/presentation/pages/pos/screen/custom_item_page.dart';
import 'package:ala_pos/presentation/pages/pos/screen/order_result_page.dart';
import 'package:ala_pos/presentation/pages/profile/screen/profile_change_password.dart';
import 'package:ala_pos/presentation/pages/profile/screen/profile_screen.dart';
import 'package:ala_pos/presentation/pages/profile/screen/profile_user_form_screen.dart';
import 'package:ala_pos/presentation/pages/profile/screen/profile_wrapper.dart';
import 'package:ala_pos/presentation/pages/profile/screen/store_form_screen.dart';
import 'package:ala_pos/presentation/pages/profile/screen/store_list_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_detail_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_list_screen.dart';
import 'package:ala_pos/presentation/pages/transaction/screen/transaction_wrapper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../presentation/pages/pages.dart';
import '../presentation/pages/product/product.dart';
import '../presentation/pages/receipt/screen/receipt_page.dart';
import '../domain/models/transaction/transaction_model.dart';

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
      AutoRoute(page: CustomItemPage, path: RouteName.posCustomProduct),
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
    AutoRoute(page: ReceiptPage, path: RouteName.receiptScreen),
    AutoRoute(page: ProfileWrapper, path: RouteName.profile, children: [
      AutoRoute(page: ProfileScreen, path: RouteName.profileUser, initial: true),
      AutoRoute(page: ProfileUserFormScreen, path: RouteName.profileUserForm),
      AutoRoute(page: ProfileChangePassword, path: RouteName.profileChangePassword),
      AutoRoute(page: StoreListScreen, path: RouteName.profileStoreList),
      AutoRoute(page: StoreFormScreen, path: RouteName.profileStoreForm),
    ]),
  ],
)
class RoutePage extends _$RoutePage {}

RoutePage initRouter = RoutePage();
