import 'package:ala_pos/app/domain/models/exception/exception.dart';
import 'package:ala_pos/feature/auth/state/login/login_state.dart';
import 'package:ala_pos/shared/fields/password_field.dart';
import 'package:ala_pos/shared/fields/username_field.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';

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
    state = state.copyWith(
      usernameField: UsernameField.dirty(value),
      statusSubmission: FormzStatus.pure,
    );
  }

  changePassword(String value) async {
    state = state.copyWith(
      passwordField: PasswordField.dirty(value),
      statusSubmission: FormzStatus.pure,
    );
  }

  submit() async {
    var result = await loginRepository.signIn(state.usernameField.value!, state.passwordField.value!);
    if (result.isFailure) {
      var error = result.failure as AppExceptionErrorMessage;
      state = state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
        message: error.message,
      );
    } else {
      /// TODO: Check apakah user sudah punya toko
      state = state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
      );
    }
  }
}
