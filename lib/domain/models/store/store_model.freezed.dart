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
      _$StoreModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'use_stock_opname') bool useStockOpname,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_path') String? imagePath,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'laravel_through_key') int? laravelThroughKey});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res> implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  final StoreModel _value;
  // ignore: unused_field
  final $Res Function(StoreModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? useStockOpname = freezed,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? laravelThroughKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      useStockOpname: useStockOpname == freezed
          ? _value.useStockOpname
          : useStockOpname // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      laravelThroughKey: laravelThroughKey == freezed
          ? _value.laravelThroughKey
          : laravelThroughKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_StoreModelCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$_StoreModelCopyWith(
          _$_StoreModel value, $Res Function(_$_StoreModel) then) =
      __$$_StoreModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'use_stock_opname') bool useStockOpname,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_path') String? imagePath,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'laravel_through_key') int? laravelThroughKey});
}

/// @nodoc
class __$$_StoreModelCopyWithImpl<$Res> extends _$StoreModelCopyWithImpl<$Res>
    implements _$$_StoreModelCopyWith<$Res> {
  __$$_StoreModelCopyWithImpl(
      _$_StoreModel _value, $Res Function(_$_StoreModel) _then)
      : super(_value, (v) => _then(v as _$_StoreModel));

  @override
  _$_StoreModel get _value => super._value as _$_StoreModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? useStockOpname = freezed,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? laravelThroughKey = freezed,
  }) {
    return _then(_$_StoreModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      useStockOpname: useStockOpname == freezed
          ? _value.useStockOpname
          : useStockOpname // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      laravelThroughKey: laravelThroughKey == freezed
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
    return 'StoreModel(id: $id, name: $name, address: $address, phone: $phone, useStockOpname: $useStockOpname, imageUrl: $imageUrl, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, laravelThroughKey: $laravelThroughKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.useStockOpname, useStockOpname) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.laravelThroughKey, laravelThroughKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(useStockOpname),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(laravelThroughKey));

  @JsonKey(ignore: true)
  @override
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      __$$_StoreModelCopyWithImpl<_$_StoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreModelToJson(this);
  }
}

abstract class _StoreModel implements StoreModel {
  factory _StoreModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'address') final String? address,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'use_stock_opname') final bool useStockOpname,
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
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'use_stock_opname')
  bool get useStockOpname => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'laravel_through_key')
  int? get laravelThroughKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
