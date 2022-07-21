import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@unfreezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  factory TransactionModel({
    @JsonKey(name: "id", required: true)
        int? id,
    @JsonKey(name: "key", required: false)
        String? key,
    @JsonKey(name: "user_id", required: true)
        int? userId,
    @JsonKey(name: "store_id")
        int? storeId,
    @JsonKey(name: "date", required: true)
        DateTime? date,
    @JsonKey(name: "status", required: false)
        String? status,
    @JsonKey(name: "discount", required: false)
    @Default(0)
        int? discountPrice,
    @JsonKey(name: "note", required: false)
        String? note,
    @JsonKey(name: "amount", required: true)
    @Default(0)
        int? amount,
    @JsonKey(name: "received_money", required: true)
    @Default(0)
        int? receivedMoney,
    @JsonKey(name: "change_money", required: false)
    @Default(0)
        int? changeMoney,
    @JsonKey(
      name: "items",
    )
        List<TransactionItemModel>? items,
  }) = _TransactionModel;

  bool get hasDiscount {
    return discountPrice! > 0;
  }

  int get result {
    return amount! - discountPrice!;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
