// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @JsonKey(name: "id", required: true)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id", required: true)
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "invoice_number", required: false)
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "invoice_number", required: false)
  set invoiceNumber(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "key", required: false)
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: "key", required: false)
  set key(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id", required: true)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id", required: true)
  set userId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  set storeId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_name")
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_name")
  set customerName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  set customerId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "date", required: true)
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "date", required: true)
  set date(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "status", required: false)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "status", required: false)
  set status(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "discount", required: false)
  int? get discountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "discount", required: false)
  set discountPrice(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "note", required: false)
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "note", required: false)
  set note(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "amount", required: true)
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "amount", required: true)
  set amount(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "received_money", required: true)
  int? get receivedMoney => throw _privateConstructorUsedError;
  @JsonKey(name: "received_money", required: true)
  set receivedMoney(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "change_money", required: false)
  int? get changeMoney => throw _privateConstructorUsedError;
  @JsonKey(name: "change_money", required: false)
  set changeMoney(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "products")
  List<TransactionItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "products")
  set items(List<TransactionItemModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id", required: true) int? id,
      @JsonKey(name: "invoice_number", required: false) String? invoiceNumber,
      @JsonKey(name: "key", required: false) String? key,
      @JsonKey(name: "user_id", required: true) int? userId,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "customer_name") String? customerName,
      @JsonKey(name: "customer_id") int? customerId,
      @JsonKey(name: "date", required: true) DateTime? date,
      @JsonKey(name: "status", required: false) String? status,
      @JsonKey(name: "discount", required: false) int? discountPrice,
      @JsonKey(name: "note", required: false) String? note,
      @JsonKey(name: "amount", required: true) int? amount,
      @JsonKey(name: "received_money", required: true) int? receivedMoney,
      @JsonKey(name: "change_money", required: false) int? changeMoney,
      @JsonKey(name: "products") List<TransactionItemModel>? items});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  final TransactionModel _value;
  // ignore: unused_field
  final $Res Function(TransactionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNumber = freezed,
    Object? key = freezed,
    Object? userId = freezed,
    Object? storeId = freezed,
    Object? customerName = freezed,
    Object? customerId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? discountPrice = freezed,
    Object? note = freezed,
    Object? amount = freezed,
    Object? receivedMoney = freezed,
    Object? changeMoney = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedMoney: receivedMoney == freezed
          ? _value.receivedMoney
          : receivedMoney // ignore: cast_nullable_to_non_nullable
              as int?,
      changeMoney: changeMoney == freezed
          ? _value.changeMoney
          : changeMoney // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionModelCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$_TransactionModelCopyWith(
          _$_TransactionModel value, $Res Function(_$_TransactionModel) then) =
      __$$_TransactionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id", required: true) int? id,
      @JsonKey(name: "invoice_number", required: false) String? invoiceNumber,
      @JsonKey(name: "key", required: false) String? key,
      @JsonKey(name: "user_id", required: true) int? userId,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "customer_name") String? customerName,
      @JsonKey(name: "customer_id") int? customerId,
      @JsonKey(name: "date", required: true) DateTime? date,
      @JsonKey(name: "status", required: false) String? status,
      @JsonKey(name: "discount", required: false) int? discountPrice,
      @JsonKey(name: "note", required: false) String? note,
      @JsonKey(name: "amount", required: true) int? amount,
      @JsonKey(name: "received_money", required: true) int? receivedMoney,
      @JsonKey(name: "change_money", required: false) int? changeMoney,
      @JsonKey(name: "products") List<TransactionItemModel>? items});
}

