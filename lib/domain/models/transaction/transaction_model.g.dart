// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'user_id', 'date', 'amount', 'receivedMoney'],
  );
  return _$_TransactionModel(
    id: json['id'] as String?,
    userId: json['user_id'] as int?,
    storeId: json['store_id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    status: json['status'] as String?,
    discountPrice: json['discount'] as int? ?? 0,
    note: json['note'] as String?,
    amount: json['amount'] as int? ?? 0,
    receivedMoney: json['receivedMoney'] as int?,
    changeMoney: json['changeMoney'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => TransactionItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'store_id': instance.storeId,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'discount': instance.discountPrice,
      'note': instance.note,
      'amount': instance.amount,
      'receivedMoney': instance.receivedMoney,
      'changeMoney': instance.changeMoney,
      'items': instance.items,
    };
