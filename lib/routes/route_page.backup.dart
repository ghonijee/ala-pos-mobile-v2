// import 'package:ala_pos/presentation/pages/auth/store_form/screens/new_store_form_page.dart';
// import 'package:ala_pos/presentation/pages/pos/screen/pos_page.dart';
// import 'package:ala_pos/presentation/pages/pos/screen/cart/cart_screen.dart';
// import 'package:ala_pos/presentation/pages/pos/widgets/edit_order_item_screen.dart';
// import 'package:ala_pos/presentation/pages/pos/widgets/order_success_screen.dart';
// import 'package:ala_pos/presentation/pages/pos/widgets/payment_cash_screen.dart';
// import 'package:ala_pos/presentation/pages/pos/widgets/print_receipt_screen.dart';
// import 'package:ala_pos/presentation/pages/pos/widgets/resume_order_screen.dart';
// import 'package:ala_pos/presentation/pages/splashscreen/screens/splashscreen_page.dart';
//  

// import '../presentation/pages/auth/login/screens/login_page.dart';
// import '../presentation/pages/auth/register/screen/register_page.dart';

// part "route_name.dart";

// final initRouter = GoRouter(
//   initialLocation: RouteName.SplashScreen,
//   urlPathStrategy: UrlPathStrategy.path,
//   debugLogDiagnostics: true,
//   routes: [
//     GoRoute(
//       path: RouteName.SplashScreen,
//       builder: (context, state) => const SplashScreenPage(),
//     ),
//     GoRoute(
//       path: RouteName.Login,
//       builder: (context, state) => const LoginPage(),
//       name: RouteName.Login,
//     ),
//     GoRoute(
//         path: RouteName.Register,
//         builder: (context, state) => const RegisterPage(),
//         name: RouteName.Register,
//         routes: [
//           GoRoute(
//             path: RouteName.NewStoreForm,
//             builder: (context, state) => const NewStoreFormPage(),
//             name: RouteName.NewStoreForm,
//           ),
//         ]),
//     GoRoute(
//       path: RouteName.Pos,
//       builder: (context, state) => const PosPage(),
//       name: RouteName.Pos,
//       routes: [
//         GoRoute(
//           path: RouteName.PosCart,
//           builder: (context, state) => const CartScreen(),
//           name: RouteName.PosCart,
//         ),
//       ],
//     ),
//     GoRoute(
//       path: RouteName.PosOrderItemEdit,
//       builder: (context, state) => const EditOrderItemScreen(),
//       name: RouteName.PosOrderItemEdit,
//     ),
//     GoRoute(
//       path: RouteName.PosOrderResume,
//       builder: (context, state) => const ResumeOrderScreen(),
//       name: RouteName.PosOrderResume,
//     ),
//     GoRoute(
//       path: RouteName.PosPaymentCash,
//       builder: (context, state) => const PaymentCashScreen(),
//       name: RouteName.PosPaymentCash,
//     ),
//     GoRoute(
//       path: RouteName.PosOrderSuccess,
//       builder: (context, state) => const OrderSuccessScreen(),
//       name: RouteName.PosOrderSuccess,
//     ),
//     GoRoute(
//       path: RouteName.PosPrintReceipt,
//       builder: (context, state) => const PrintReceiptScreen(),
//       name: RouteName.PosPrintReceipt,
//     ),
//   ],
// );