/// @nodoc
class __$$_TransactionModelCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res>
    implements _$$_TransactionModelCopyWith<$Res> {
  __$$_TransactionModelCopyWithImpl(
      _$_TransactionModel _value, $Res Function(_$_TransactionModel) _then)
      : super(_value, (v) => _then(v as _$_TransactionModel));

  @override
  _$_TransactionModel get _value => super._value as _$_TransactionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNumber = freezed,
    Object? key = freezed,
    Object? userId = freezed,
    Object? storeId = freezed,
    Object? customerName = freezed,
    Object? customerId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? discountPrice = freezed,
    Object? note = freezed,
    Object? amount = freezed,
    Object? receivedMoney = freezed,
    Object? changeMoney = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_TransactionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedMoney: receivedMoney == freezed
          ? _value.receivedMoney
          : receivedMoney // ignore: cast_nullable_to_non_nullable
              as int?,
      changeMoney: changeMoney == freezed
          ? _value.changeMoney
          : changeMoney // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionModel extends _TransactionModel {
  _$_TransactionModel(
      {@JsonKey(name: "id", required: true) this.id,
      @JsonKey(name: "invoice_number", required: false) this.invoiceNumber,
      @JsonKey(name: "key", required: false) this.key,
      @JsonKey(name: "user_id", required: true) this.userId,
      @JsonKey(name: "store_id") this.storeId,
      @JsonKey(name: "customer_name") this.customerName,
      @JsonKey(name: "customer_id") this.customerId,
      @JsonKey(name: "date", required: true) this.date,
      @JsonKey(name: "status", required: false) this.status,
      @JsonKey(name: "discount", required: false) this.discountPrice = 0,
      @JsonKey(name: "note", required: false) this.note,
      @JsonKey(name: "amount", required: true) this.amount = 0,
      @JsonKey(name: "received_money", required: true) this.receivedMoney = 0,
      @JsonKey(name: "change_money", required: false) this.changeMoney = 0,
      @JsonKey(name: "products") this.items})
      : super._();

  factory _$_TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionModelFromJson(json);

  @override
  @JsonKey(name: "id", required: true)
  int? id;
  @override
  @JsonKey(name: "invoice_number", required: false)
  String? invoiceNumber;
  @override
  @JsonKey(name: "key", required: false)
  String? key;
  @override
  @JsonKey(name: "user_id", required: true)
  int? userId;
  @override
  @JsonKey(name: "store_id")
  int? storeId;
  @override
  @JsonKey(name: "customer_name")
  String? customerName;
  @override
  @JsonKey(name: "customer_id")
  int? customerId;
  @override
  @JsonKey(name: "date", required: true)
  DateTime? date;
  @override
  @JsonKey(name: "status", required: false)
  String? status;
  @override
  @JsonKey(name: "discount", required: false)
  int? discountPrice;
  @override
  @JsonKey(name: "note", required: false)
  String? note;
  @override
  @JsonKey(name: "amount", required: true)
  int? amount;
  @override
  @JsonKey(name: "received_money", required: true)
  int? receivedMoney;
  @override
  @JsonKey(name: "change_money", required: false)
  int? changeMoney;
  @override
  @JsonKey(name: "products")
  List<TransactionItemModel>? items;

  @override
  String toString() {
    return 'TransactionModel(id: $id, invoiceNumber: $invoiceNumber, key: $key, userId: $userId, storeId: $storeId, customerName: $customerName, customerId: $customerId, date: $date, status: $status, discountPrice: $discountPrice, note: $note, amount: $amount, receivedMoney: $receivedMoney, changeMoney: $changeMoney, items: $items)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TransactionModelCopyWith<_$_TransactionModel> get copyWith =>
      __$$_TransactionModelCopyWithImpl<_$_TransactionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionModelToJson(
      this,
    );
  }
}

abstract class _TransactionModel extends TransactionModel {
  factory _TransactionModel(
      {@JsonKey(name: "id", required: true)
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
      @JsonKey(name: "discount", required: false)
          int? discountPrice,
      @JsonKey(name: "note", required: false)
          String? note,
      @JsonKey(name: "amount", required: true)
          int? amount,
      @JsonKey(name: "received_money", required: true)
          int? receivedMoney,
      @JsonKey(name: "change_money", required: false)
          int? changeMoney,
      @JsonKey(name: "products")
          List<TransactionItemModel>? items}) = _$_TransactionModel;
  _TransactionModel._() : super._();

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionModel.fromJson;

  @override
  @JsonKey(name: "id", required: true)
  int? get id;
  @JsonKey(name: "id", required: true)
  set id(int? value);
  @override
  @JsonKey(name: "invoice_number", required: false)
  String? get invoiceNumber;
  @JsonKey(name: "invoice_number", required: false)
  set invoiceNumber(String? value);
  @override
  @JsonKey(name: "key", required: false)
  String? get key;
  @JsonKey(name: "key", required: false)
  set key(String? value);
  @override
  @JsonKey(name: "user_id", required: true)
  int? get userId;
  @JsonKey(name: "user_id", required: true)
  set userId(int? value);
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @JsonKey(name: "store_id")
  set storeId(int? value);
  @override
  @JsonKey(name: "customer_name")
  String? get customerName;
  @JsonKey(name: "customer_name")
  set customerName(String? value);
  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @JsonKey(name: "customer_id")
  set customerId(int? value);
  @override
  @JsonKey(name: "date", required: true)
  DateTime? get date;
  @JsonKey(name: "date", required: true)
  set date(DateTime? value);
  @override
  @JsonKey(name: "status", required: false)
  String? get status;
  @JsonKey(name: "status", required: false)
  set status(String? value);
  @override
  @JsonKey(name: "discount", required: false)
  int? get discountPrice;
  @JsonKey(name: "discount", required: false)
  set discountPrice(int? value);
  @override
  @JsonKey(name: "note", required: false)
  String? get note;
  @JsonKey(name: "note", required: false)
  set note(String? value);
  @override
  @JsonKey(name: "amount", required: true)
  int? get amount;
  @JsonKey(name: "amount", required: true)
  set amount(int? value);
  @override
  @JsonKey(name: "received_money", required: true)
  int? get receivedMoney;
  @JsonKey(name: "received_money", required: true)
  set receivedMoney(int? value);
  @override
  @JsonKey(name: "change_money", required: false)
  int? get changeMoney;
  @JsonKey(name: "change_money", required: false)
  set changeMoney(int? value);
  @override
  @JsonKey(name: "products")
  List<TransactionItemModel>? get items;
  @JsonKey(name: "products")
  set items(List<TransactionItemModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$_TransactionModelCopyWith<_$_TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
