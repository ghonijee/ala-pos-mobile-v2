import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_item_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@unfreezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  factory TransactionModel({
    @JsonKey(name: "id", required: true)
        int? id,
    @JsonKey(name: "invoice_number", required: false)
        String? invoiceNumber,
    @JsonKey(name: "key", required: false)
        String? key,
    @JsonKey(name: "user_id", required: true)
        int? userId,
    @JsonKey(name: "store_id")
        int? storeId,
    @JsonKey(name: "customer_name")
        String? customerName,
    @JsonKey(name: "customer_id")
        int? customerId,
    @JsonKey(name: "date", required: true)
        DateTime? date,
    @JsonKey(name: "status", required: false)
        String? status,
    @JsonKey(name: "discount_mode")
    @Default("harga")
        String discountMode,
    @JsonKey(name: "discount_price")
    @Default(0)
        int discountPrice,
    @JsonKey(name: "discount_percentage")
    @Default(0.0)
        double? discountPercentage,
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
    @Default("CASH")
    @JsonKey(name: "payment_mode", required: true)
    @JsonKey(name: "payment_mode_id", required: false)
        int? paymentModeId,
    @JsonKey(
      name: "products",
    )
        List<TransactionItemModel>? items,
  }) = _TransactionModel;

  int get result {
    if (discountMode == "harga") {
      return amount! - discountPrice;
    } else {
      return amount! - (discountPercentage! / 100.0 * amount!.toDouble()).toInt();
    }
  }

  int get discount {
    if (discountMode == "harga") {
      return discountPrice;
    } else {
      return (discountPercentage! / 100.0 * amount!.toDouble()).toInt();
    }
  }

  bool get hasDiscount {
    return discountPercentage! > 0 || discountPrice > 0;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
