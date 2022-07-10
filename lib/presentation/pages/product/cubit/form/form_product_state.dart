part of 'form_product_cubit.dart';

@freezed
class FormProductState with _$FormProductState {
  const FormProductState._();

  const factory FormProductState({
    @Default(NameField.pure()) NameField name,
    @Default(PriceField.pure()) PriceField price,
    @Default(StockField.pure()) StockField stock,
    @Default(MinStockField.pure()) MinStockField minStock,
    @Default(CodeField.pure()) CodeField code,
    @Default(DescField.pure()) DescField desc,
    @Default(CostField.pure()) CostField cost,
    @Default(UnitField.pure()) UnitField unit,
    // @Default(FormzStatus.pure) FormzStatus status,
  }) = _FormProductState;

  FormzStatus get status {
    return Formz.validate([
      name,
      price,
      stock,
      minStock,
      code,
      cost,
      desc,
      unit,
    ]);
  }
}
