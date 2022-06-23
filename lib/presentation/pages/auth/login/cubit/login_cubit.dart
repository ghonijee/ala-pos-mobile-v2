import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
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
        checkUserMainStore();
      });
    } catch (e) {
      emit(LoginState.onFailure(message: e.toString()));
    }
  }

  /// Check user login have main store or not
  /// if not redirect to StoreForm
  /// if have emit success and redirect to Home
  void checkUserMainStore() async {
    var result = await storeRepository.mainStore();
    result.fold((l) {
      emit(LoginState.notHaveStore());
    }, (r) {
      emit(LoginState.onSuccess());
    });

    // print()
  }
}
