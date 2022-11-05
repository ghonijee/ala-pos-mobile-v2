import 'package:ala_pos/feature/auth/domain/models/sign_up/sign_up_model.dart';
import 'package:ala_pos/shared/fields/fields.dart';
import 'package:ala_pos/shared/fields/store_category_field.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_register_state.freezed.dart';

@freezed
class StoreRegisterState with _$StoreRegisterState {
  const StoreRegisterState._();

  const factory StoreRegisterState({
    @Default(StoreNameField.pure()) StoreNameField storeNameField,
    @Default(PhoneField.pure()) PhoneField storePhoneField,
    @Default(StoreCategoryField.pure()) StoreCategoryField storeCategoryField,
    @Default(AddressField.pure()) AddressField storeAddressField,
    @Default('') String message,
    @Default(false) bool haveStore,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _StoreRegisterState;

  // FormzStatus get formStoreStatus {
  //   return Formz.validate([storeNameField, storePhoneField, storeCategoryField, storeAddressField]);
  // }

  // SignUpModel toSignUpModel() {
  //   return SignUpModel(username: usernameField.value!, password: passwordField.value!, phone: phoneField.value!);
  // }
}
