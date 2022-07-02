import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@unfreezed
class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    @JsonKey(name: "id", required: true) required String id,
    @JsonKey(name: "user_id", required: true) required String userId,
    @JsonKey(name: "store_id") required String storeId,
    @JsonKey(name: "date", required: true) required DateTime date,
    @JsonKey(name: "status", required: false) String? status,
    @JsonKey(name: "discount", required: false) double? discount,
    @JsonKey(name: "note", required: false) String? note,
    @JsonKey(name: "amount", required: true) required int amount,
    @JsonKey(name: "receivedMoney", required: true) required int receivedMoney,
    @JsonKey(name: "changeMoney", required: false) int? changeMoney,
    @JsonKey(name: "items") required List<TransactionItemModel> items,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}

  // id String
  // user_id String
  // store_id String
  // date date
  // status String
  // discount_order double
  // note String
  // total double
  // received_monay double
  // change_monay double




// part 'immutable_class.freezed.dart';
// part 'immutable_class.g.dart';

// @freezed
// abstract class ImmutableClass with _$ImmutableClass {
//   @HiveType(typeId: 5, adapterName: 'ImmutableClassAdapter')
//   const factory ImmutableClass({
//     @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) int id,
//     @HiveField(1) int someField1,
//     @HiveField(2) String someField2,
//   }) = _ImmutableClass;

//   factory ImmutableClass.fromJson(Map<String, dynamic> json) => _$ImmutableClassFromJson(json);
// }


// @freezed
// abstract class ImmutableClass with _$ImmutableClass {
//   @HiveType(typeId: 5, adapterName: 'ImmutableClassAdapter')
//   const factory ImmutableClass({
//     @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) int id,
//     @HiveField(1) int someField1,
//     @HiveField(2) String someField2,
//   }) = _ImmutableClass;

//   factory ImmutableClass.fromJson(Map<String, dynamic> json) => _$ImmutableClassFromJson(json);
// }