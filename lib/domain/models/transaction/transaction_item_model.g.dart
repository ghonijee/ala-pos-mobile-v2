// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionItemModel _$$_TransactionItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionItemModel(
      id: json['id'] as String,
      transactionId: json['transaction_id'] as String,
      storeId: json['store_id'] as int,
      productId: json['product_id'] as int,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      price: json['price'] as int,
      discount: (json['discount'] as num?)?.toDouble(),
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
      'product': instance.product,
      'price': instance.price,
      'discount': instance.discount,
      'note': instance.note,
      'quantity': instance.quantity,
      'amount': instance.amount,
    };
