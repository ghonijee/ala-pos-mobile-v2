import 'package:ala_pos/domain/models/user/change_password_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:ala_pos/domain/repositories/user_repository.dart';
import 'package:ala_pos/presentation/pages/profile/field/password_confirm_field.dart';
import 'package:ala_pos/presentation/pages/profile/field/password_field.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  UserRepository userRepository;
  AuthRepository authRepository;
  ChangePasswordCubit(this.authRepository, this.userRepository) : super(ChangePasswordState());

  submit() async {
    try {
      var user = await authRepository.user;
      var data = ChangePasswordModel(
        id: user.id!,
        newPassword: state.newPassword.value,
        newPasswordConfirm: state.newPasswordConfirm.value,
        oldPassword: state.oldPassword.value,
      );

      var result = await userRepository.changePassword(data);

      result.fold((failure) {
        emit(state.copyWith(
          statusSubmission: FormzStatus.submissionFailure,
          message: failure.message,
        ));
      }, (response) {
        emit(state.copyWith(
          message: response.message!,
          statusSubmission: FormzStatus.submissionSuccess,
        ));
      });

      emit(ChangePasswordState());
    } catch (e) {
      emit(state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
        message: e.toString(),
      ));
    }
  }

  newPasswordChange(String value) {
    var newPassword = PasswordField.dirty(value);
    emit(state.copyWith(newPassword: newPassword));
  }

  newPasswordConfirmChange(String value) {
    var newPasswordConfirm = PasswordConfirmField.dirty(
      compare: state.newPassword,
      value: value,
    );
    emit(state.copyWith(newPasswordConfirm: newPasswordConfirm));
  }

  oldPasswordChange(String value) {
    var oldPass = PasswordField.dirty(value);
    emit(state.copyWith(oldPassword: oldPass));
  }
}
