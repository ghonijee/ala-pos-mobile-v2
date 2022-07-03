// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_resume_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionResumeState {
  TransactionModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionResumeStateCopyWith<TransactionResumeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResumeStateCopyWith<$Res> {
  factory $TransactionResumeStateCopyWith(TransactionResumeState value,
          $Res Function(TransactionResumeState) then) =
      _$TransactionResumeStateCopyWithImpl<$Res>;
  $Res call({TransactionModel? model});

  $TransactionModelCopyWith<$Res>? get model;
}

/// @nodoc
class _$TransactionResumeStateCopyWithImpl<$Res>
    implements $TransactionResumeStateCopyWith<$Res> {
  _$TransactionResumeStateCopyWithImpl(this._value, this._then);

  final TransactionResumeState _value;
  // ignore: unused_field
  final $Res Function(TransactionResumeState) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
    ));
  }

  @override
  $TransactionModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $TransactionModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionResumeStateCopyWith<$Res>
    implements $TransactionResumeStateCopyWith<$Res> {
  factory _$$_TransactionResumeStateCopyWith(_$_TransactionResumeState value,
          $Res Function(_$_TransactionResumeState) then) =
      __$$_TransactionResumeStateCopyWithImpl<$Res>;
  @override
  $Res call({TransactionModel? model});

  @override
  $TransactionModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$_TransactionResumeStateCopyWithImpl<$Res>
    extends _$TransactionResumeStateCopyWithImpl<$Res>
    implements _$$_TransactionResumeStateCopyWith<$Res> {
  __$$_TransactionResumeStateCopyWithImpl(_$_TransactionResumeState _value,
      $Res Function(_$_TransactionResumeState) _then)
      : super(_value, (v) => _then(v as _$_TransactionResumeState));

  @override
  _$_TransactionResumeState get _value =>
      super._value as _$_TransactionResumeState;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_TransactionResumeState(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
    ));
  }
}

/// @nodoc

class _$_TransactionResumeState extends _TransactionResumeState {
  const _$_TransactionResumeState({this.model}) : super._();

  @override
  final TransactionModel? model;

  @override
  String toString() {
    return 'TransactionResumeState(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionResumeState &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionResumeStateCopyWith<_$_TransactionResumeState> get copyWith =>
      __$$_TransactionResumeStateCopyWithImpl<_$_TransactionResumeState>(
          this, _$identity);
}

abstract class _TransactionResumeState extends TransactionResumeState {
  const factory _TransactionResumeState({final TransactionModel? model}) =
      _$_TransactionResumeState;
  const _TransactionResumeState._() : super._();

  @override
  TransactionModel? get model => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionResumeStateCopyWith<_$_TransactionResumeState> get copyWith =>
      throw _privateConstructorUsedError;
}
