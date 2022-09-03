// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) {
  return _PermissionModel.fromJson(json);
}

/// @nodoc
mixin _$PermissionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "key")
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  int get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionModelCopyWith<PermissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionModelCopyWith<$Res> {
  factory $PermissionModelCopyWith(
          PermissionModel value, $Res Function(PermissionModel) then) =
      _$PermissionModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "key") String key,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "is_active") int isActive});
}

/// @nodoc
class _$PermissionModelCopyWithImpl<$Res>
    implements $PermissionModelCopyWith<$Res> {
  _$PermissionModelCopyWithImpl(this._value, this._then);

  final PermissionModel _value;
  // ignore: unused_field
  final $Res Function(PermissionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PermissionModelCopyWith<$Res>
    implements $PermissionModelCopyWith<$Res> {
  factory _$$_PermissionModelCopyWith(
          _$_PermissionModel value, $Res Function(_$_PermissionModel) then) =
      __$$_PermissionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "key") String key,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "is_active") int isActive});
}

/// @nodoc
class __$$_PermissionModelCopyWithImpl<$Res>
    extends _$PermissionModelCopyWithImpl<$Res>
    implements _$$_PermissionModelCopyWith<$Res> {
  __$$_PermissionModelCopyWithImpl(
      _$_PermissionModel _value, $Res Function(_$_PermissionModel) _then)
      : super(_value, (v) => _then(v as _$_PermissionModel));

  @override
  _$_PermissionModel get _value => super._value as _$_PermissionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_PermissionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PermissionModel implements _PermissionModel {
  _$_PermissionModel(
      {required this.id,
      @JsonKey(name: "key") required this.key,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "is_active") required this.isActive});

  factory _$_PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "key")
  final String key;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "is_active")
  final int isActive;

  @override
  String toString() {
    return 'PermissionModel(id: $id, key: $key, name: $name, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PermissionModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_PermissionModelCopyWith<_$_PermissionModel> get copyWith =>
      __$$_PermissionModelCopyWithImpl<_$_PermissionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionModelToJson(
      this,
    );
  }
}

abstract class _PermissionModel implements PermissionModel {
  factory _PermissionModel(
          {required final int id,
          @JsonKey(name: "key") required final String key,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "description") required final String description,
          @JsonKey(name: "is_active") required final int isActive}) =
      _$_PermissionModel;

  factory _PermissionModel.fromJson(Map<String, dynamic> json) =
      _$_PermissionModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "key")
  String get key;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "is_active")
  int get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionModelCopyWith<_$_PermissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
