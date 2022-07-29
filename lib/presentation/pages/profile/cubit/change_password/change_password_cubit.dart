import 'package:ala_pos/domain/models/user/change_password_model.dart';
import 'package:ala_pos/presentation/pages/profile/field/password_field.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState());

  submit() {}
}
