import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(LoginState.initial());

  /// Method for Sign In Proccess.
  /// [username] and [password] is required params
  void signIn({required String username, required String password}) async {
    try {
      emit(LoginState.loading());
      var signInAction = await _authRepository.signIn(username, password);
      signInAction.fold((failure) {
        emit(LoginState.onFailure(message: failure.message));
      }, (loginModel) {
        emit(LoginState.onSuccess());
      });
    } catch (e) {
      emit(LoginState.onFailure(message: e.toString()));
    }
  }
}
