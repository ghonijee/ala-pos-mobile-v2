import 'package:ala_pos/app/home/screen/home_page.dart';
import 'package:ala_pos/app/login/screens/login_page.dart';
import 'package:ala_pos/app/register/screen/register_page.dart';
import 'package:ala_pos/app/splashscreen/screens/splashscreen_page.dart';
import 'package:go_router/go_router.dart';

part "route_name.dart";

final initRouter = GoRouter(
  initialLocation: Route.Register,
  routes: [
    GoRoute(
      path: Route.SplashScreen,
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: Route.Login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Route.Register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Route.HomePos,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
