import 'package:ala_pos/presentation/home/screen/home_page.dart';
import 'package:ala_pos/presentation/login/screens/login_page.dart';
import 'package:ala_pos/presentation/register/screen/register_page.dart';
import 'package:ala_pos/presentation/splashscreen/screens/splashscreen_page.dart';
import 'package:go_router/go_router.dart';

part "route_name.dart";

final initRouter = GoRouter(
  initialLocation: RouteName.SplashScreen,
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
    ),
    GoRoute(
      path: RouteName.HomePos,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
