// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreCategoryModel _$StoreCategoryModelFromJson(Map<String, dynamic> json) {
  return _StoreCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$StoreCategoryModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCategoryModelCopyWith<StoreCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCategoryModelCopyWith<$Res> {
  factory $StoreCategoryModelCopyWith(
          StoreCategoryModel value, $Res Function(StoreCategoryModel) then) =
      _$StoreCategoryModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$StoreCategoryModelCopyWithImpl<$Res>
    implements $StoreCategoryModelCopyWith<$Res> {
  _$StoreCategoryModelCopyWithImpl(this._value, this._then);

  final StoreCategoryModel _value;
  // ignore: unused_field
  final $Res Function(StoreCategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$$_StoreCategoryModelCopyWith<$Res>
    implements $StoreCategoryModelCopyWith<$Res> {
  factory _$$_StoreCategoryModelCopyWith(_$_StoreCategoryModel value,
          $Res Function(_$_StoreCategoryModel) then) =
      __$$_StoreCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$_StoreCategoryModelCopyWithImpl<$Res>
    extends _$StoreCategoryModelCopyWithImpl<$Res>
    implements _$$_StoreCategoryModelCopyWith<$Res> {
  __$$_StoreCategoryModelCopyWithImpl(
      _$_StoreCategoryModel _value, $Res Function(_$_StoreCategoryModel) _then)
      : super(_value, (v) => _then(v as _$_StoreCategoryModel));

  @override
  _$_StoreCategoryModel get _value => super._value as _$_StoreCategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_StoreCategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreCategoryModel implements _StoreCategoryModel {
  _$_StoreCategoryModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') required this.name});

  factory _$_StoreCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoreCategoryModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'StoreCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreCategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_StoreCategoryModelCopyWith<_$_StoreCategoryModel> get copyWith =>
      __$$_StoreCategoryModelCopyWithImpl<_$_StoreCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreCategoryModelToJson(
      this,
    );
  }
}

abstract class _StoreCategoryModel implements StoreCategoryModel {
  factory _StoreCategoryModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') required final String name}) =
      _$_StoreCategoryModel;

  factory _StoreCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_StoreCategoryModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCategoryModelCopyWith<_$_StoreCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
