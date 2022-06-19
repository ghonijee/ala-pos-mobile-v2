import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterState.initial());

  submit({required String username, required String phone, required String password}) async {
    emit(RegisterState.loading());
    var result = await authRepository.signUp(username: username, password: password, phone: phone);
    result.fold((failure) {
      emit(RegisterState.failed(message: failure.message));
    }, (login) {
      emit(RegisterState.success());
    });
  }
}
