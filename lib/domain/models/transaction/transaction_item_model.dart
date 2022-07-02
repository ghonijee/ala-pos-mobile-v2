import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction_item_model.freezed.dart';
part 'transaction_item_model.g.dart';

@unfreezed
class TransactionItemModel with _$TransactionItemModel {
  const TransactionItemModel._();

  factory TransactionItemModel({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "transaction_id") required String transactionId,
    @JsonKey(name: "store_id") required int storeId,
    @JsonKey(name: "product_id") required int productId,
    @JsonKey(name: "product") required String productName,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "discount_price") @Default(0) int discountPrice,
    @JsonKey(name: "discount_percentage") @Default(0.0) double? discountPercentage,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "quantity") required int quantity,
    @JsonKey(name: "amount") required int amount,
  }) = _TransactionItemModel;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);
}
