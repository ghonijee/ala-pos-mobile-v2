import 'package:ala_pos/feature/auth/state/register/register_state.dart';
import 'package:ala_pos/shared/fields/fields.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/domain/models/exception/app_exception.dart';
import '../domain/repository/auth_repository.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(
    ref.read(
      authRepositoryProvider,
    ),
  ),
);

class RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthRepository authRepository;
  RegisterNotifier(this.authRepository) : super(RegisterState());

  changeUsername(String value) async {
    state = state.copyWith(
      usernameField: UsernameField.dirty(value),
      statusSubmission: FormzStatus.pure,
    );
  }

  changePhone(String value) async {
    state = state.copyWith(
      phoneField: PhoneField.dirty(value),
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
    var result = await authRepository.signUp(state.toSignUpModel());
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
