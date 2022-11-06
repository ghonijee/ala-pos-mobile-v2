import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item_model.freezed.dart';
part 'transaction_item_model.g.dart';

@unfreezed
class TransactionItemModel with _$TransactionItemModel {
  const TransactionItemModel._();

  factory TransactionItemModel({
    @JsonKey(name: "id")
        int? id,
    @JsonKey(name: "transaction_id")
        int? transactionId,
    @JsonKey(name: "store_id")
        int? storeId,
    @JsonKey(
      name: "product_id",
    )
        int? productId,
    @JsonKey(name: "product_name")
        required String productName,
    @JsonKey(name: "price")
        required int price,
    @JsonKey(name: "product_cost")
    @Default(0)
        int? productCost,
    @JsonKey(name: "discount_price")
    @Default(0)
        int discountPrice,
    @JsonKey(name: "discount_percentage")
    @Default(0.0)
        double? discountPercentage,
    @JsonKey(name: "note")
        String? note,
    @JsonKey(name: "quantity")
        required int quantity,
    @JsonKey(name: "amount")
        required int amount,
  }) = _TransactionItemModel;

  int get result {
    return price - discountPrice;
  }

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);
}
