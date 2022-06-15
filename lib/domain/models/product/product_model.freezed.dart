// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  String get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "reduce_price", nullable: true)
  int? get reducePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "code", nullable: true)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "cost", nullable: true)
  int? get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "stock", nullable: true)
  int get stock => throw _privateConstructorUsedError;
  @JsonKey(name: "min_stock", nullable: true)
  int get minStock => throw _privateConstructorUsedError;
  @JsonKey(name: "unit", nullable: true)
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", nullable: true)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at", nullable: true)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "store_id") String storeId,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "reduce_price", nullable: true) int? reducePrice,
      @JsonKey(name: "code", nullable: true) String? code,
      @JsonKey(name: "cost", nullable: true) int? cost,
      @JsonKey(name: "stock", nullable: true) int stock,
      @JsonKey(name: "min_stock", nullable: true) int minStock,
      @JsonKey(name: "unit", nullable: true) String? unit,
      @JsonKey(name: "created_at", nullable: true) DateTime? createdAt,
      @JsonKey(name: "updated_at", nullable: true) DateTime? updatedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? reducePrice = freezed,
    Object? code = freezed,
    Object? cost = freezed,
    Object? stock = freezed,
    Object? minStock = freezed,
    Object? unit = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      reducePrice: reducePrice == freezed
          ? _value.reducePrice
          : reducePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      minStock: minStock == freezed
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "store_id") String storeId,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "reduce_price", nullable: true) int? reducePrice,
      @JsonKey(name: "code", nullable: true) String? code,
      @JsonKey(name: "cost", nullable: true) int? cost,
      @JsonKey(name: "stock", nullable: true) int stock,
      @JsonKey(name: "min_stock", nullable: true) int minStock,
      @JsonKey(name: "unit", nullable: true) String? unit,
      @JsonKey(name: "created_at", nullable: true) DateTime? createdAt,
      @JsonKey(name: "updated_at", nullable: true) DateTime? updatedAt});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, (v) => _then(v as _$_ProductModel));

  @override
  _$_ProductModel get _value => super._value as _$_ProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? reducePrice = freezed,
    Object? code = freezed,
    Object? cost = freezed,
    Object? stock = freezed,
    Object? minStock = freezed,
    Object? unit = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      reducePrice: reducePrice == freezed
          ? _value.reducePrice
          : reducePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      minStock: minStock == freezed
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "store_id") required this.storeId,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "reduce_price", nullable: true) this.reducePrice,
      @JsonKey(name: "code", nullable: true) this.code,
      @JsonKey(name: "cost", nullable: true) this.cost,
      @JsonKey(name: "stock", nullable: true) required this.stock,
      @JsonKey(name: "min_stock", nullable: true) required this.minStock,
      @JsonKey(name: "unit", nullable: true) this.unit,
      @JsonKey(name: "created_at", nullable: true) this.createdAt,
      @JsonKey(name: "updated_at", nullable: true) this.updatedAt});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "store_id")
  final String storeId;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "price")
  final int price;
  @override
  @JsonKey(name: "reduce_price", nullable: true)
  final int? reducePrice;
  @override
  @JsonKey(name: "code", nullable: true)
  final String? code;
  @override
  @JsonKey(name: "cost", nullable: true)
  final int? cost;
  @override
  @JsonKey(name: "stock", nullable: true)
  final int stock;
  @override
  @JsonKey(name: "min_stock", nullable: true)
  final int minStock;
  @override
  @JsonKey(name: "unit", nullable: true)
  final String? unit;
  @override
  @JsonKey(name: "created_at", nullable: true)
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at", nullable: true)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, storeId: $storeId, name: $name, description: $description, price: $price, reducePrice: $reducePrice, code: $code, cost: $cost, stock: $stock, minStock: $minStock, unit: $unit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.reducePrice, reducePrice) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.cost, cost) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality().equals(other.minStock, minStock) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(reducePrice),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(cost),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(minStock),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {@JsonKey(name: "id")
          required final int id,
      @JsonKey(name: "store_id")
          required final String storeId,
      @JsonKey(name: "name")
          required final String name,
      @JsonKey(name: "description")
          required final String description,
      @JsonKey(name: "price")
          required final int price,
      @JsonKey(name: "reduce_price", nullable: true)
          final int? reducePrice,
      @JsonKey(name: "code", nullable: true)
          final String? code,
      @JsonKey(name: "cost", nullable: true)
          final int? cost,
      @JsonKey(name: "stock", nullable: true)
          required final int stock,
      @JsonKey(name: "min_stock", nullable: true)
          required final int minStock,
      @JsonKey(name: "unit", nullable: true)
          final String? unit,
      @JsonKey(name: "created_at", nullable: true)
          final DateTime? createdAt,
      @JsonKey(name: "updated_at", nullable: true)
          final DateTime? updatedAt}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "store_id")
  String get storeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "reduce_price", nullable: true)
  int? get reducePrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "code", nullable: true)
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "cost", nullable: true)
  int? get cost => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "stock", nullable: true)
  int get stock => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "min_stock", nullable: true)
  int get minStock => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "unit", nullable: true)
  String? get unit => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created_at", nullable: true)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "updated_at", nullable: true)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
