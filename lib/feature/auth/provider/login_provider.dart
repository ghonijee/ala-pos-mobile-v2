import 'package:ala_pos/app/domain/models/exception/exception.dart';
import 'package:ala_pos/feature/auth/state/login/login_state.dart';
import 'package:ala_pos/feature/store/domain/repository/store_repository.dart';
import 'package:ala_pos/feature/user_management/domain/repository/user_repository.dart';
import 'package:ala_pos/shared/fields/password_field.dart';
import 'package:ala_pos/shared/fields/username_field.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:primer_flutter/primer_flutter.dart';

import '../domain/repository/auth_repository.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(
    ref.read(authRepositoryProvider),
    ref.read(userRepositoryProvider),
    ref.read(storeRepositoryProvider),
  ),
);

class LoginNotifier extends StateNotifier<LoginState> {
  AuthRepository loginRepository;
  UserRepository userRepository;
  StoreRepository storeRepository;
  LoginNotifier(this.loginRepository, this.userRepository, this.storeRepository) : super(LoginState());

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
      // var error = result.failure as AppExceptionErrorMessage;
      result.failure.maybeWhen(errorWithMessage: (message) {
        state = state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: message,
        );
      }, unauthorized: () {
        state = state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: "Unauthorized",
        );
      }, connectivity: () {
        state = state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: "Terjadi kesalahan pada koneksi",
        );
      }, orElse: () {
        state = state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: "Terjadi kesalahan pada aplikasi",
        );
      });
    } else {
      /// TODO: Check apakah user sudah punya toko
      await storeRepository.mainStore();
      await userRepository.rolePermissions();
      state = state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
      );
    }
  }
}
