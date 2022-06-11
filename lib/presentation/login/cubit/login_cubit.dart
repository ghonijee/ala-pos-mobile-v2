import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  /// Method for Sign In Proccess.
  /// [username] and [password] is required params
  void signIn({required String username, required String password}) async {
    try {
      emit(LoginState.loading());
      bool statusLogin = await Future.value(false);
      if (statusLogin) {
        emit(LoginState.onSuccess());
      } else {
        throw Exception("Username / Password salah");
      }
    } catch (e) {
      emit(LoginState.onFailure(message: e.toString()));
    }
  }
}
