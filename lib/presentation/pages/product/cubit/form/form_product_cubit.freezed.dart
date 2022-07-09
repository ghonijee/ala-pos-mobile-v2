// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormProductState {
  NameField get name => throw _privateConstructorUsedError;
  PriceField get price => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormProductStateCopyWith<FormProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormProductStateCopyWith<$Res> {
  factory $FormProductStateCopyWith(
          FormProductState value, $Res Function(FormProductState) then) =
      _$FormProductStateCopyWithImpl<$Res>;
  $Res call({NameField name, PriceField price, FormzStatus status});
}

/// @nodoc
class _$FormProductStateCopyWithImpl<$Res>
    implements $FormProductStateCopyWith<$Res> {
  _$FormProductStateCopyWithImpl(this._value, this._then);

  final FormProductState _value;
  // ignore: unused_field
  final $Res Function(FormProductState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameField,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceField,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_FormProductStateCopyWith<$Res>
    implements $FormProductStateCopyWith<$Res> {
  factory _$$_FormProductStateCopyWith(
          _$_FormProductState value, $Res Function(_$_FormProductState) then) =
      __$$_FormProductStateCopyWithImpl<$Res>;
  @override
  $Res call({NameField name, PriceField price, FormzStatus status});
}

/// @nodoc
class __$$_FormProductStateCopyWithImpl<$Res>
    extends _$FormProductStateCopyWithImpl<$Res>
    implements _$$_FormProductStateCopyWith<$Res> {
  __$$_FormProductStateCopyWithImpl(
      _$_FormProductState _value, $Res Function(_$_FormProductState) _then)
      : super(_value, (v) => _then(v as _$_FormProductState));

  @override
  _$_FormProductState get _value => super._value as _$_FormProductState;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_FormProductState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameField,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceField,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_FormProductState
    with DiagnosticableTreeMixin
    implements _FormProductState {
  _$_FormProductState(
      {this.name = const NameField.pure(),
      this.price = const PriceField.pure(),
      this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final NameField name;
  @override
  @JsonKey()
  final PriceField price;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormProductState(name: $name, price: $price, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormProductState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormProductState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_FormProductStateCopyWith<_$_FormProductState> get copyWith =>
      __$$_FormProductStateCopyWithImpl<_$_FormProductState>(this, _$identity);
}

abstract class _FormProductState implements FormProductState {
  factory _FormProductState(
      {final NameField name,
      final PriceField price,
      final FormzStatus status}) = _$_FormProductState;

  @override
  NameField get name => throw _privateConstructorUsedError;
  @override
  PriceField get price => throw _privateConstructorUsedError;
  @override
  FormzStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FormProductStateCopyWith<_$_FormProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
