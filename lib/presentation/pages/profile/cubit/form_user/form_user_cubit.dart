import 'package:ala_pos/domain/models/user/user_profile_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/domain/repositories/user_repository.dart';
import 'package:ala_pos/presentation/pages/profile/field/email_field.dart';
import 'package:ala_pos/presentation/pages/profile/field/password_field.dart';
import 'package:ala_pos/presentation/pages/profile/field/phone_field.dart';
import 'package:ala_pos/presentation/pages/profile/field/username_field.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../field/fullname_field.dart';

part 'form_user_state.dart';
part 'form_user_cubit.freezed.dart';

@injectable
class FormUserCubit extends Cubit<FormUserState> {
  late bool isUpdate;
  final UserRepository repository;
  FormUserCubit(this.repository) : super(FormUserState(id: 0));

  show(UserModel userModel) {
    isUpdate = true;
    emit(state.copyWith(
      id: userModel.id!,
      fullnameField: FullnameField.dirty(userModel.fullname!),
      usernameField: UsernameField.dirty(userModel.username),
      email: EmailField.dirty(userModel.email ?? ""),
      phone: PhoneField.dirty(userModel.phone!),
    ));
  }
}
