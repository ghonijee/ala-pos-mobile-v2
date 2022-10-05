import 'package:auto_route/auto_route.dart';

import '../screen/login_screen.dart';
import '../screen/new_store_form_screen.dart';
import '../screen/register_screen.dart';

class AuthRouteName {
  static const String Register = "/register";
  static const String Login = "/login";
  static const String NewStoreForm = "/new-store-form";
  static const String RegisterResult = "/register-result";
}

const authRouter = [
  AutoRoute(page: LoginScreen, path: AuthRouteName.Login),
  AutoRoute(page: RegisterScreen, path: AuthRouteName.Register),
  AutoRoute(page: NewStoreFormScreen, path: AuthRouteName.NewStoreForm),
];
