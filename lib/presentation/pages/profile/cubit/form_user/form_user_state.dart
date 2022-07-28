part of 'form_user_cubit.dart';

@freezed
class FormUserState with _$FormUserState {
  const FormUserState._();

  const factory FormUserState({
    @Default(UsernameField.pure()) UsernameField usernameField,
    @Default(FullnameField.pure()) FullnameField fullnameField,
    @Default(PasswordField.pure()) PasswordField password,
    @Default(PhoneField.pure()) PhoneField phone,
    @Default(EmailField.pure()) EmailField email,
  }) = _FormUserState;

  // FormzStatus get status {
  //   return Formz.validate([usernam]);
  // }

  UserModel toModel() => UserModel();
}
