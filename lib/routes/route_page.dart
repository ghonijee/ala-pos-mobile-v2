import 'package:ala_pos/presentation/pages/login/screens/login_page.dart';
import 'package:ala_pos/presentation/pages/pos/screen/pos_page.dart';
import 'package:ala_pos/presentation/pages/register/screen/register_page.dart';
import 'package:ala_pos/presentation/pages/splashscreen/screens/splashscreen_page.dart';
import 'package:go_router/go_router.dart';

part "route_name.dart";

final initRouter = GoRouter(
  initialLocation: RouteName.SplashScreen,
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteName.SplashScreen,
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: RouteName.Login,
      builder: (context, state) => const LoginPage(),
      name: RouteName.Login,
    ),
    GoRoute(
      path: RouteName.Register,
      builder: (context, state) => const RegisterPage(),
      name: RouteName.Register,
    ),
    GoRoute(
      path: RouteName.Pos,
      builder: (context, state) => const PosPage(),
      name: RouteName.Pos,
    ),
  ],
);
