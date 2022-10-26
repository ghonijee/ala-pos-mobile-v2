import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart';
import 'package:auto_route/auto_route.dart';

import '../screen/pos_cart_item_screen.dart';
import '../screen/pos_cart_screen.dart';
import '../screen/pos_payment_screen.dart';

class PosRouteName {
  static const String Pos = "/pos";
  static const String PosCart = "/pos/cart";
  static const String PosCartDetail = "/pos/cart/:id";
  static const String PosPayment = "/pos/payment";
}

const posRouter = [
  AutoRoute(page: PosMainScreen, path: PosRouteName.Pos),
  AutoRoute(page: PosCartScreen, path: PosRouteName.PosCart),
  AutoRoute(page: PosCartItemScreen, path: PosRouteName.PosCartDetail),
  AutoRoute(page: PosPaymentScreen, path: PosRouteName.PosPayment),
];
