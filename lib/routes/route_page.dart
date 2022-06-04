import 'package:ala_pos/app/splashscreen/screens/splashscreen_page.dart';
import 'package:go_router/go_router.dart';

part "route_name.dart";

final initRouter = GoRouter(
  initialLocation: Route.SplashScreen,
  routes: [
    GoRoute(
      path: Route.SplashScreen,
      builder: (context, state) => const SplashScreenPage(),
    ),
  ],
);
