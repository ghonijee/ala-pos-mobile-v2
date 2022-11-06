// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'user_id', 'date', 'amount', 'received_money'],
  );
  return _$_TransactionModel(
    id: json['id'] as int?,
    invoiceNumber: json['invoice_number'] as String?,
    key: json['key'] as String?,
    userId: json['user_id'] as int?,
    storeId: json['store_id'] as int?,
    customerName: json['customer_name'] as String?,
    customerId: json['customer_id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    status: json['status'] as String?,
    discountPrice: json['discount'] as int? ?? 0,
    note: json['note'] as String?,
    amount: json['amount'] as int? ?? 0,
    receivedMoney: json['received_money'] as int? ?? 0,
    changeMoney: json['change_money'] as int? ?? 0,
    items: (json['products'] as List<dynamic>?)
        ?.map((e) => TransactionItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.invoiceNumber,
      'key': instance.key,
      'user_id': instance.userId,
      'store_id': instance.storeId,
      'customer_name': instance.customerName,
      'customer_id': instance.customerId,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'discount': instance.discountPrice,
      'note': instance.note,
      'amount': instance.amount,
      'received_money': instance.receivedMoney,
      'change_money': instance.changeMoney,
      'products': instance.items?.map((e) => e.toJson()).toList(),
    };
