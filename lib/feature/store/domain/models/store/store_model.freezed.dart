// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_stock_opname')
  bool get useStockOpname => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_category_id')
  int? get storeCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_category_name')
  String? get storeCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'laravel_through_key')
  int? get laravelThroughKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'use_stock_opname') bool useStockOpname,
      @JsonKey(name: 'store_category_id') int? storeCategoryId,
      @JsonKey(name: 'store_category_name') String? storeCategoryName,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_path') String? imagePath,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'laravel_through_key') int? laravelThroughKey});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? useStockOpname = null,
    Object? storeCategoryId = freezed,
    Object? storeCategoryName = freezed,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? laravelThroughKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      useStockOpname: null == useStockOpname
          ? _value.useStockOpname
          : useStockOpname // ignore: cast_nullable_to_non_nullable
              as bool,
      storeCategoryId: freezed == storeCategoryId
          ? _value.storeCategoryId
          : storeCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeCategoryName: freezed == storeCategoryName
          ? _value.storeCategoryName
          : storeCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      laravelThroughKey: freezed == laravelThroughKey
          ? _value.laravelThroughKey
          : laravelThroughKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreModelCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$_StoreModelCopyWith(
          _$_StoreModel value, $Res Function(_$_StoreModel) then) =
      __$$_StoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'use_stock_opname') bool useStockOpname,
      @JsonKey(name: 'store_category_id') int? storeCategoryId,
      @JsonKey(name: 'store_category_name') String? storeCategoryName,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_path') String? imagePath,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'laravel_through_key') int? laravelThroughKey});
}

/// @nodoc
class __$$_StoreModelCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$_StoreModel>
    implements _$$_StoreModelCopyWith<$Res> {
  __$$_StoreModelCopyWithImpl(
      _$_StoreModel _value, $Res Function(_$_StoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? useStockOpname = null,
    Object? storeCategoryId = freezed,
    Object? storeCategoryName = freezed,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? laravelThroughKey = freezed,
  }) {
    return _then(_$_StoreModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      useStockOpname: null == useStockOpname
          ? _value.useStockOpname
          : useStockOpname // ignore: cast_nullable_to_non_nullable
              as bool,
      storeCategoryId: freezed == storeCategoryId
          ? _value.storeCategoryId
          : storeCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeCategoryName: freezed == storeCategoryName
          ? _value.storeCategoryName
          : storeCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      laravelThroughKey: freezed == laravelThroughKey
          ? _value.laravelThroughKey
          : laravelThroughKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreModel implements _StoreModel {
  _$_StoreModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'use_stock_opname') this.useStockOpname = true,
      @JsonKey(name: 'store_category_id') this.storeCategoryId,
      @JsonKey(name: 'store_category_name') this.storeCategoryName,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'image_path') this.imagePath,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'laravel_through_key') this.laravelThroughKey});

  factory _$_StoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoreModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'use_stock_opname')
  final bool useStockOpname;
  @override
  @JsonKey(name: 'store_category_id')
  final int? storeCategoryId;
  @override
  @JsonKey(name: 'store_category_name')
  final String? storeCategoryName;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'laravel_through_key')
  final int? laravelThroughKey;

  @override
  String toString() {
    return 'StoreModel(id: $id, name: $name, address: $address, phone: $phone, useStockOpname: $useStockOpname, storeCategoryId: $storeCategoryId, storeCategoryName: $storeCategoryName, imageUrl: $imageUrl, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, laravelThroughKey: $laravelThroughKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.useStockOpname, useStockOpname) ||
                other.useStockOpname == useStockOpname) &&
            (identical(other.storeCategoryId, storeCategoryId) ||
                other.storeCategoryId == storeCategoryId) &&
            (identical(other.storeCategoryName, storeCategoryName) ||
                other.storeCategoryName == storeCategoryName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.laravelThroughKey, laravelThroughKey) ||
                other.laravelThroughKey == laravelThroughKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      phone,
      useStockOpname,
      storeCategoryId,
      storeCategoryName,
      imageUrl,
      imagePath,
      createdAt,
      updatedAt,
      laravelThroughKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      __$$_StoreModelCopyWithImpl<_$_StoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreModelToJson(
      this,
    );
  }
}

abstract class _StoreModel implements StoreModel {
  factory _StoreModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'address') final String? address,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'use_stock_opname') final bool useStockOpname,
          @JsonKey(name: 'store_category_id') final int? storeCategoryId,
          @JsonKey(name: 'store_category_name') final String? storeCategoryName,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'image_path') final String? imagePath,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'laravel_through_key') final int? laravelThroughKey}) =
      _$_StoreModel;

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$_StoreModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'use_stock_opname')
  bool get useStockOpname;
  @override
  @JsonKey(name: 'store_category_id')
  int? get storeCategoryId;
  @override
  @JsonKey(name: 'store_category_name')
  String? get storeCategoryName;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'laravel_through_key')
  int? get laravelThroughKey;
  @override
  @JsonKey(ignore: true)
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
