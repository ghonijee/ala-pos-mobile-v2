import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.loading());

  startTime() {
    Future.delayed(const Duration(seconds: 3), () async {
      await authCheck();
    });
  }

  authCheck() async {
    bool statusLogin = await Future.value(false);
    emit(SplashState.loaded(statusLogin));
  }
}
