// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionItemModel _$$_TransactionItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionItemModel(
      id: json['id'] as int,
      transactionId: json['transaction_id'] as int,
      storeId: json['store_id'] as int,
      productId: json['product_id'] as int,
      productName: json['product_name'] as String,
      price: json['price'] as int,
      productCost: json['product_cost'] as int? ?? 0,
      discountPrice: json['discount_price'] as int? ?? 0,
      discountPercentage:
          (json['discount_percentage'] as num?)?.toDouble() ?? 0.0,
      note: json['note'] as String?,
      quantity: json['quantity'] as int,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_TransactionItemModelToJson(
        _$_TransactionItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'store_id': instance.storeId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'price': instance.price,
      'product_cost': instance.productCost,
      'discount_price': instance.discountPrice,
      'discount_percentage': instance.discountPercentage,
      'note': instance.note,
      'quantity': instance.quantity,
      'amount': instance.amount,
    };
