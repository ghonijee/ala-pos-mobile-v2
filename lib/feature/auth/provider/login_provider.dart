import 'package:ala_pos/feature/auth/state/login/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/repository/auth_repository.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(
    ref.read(
      authRepositoryProvider,
    ),
  ),
);

class LoginNotifier extends StateNotifier<LoginState> {
  AuthRepository loginRepository;
  LoginNotifier(this.loginRepository) : super(LoginState());

  changeUsername(String value) async {
    //
  }

  changePassword(String value) async {
    //
  }

  submit() async {
    //
  }
}
