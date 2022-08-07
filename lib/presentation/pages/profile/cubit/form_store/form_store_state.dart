part of 'form_store_cubit.dart';

@freezed
class FormStoreState with _$FormStoreState {
  const FormStoreState._();

  const factory FormStoreState({
    required int id,
    @Default(StoreNameField.pure()) StoreNameField storeNameField,
    @Default(AddressField.pure()) AddressField addressField,
    @Default(PhoneField.pure()) PhoneField phoneField,
    @Default(UseStockOpnameField.pure()) UseStockOpnameField useStockOpnameField,
    @Default('') String message,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
  }) = _FormStoreState;

  FormzStatus get status {
    return Formz.validate([storeNameField, addressField, phoneField, useStockOpnameField]);
  }

  StoreModel toModel() => StoreModel(
        id: id,
        name: storeNameField.value,
        address: addressField.value,
        phone: phoneField.value,
        useStockOpname: useStockOpnameField.value,
      );

  loading() {
    return copyWith(statusSubmission: FormzStatus.submissionInProgress);
  }
}
