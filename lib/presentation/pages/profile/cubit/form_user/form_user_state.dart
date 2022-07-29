part of 'form_user_cubit.dart';

@freezed
class FormUserState with _$FormUserState {
  const FormUserState._();

  const factory FormUserState({
    required int id,
    @Default(UsernameField.pure()) UsernameField usernameField,
    @Default(FullnameField.pure()) FullnameField fullnameField,
    @Default(PhoneField.pure()) PhoneField phone,
    @Default(EmailField.pure()) EmailField email,
  }) = _FormUserState;

  FormzStatus get status {
    return Formz.validate([fullnameField, usernameField, email, phone]);
  }

  UserProfileModel toModel() => UserProfileModel(
        id: id,
        username: usernameField.value,
        fullname: fullnameField.value,
        phone: phone.value,
        email: email.value,
      );
}
