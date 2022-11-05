// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreRegisterModel {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_category_id')
  String get store_category_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreRegisterModelCopyWith<StoreRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreRegisterModelCopyWith<$Res> {
  factory $StoreRegisterModelCopyWith(
          StoreRegisterModel value, $Res Function(StoreRegisterModel) then) =
      _$StoreRegisterModelCopyWithImpl<$Res, StoreRegisterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'store_category_id') String store_category_id,
      @JsonKey(name: 'phone') String phone});
}

/// @nodoc
class _$StoreRegisterModelCopyWithImpl<$Res, $Val extends StoreRegisterModel>
    implements $StoreRegisterModelCopyWith<$Res> {
  _$StoreRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? store_category_id = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      store_category_id: null == store_category_id
          ? _value.store_category_id
          : store_category_id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreRegisterModelCopyWith<$Res>
    implements $StoreRegisterModelCopyWith<$Res> {
  factory _$$_StoreRegisterModelCopyWith(_$_StoreRegisterModel value,
          $Res Function(_$_StoreRegisterModel) then) =
      __$$_StoreRegisterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'store_category_id') String store_category_id,
      @JsonKey(name: 'phone') String phone});
}

/// @nodoc
class __$$_StoreRegisterModelCopyWithImpl<$Res>
    extends _$StoreRegisterModelCopyWithImpl<$Res, _$_StoreRegisterModel>
    implements _$$_StoreRegisterModelCopyWith<$Res> {
  __$$_StoreRegisterModelCopyWithImpl(
      _$_StoreRegisterModel _value, $Res Function(_$_StoreRegisterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? store_category_id = null,
    Object? phone = null,
  }) {
    return _then(_$_StoreRegisterModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      store_category_id: null == store_category_id
          ? _value.store_category_id
          : store_category_id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StoreRegisterModel implements _StoreRegisterModel {
  _$_StoreRegisterModel(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'store_category_id') required this.store_category_id,
      @JsonKey(name: 'phone') required this.phone});

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'store_category_id')
  final String store_category_id;
  @override
  @JsonKey(name: 'phone')
  final String phone;

  @override
  String toString() {
    return 'StoreRegisterModel(name: $name, address: $address, store_category_id: $store_category_id, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreRegisterModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.store_category_id, store_category_id) ||
                other.store_category_id == store_category_id) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, address, store_category_id, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreRegisterModelCopyWith<_$_StoreRegisterModel> get copyWith =>
      __$$_StoreRegisterModelCopyWithImpl<_$_StoreRegisterModel>(
          this, _$identity);
}

abstract class _StoreRegisterModel implements StoreRegisterModel {
  factory _StoreRegisterModel(
      {@JsonKey(name: 'name')
          required final String name,
      @JsonKey(name: 'address')
          required final String address,
      @JsonKey(name: 'store_category_id')
          required final String store_category_id,
      @JsonKey(name: 'phone')
          required final String phone}) = _$_StoreRegisterModel;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'store_category_id')
  String get store_category_id;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_StoreRegisterModelCopyWith<_$_StoreRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
