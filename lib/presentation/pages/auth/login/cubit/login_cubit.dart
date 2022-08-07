import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:ala_pos/presentation/fields/fields.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain/repositories/auth_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final StoreRepository storeRepository;

  LoginCubit(AuthRepository authRepository, this.storeRepository)
      : _authRepository = authRepository,
        super(LoginState());

  /// Method for Sign In Proccess.
  void signIn() async {
    try {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionInProgress,
      ));
      print(state.toString());
      // emit(LoginState.loading());
      var signInAction = await _authRepository.signIn(
        state.usernameField.value,
        state.passwordField.value,
      );
      signInAction.fold((failure) {
        emit(state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: failure.message,
        ));
      }, (loginModel) {
        checkUserMainStore();
      });
    } catch (e) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
        message: e.toString(),
      ));
    }
  }

  /// Check user login have main store or not
  /// if not redirect to StoreForm
  /// if have emit success and redirect to Home
  void checkUserMainStore() async {
    var result = await storeRepository.mainStore();

    result.fold((failure) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
        message: failure.message,
        haveStore: false,
      ));
    }, (right) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
        haveStore: true,
      ));
    });
  }

  usernameChange(String value) {
    var field = UsernameField.dirty(value);
    emit(state.copyWith(
      usernameField: field,
    ));
    print(state.toString());
  }

  passwordChange(String value) {
    var field = PasswordField.dirty(value);
    emit(state.copyWith(
      passwordField: field,
    ));
    print(state.toString());
  }
}
