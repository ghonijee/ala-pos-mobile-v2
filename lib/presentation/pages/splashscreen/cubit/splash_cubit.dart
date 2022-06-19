import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final AuthRepository _authRepository;

  SplashCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SplashState.loading());

  startTime() {
    emit(SplashState.loading());

    Future.delayed(const Duration(seconds: 3), () async {
      await authCheck();
    });
  }

  authCheck() async {
    var checkToken = await _authRepository.checkToken();
    checkToken.fold((l) {
      emit(SplashState.loaded(false));
    }, (r) {
      emit(SplashState.loaded(r.loggedStatus));
    });
  }
}
