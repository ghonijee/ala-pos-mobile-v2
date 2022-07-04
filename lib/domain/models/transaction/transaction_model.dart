import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@unfreezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  factory TransactionModel({
    @JsonKey(name: "id", required: true) String? id,
    @JsonKey(name: "user_id", required: true) int? userId,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "date", required: true) DateTime? date,
    @JsonKey(name: "status", required: false) String? status,
    @JsonKey(name: "discount", required: false) @Default(0) int? discountPrice,
    @JsonKey(name: "note", required: false) String? note,
    @JsonKey(name: "amount", required: true) @Default(0) int? amount,
    @JsonKey(name: "receivedMoney", required: true) @Default(0) int? receivedMoney,
    @JsonKey(name: "changeMoney", required: false) @Default(0) int? changeMoney,
    @JsonKey(name: "items") List<TransactionItemModel>? items,
  }) = _TransactionModel;

  bool get hasDiscount {
    return discountPrice! > 0;
  }

  int get result {
    return amount! - discountPrice!;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
