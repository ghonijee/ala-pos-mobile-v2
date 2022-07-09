part of 'form_product_cubit.dart';

@freezed
class FormProductState with _$FormProductState {
  factory FormProductState({
    @Default(NameField.pure()) NameField name,
    @Default(PriceField.pure()) PriceField price,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _FormProductState;
}
