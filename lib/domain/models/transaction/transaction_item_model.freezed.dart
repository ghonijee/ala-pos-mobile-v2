// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionItemModel _$TransactionItemModelFromJson(Map<String, dynamic> json) {
  return _TransactionItemModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionItemModel {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  set id(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_id")
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_id")
  set transactionId(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  set storeId(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  set productId(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "product")
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: "product")
  set productName(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  set price(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_price")
  int get discountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_price")
  set discountPrice(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_percentage")
  double? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_percentage")
  set discountPercentage(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  set note(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity")
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity")
  set quantity(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  set amount(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemModelCopyWith<TransactionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemModelCopyWith<$Res> {
  factory $TransactionItemModelCopyWith(TransactionItemModel value,
          $Res Function(TransactionItemModel) then) =
      _$TransactionItemModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "transaction_id") String transactionId,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "product_id") int productId,
      @JsonKey(name: "product") String productName,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "discount_price") int discountPrice,
      @JsonKey(name: "discount_percentage") double? discountPercentage,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "quantity") int quantity,
      @JsonKey(name: "amount") int amount});
}

/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._value, this._then);

  final TransactionItemModel _value;
  // ignore: unused_field
  final $Res Function(TransactionItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? transactionId = freezed,
    Object? storeId = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? discountPercentage = freezed,
    Object? note = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercentage: discountPercentage == freezed
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionItemModelCopyWith<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  factory _$$_TransactionItemModelCopyWith(_$_TransactionItemModel value,
          $Res Function(_$_TransactionItemModel) then) =
      __$$_TransactionItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "transaction_id") String transactionId,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "product_id") int productId,
      @JsonKey(name: "product") String productName,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "discount_price") int discountPrice,
      @JsonKey(name: "discount_percentage") double? discountPercentage,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "quantity") int quantity,
      @JsonKey(name: "amount") int amount});
}

/// @nodoc
class __$$_TransactionItemModelCopyWithImpl<$Res>
    extends _$TransactionItemModelCopyWithImpl<$Res>
    implements _$$_TransactionItemModelCopyWith<$Res> {
  __$$_TransactionItemModelCopyWithImpl(_$_TransactionItemModel _value,
      $Res Function(_$_TransactionItemModel) _then)
      : super(_value, (v) => _then(v as _$_TransactionItemModel));

  @override
  _$_TransactionItemModel get _value => super._value as _$_TransactionItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? transactionId = freezed,
    Object? storeId = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? discountPercentage = freezed,
    Object? note = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_TransactionItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercentage: discountPercentage == freezed
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionItemModel extends _TransactionItemModel {
  _$_TransactionItemModel(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "transaction_id") required this.transactionId,
      @JsonKey(name: "store_id") required this.storeId,
      @JsonKey(name: "product_id") required this.productId,
      @JsonKey(name: "product") required this.productName,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "discount_price") this.discountPrice = 0,
      @JsonKey(name: "discount_percentage") this.discountPercentage = 0.0,
      @JsonKey(name: "note") this.note,
      @JsonKey(name: "quantity") required this.quantity,
      @JsonKey(name: "amount") required this.amount})
      : super._();

  factory _$_TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionItemModelFromJson(json);

  @override
  @JsonKey(name: "id")
  String id;
  @override
  @JsonKey(name: "transaction_id")
  String transactionId;
  @override
  @JsonKey(name: "store_id")
  int storeId;
  @override
  @JsonKey(name: "product_id")
  int productId;
  @override
  @JsonKey(name: "product")
  String productName;
  @override
  @JsonKey(name: "price")
  int price;
  @override
  @JsonKey(name: "discount_price")
  int discountPrice;
  @override
  @JsonKey(name: "discount_percentage")
  double? discountPercentage;
  @override
  @JsonKey(name: "note")
  String? note;
  @override
  @JsonKey(name: "quantity")
  int quantity;
  @override
  @JsonKey(name: "amount")
  int amount;

  @override
  String toString() {
    return 'TransactionItemModel(id: $id, transactionId: $transactionId, storeId: $storeId, productId: $productId, productName: $productName, price: $price, discountPrice: $discountPrice, discountPercentage: $discountPercentage, note: $note, quantity: $quantity, amount: $amount)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TransactionItemModelCopyWith<_$_TransactionItemModel> get copyWith =>
      __$$_TransactionItemModelCopyWithImpl<_$_TransactionItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionItemModelToJson(this);
  }
}

abstract class _TransactionItemModel extends TransactionItemModel {
  factory _TransactionItemModel(
      {@JsonKey(name: "id") required String id,
      @JsonKey(name: "transaction_id") required String transactionId,
      @JsonKey(name: "store_id") required int storeId,
      @JsonKey(name: "product_id") required int productId,
      @JsonKey(name: "product") required String productName,
      @JsonKey(name: "price") required int price,
      @JsonKey(name: "discount_price") int discountPrice,
      @JsonKey(name: "discount_percentage") double? discountPercentage,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "quantity") required int quantity,
      @JsonKey(name: "amount") required int amount}) = _$_TransactionItemModel;
  _TransactionItemModel._() : super._();

  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionItemModel.fromJson;

  @override
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "transaction_id")
  String get transactionId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "store_id")
  int get storeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "product_id")
  int get productId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "product")
  String get productName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "discount_price")
  int get discountPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "discount_percentage")
  double? get discountPercentage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "quantity")
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "amount")
  int get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionItemModelCopyWith<_$_TransactionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
