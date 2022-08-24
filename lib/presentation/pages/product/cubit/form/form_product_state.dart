part of 'form_product_cubit.dart';

@freezed
class FormProductState with _$FormProductState {
  const FormProductState._();

  const factory FormProductState({
    int? id,
    int? storeId,
    @Default(NameField.pure()) NameField name,
    @Default(PriceField.pure()) PriceField price,
    @Default(StockField.pure()) StockField stock,
    @Default(UseStockOpnameField.pure()) UseStockOpnameField useStockOpnameField,
    @Default(MinStockField.pure()) MinStockField minStock,
    @Default(CodeField.pure()) CodeField code,
    @Default(DescField.pure()) DescField desc,
    @Default(CostField.pure()) CostField cost,
    @Default(UnitField.pure()) UnitField unit,
    @Default(FormzStatus.pure) FormzStatus statusSubmission,
    @Default("") String message,
  }) = _FormProductState;

  FormzStatus get status {
    return Formz.validate([
      name,
      price,
      stock,
      useStockOpnameField,
      minStock,
      code,
      cost,
      desc,
      unit,
    ]);
  }

  ProductModel toModel() => ProductModel(
        id: id,
        storeId: storeId,
        name: name.value,
        price: price.value ?? 0,
        stock: stock.value ?? 0,
        minStock: minStock.value ?? 0,
        code: code.value,
        cost: cost.value,
        description: desc.value,
        unit: unit.value,
        useStockOpname: useStockOpnameField.value,
      );
}
