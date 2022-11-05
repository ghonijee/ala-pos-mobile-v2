import 'package:ala_pos/feature/auth/domain/models/sign_up/sign_up_model.dart';
import 'package:ala_pos/shared/fields/fields.dart';
import 'package:ala_pos/shared/fields/store_category_field.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    @Default(UsernameField.pure()) UsernameField usernameField,
    @Default(PhoneField.pure()) PhoneField phoneField,
    @Default(PasswordField.pure()) PasswordField passwordField,
    @Default(StoreNameField.pure()) StoreNameField storeNameField,
    @Default(PhoneField.pure()) PhoneField storePhoneField,
    @Default(StoreCategoryField.pure()) StoreCategoryField storeCategoryField,
    @Default(AddressField.pure()) AddressField storeAddressField,
    @Default('') String message,
    @Default(false) bool haveStore,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _RegisterState;

  FormzStatus get formRegisteredStatus {
    return Formz.validate([passwordField, usernameField, phoneField]);
  }

  FormzStatus get formStoreStatus {
    return Formz.validate([storeNameField, storePhoneField, storeCategoryField, storeAddressField]);
  }

  SignUpModel toSignUpModel() {
    return SignUpModel(username: usernameField.value!, password: passwordField.value!, phone: phoneField.value!);
  }
}
