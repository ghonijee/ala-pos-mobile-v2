// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_store_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormStoreState {
  int get id => throw _privateConstructorUsedError;
  StoreNameField get storeNameField => throw _privateConstructorUsedError;
  AddressField get addressField => throw _privateConstructorUsedError;
  PhoneField get phoneField => throw _privateConstructorUsedError;
  UseStockOpnameField get useStockOpnameField =>
      throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FormzStatus get statusSubmission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormStoreStateCopyWith<FormStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStoreStateCopyWith<$Res> {
  factory $FormStoreStateCopyWith(
          FormStoreState value, $Res Function(FormStoreState) then) =
      _$FormStoreStateCopyWithImpl<$Res>;
  $Res call(
      {int id,
      StoreNameField storeNameField,
      AddressField addressField,
      PhoneField phoneField,
      UseStockOpnameField useStockOpnameField,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class _$FormStoreStateCopyWithImpl<$Res>
    implements $FormStoreStateCopyWith<$Res> {
  _$FormStoreStateCopyWithImpl(this._value, this._then);

  final FormStoreState _value;
  // ignore: unused_field
  final $Res Function(FormStoreState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeNameField = freezed,
    Object? addressField = freezed,
    Object? phoneField = freezed,
    Object? useStockOpnameField = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeNameField: storeNameField == freezed
          ? _value.storeNameField
          : storeNameField // ignore: cast_nullable_to_non_nullable
              as StoreNameField,
      addressField: addressField == freezed
          ? _value.addressField
          : addressField // ignore: cast_nullable_to_non_nullable
              as AddressField,
      phoneField: phoneField == freezed
          ? _value.phoneField
          : phoneField // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      useStockOpnameField: useStockOpnameField == freezed
          ? _value.useStockOpnameField
          : useStockOpnameField // ignore: cast_nullable_to_non_nullable
              as UseStockOpnameField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusSubmission: statusSubmission == freezed
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_FormStoreStateCopyWith<$Res>
    implements $FormStoreStateCopyWith<$Res> {
  factory _$$_FormStoreStateCopyWith(
          _$_FormStoreState value, $Res Function(_$_FormStoreState) then) =
      __$$_FormStoreStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      StoreNameField storeNameField,
      AddressField addressField,
      PhoneField phoneField,
      UseStockOpnameField useStockOpnameField,
      String message,
      FormzStatus statusSubmission});
}

/// @nodoc
class __$$_FormStoreStateCopyWithImpl<$Res>
    extends _$FormStoreStateCopyWithImpl<$Res>
    implements _$$_FormStoreStateCopyWith<$Res> {
  __$$_FormStoreStateCopyWithImpl(
      _$_FormStoreState _value, $Res Function(_$_FormStoreState) _then)
      : super(_value, (v) => _then(v as _$_FormStoreState));

  @override
  _$_FormStoreState get _value => super._value as _$_FormStoreState;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeNameField = freezed,
    Object? addressField = freezed,
    Object? phoneField = freezed,
    Object? useStockOpnameField = freezed,
    Object? message = freezed,
    Object? statusSubmission = freezed,
  }) {
    return _then(_$_FormStoreState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeNameField: storeNameField == freezed
          ? _value.storeNameField
          : storeNameField // ignore: cast_nullable_to_non_nullable
              as StoreNameField,
      addressField: addressField == freezed
          ? _value.addressField
          : addressField // ignore: cast_nullable_to_non_nullable
              as AddressField,
      phoneField: phoneField == freezed
          ? _value.phoneField
          : phoneField // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      useStockOpnameField: useStockOpnameField == freezed
          ? _value.useStockOpnameField
          : useStockOpnameField // ignore: cast_nullable_to_non_nullable
              as UseStockOpnameField,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusSubmission: statusSubmission == freezed
          ? _value.statusSubmission
          : statusSubmission // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_FormStoreState extends _FormStoreState {
  const _$_FormStoreState(
      {required this.id,
      this.storeNameField = const StoreNameField.pure(),
      this.addressField = const AddressField.pure(),
      this.phoneField = const PhoneField.pure(),
      this.useStockOpnameField = const UseStockOpnameField.pure(),
      this.message = '',
      this.statusSubmission = FormzStatus.pure})
      : super._();

  @override
  final int id;
  @override
  @JsonKey()
  final StoreNameField storeNameField;
  @override
  @JsonKey()
  final AddressField addressField;
  @override
  @JsonKey()
  final PhoneField phoneField;
  @override
  @JsonKey()
  final UseStockOpnameField useStockOpnameField;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final FormzStatus statusSubmission;

  @override
  String toString() {
    return 'FormStoreState(id: $id, storeNameField: $storeNameField, addressField: $addressField, phoneField: $phoneField, useStockOpnameField: $useStockOpnameField, message: $message, statusSubmission: $statusSubmission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormStoreState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.storeNameField, storeNameField) &&
            const DeepCollectionEquality()
                .equals(other.addressField, addressField) &&
            const DeepCollectionEquality()
                .equals(other.phoneField, phoneField) &&
            const DeepCollectionEquality()
                .equals(other.useStockOpnameField, useStockOpnameField) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.statusSubmission, statusSubmission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(storeNameField),
      const DeepCollectionEquality().hash(addressField),
      const DeepCollectionEquality().hash(phoneField),
      const DeepCollectionEquality().hash(useStockOpnameField),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(statusSubmission));

  @JsonKey(ignore: true)
  @override
  _$$_FormStoreStateCopyWith<_$_FormStoreState> get copyWith =>
      __$$_FormStoreStateCopyWithImpl<_$_FormStoreState>(this, _$identity);
}

abstract class _FormStoreState extends FormStoreState {
  const factory _FormStoreState(
      {required final int id,
      final StoreNameField storeNameField,
      final AddressField addressField,
      final PhoneField phoneField,
      final UseStockOpnameField useStockOpnameField,
      final String message,
      final FormzStatus statusSubmission}) = _$_FormStoreState;
  const _FormStoreState._() : super._();

  @override
  int get id;
  @override
  StoreNameField get storeNameField;
  @override
  AddressField get addressField;
  @override
  PhoneField get phoneField;
  @override
  UseStockOpnameField get useStockOpnameField;
  @override
  String get message;
  @override
  FormzStatus get statusSubmission;
  @override
  @JsonKey(ignore: true)
  _$$_FormStoreStateCopyWith<_$_FormStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
