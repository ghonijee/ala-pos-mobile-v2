import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../fields/fields.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterState());

  submit() async {
    emit(state.copyWith(statusSubmission: FormzStatus.submissionInProgress));
    var result = await authRepository.signUp(
      username: state.usernameField.value,
      password: state.passwordField.value,
      phone: state.phoneField.value,
    );
    result.fold((failure) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
        message: failure.message,
      ));
    }, (login) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
      ));
    });
  }

  usernameChange(String value) {
    var field = UsernameField.dirty(value);
    emit(state.copyWith(
      usernameField: field,
    ));
  }

  passwordChange(String value) {
    var field = PasswordField.dirty(value);
    emit(state.copyWith(
      passwordField: field,
    ));
  }

  phoneChange(String value) {
    var field = PhoneField.dirty(value);
    emit(state.copyWith(
      phoneField: field,
    ));
  }
}
