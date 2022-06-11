// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FailureModel {
  dynamic get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) serverError,
    required TResult Function(dynamic message) localError,
    required TResult Function(dynamic message) internalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalError value) localError,
    required TResult Function(_InternalError value) internalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureModelCopyWith<FailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureModelCopyWith<$Res> {
  factory $FailureModelCopyWith(
          FailureModel value, $Res Function(FailureModel) then) =
      _$FailureModelCopyWithImpl<$Res>;
  $Res call({dynamic message});
}

/// @nodoc
class _$FailureModelCopyWithImpl<$Res> implements $FailureModelCopyWith<$Res> {
  _$FailureModelCopyWithImpl(this._value, this._then);

  final FailureModel _value;
  // ignore: unused_field
  final $Res Function(FailureModel) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_ServerErrorCopyWith<$Res>
    implements $FailureModelCopyWith<$Res> {
  factory _$$_ServerErrorCopyWith(
          _$_ServerError value, $Res Function(_$_ServerError) then) =
      __$$_ServerErrorCopyWithImpl<$Res>;
  @override
  $Res call({dynamic message});
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res>
    extends _$FailureModelCopyWithImpl<$Res>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, (v) => _then(v as _$_ServerError));

  @override
  _$_ServerError get _value => super._value as _$_ServerError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_ServerError(
      message == freezed ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError(this.message);

  @override
  final dynamic message;

  @override
  String toString() {
    return 'FailureModel.serverError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      __$$_ServerErrorCopyWithImpl<_$_ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) serverError,
    required TResult Function(dynamic message) localError,
    required TResult Function(dynamic message) internalError,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalError value) localError,
    required TResult Function(_InternalError value) internalError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements FailureModel {
  const factory _ServerError(final dynamic message) = _$_ServerError;

  @override
  dynamic get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LocalErrorCopyWith<$Res>
    implements $FailureModelCopyWith<$Res> {
  factory _$$_LocalErrorCopyWith(
          _$_LocalError value, $Res Function(_$_LocalError) then) =
      __$$_LocalErrorCopyWithImpl<$Res>;
  @override
  $Res call({dynamic message});
}

/// @nodoc
class __$$_LocalErrorCopyWithImpl<$Res> extends _$FailureModelCopyWithImpl<$Res>
    implements _$$_LocalErrorCopyWith<$Res> {
  __$$_LocalErrorCopyWithImpl(
      _$_LocalError _value, $Res Function(_$_LocalError) _then)
      : super(_value, (v) => _then(v as _$_LocalError));

  @override
  _$_LocalError get _value => super._value as _$_LocalError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_LocalError(
      message == freezed ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$_LocalError implements _LocalError {
  const _$_LocalError(this.message);

  @override
  final dynamic message;

  @override
  String toString() {
    return 'FailureModel.localError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_LocalErrorCopyWith<_$_LocalError> get copyWith =>
      __$$_LocalErrorCopyWithImpl<_$_LocalError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) serverError,
    required TResult Function(dynamic message) localError,
    required TResult Function(dynamic message) internalError,
  }) {
    return localError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
  }) {
    return localError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
    required TResult orElse(),
  }) {
    if (localError != null) {
      return localError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalError value) localError,
    required TResult Function(_InternalError value) internalError,
  }) {
    return localError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
  }) {
    return localError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
    required TResult orElse(),
  }) {
    if (localError != null) {
      return localError(this);
    }
    return orElse();
  }
}

abstract class _LocalError implements FailureModel {
  const factory _LocalError(final dynamic message) = _$_LocalError;

  @override
  dynamic get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LocalErrorCopyWith<_$_LocalError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InternalErrorCopyWith<$Res>
    implements $FailureModelCopyWith<$Res> {
  factory _$$_InternalErrorCopyWith(
          _$_InternalError value, $Res Function(_$_InternalError) then) =
      __$$_InternalErrorCopyWithImpl<$Res>;
  @override
  $Res call({dynamic message});
}

/// @nodoc
class __$$_InternalErrorCopyWithImpl<$Res>
    extends _$FailureModelCopyWithImpl<$Res>
    implements _$$_InternalErrorCopyWith<$Res> {
  __$$_InternalErrorCopyWithImpl(
      _$_InternalError _value, $Res Function(_$_InternalError) _then)
      : super(_value, (v) => _then(v as _$_InternalError));

  @override
  _$_InternalError get _value => super._value as _$_InternalError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_InternalError(
      message == freezed ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$_InternalError implements _InternalError {
  const _$_InternalError(this.message);

  @override
  final dynamic message;

  @override
  String toString() {
    return 'FailureModel.internalError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternalError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_InternalErrorCopyWith<_$_InternalError> get copyWith =>
      __$$_InternalErrorCopyWithImpl<_$_InternalError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) serverError,
    required TResult Function(dynamic message) localError,
    required TResult Function(dynamic message) internalError,
  }) {
    return internalError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
  }) {
    return internalError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? serverError,
    TResult Function(dynamic message)? localError,
    TResult Function(dynamic message)? internalError,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_LocalError value) localError,
    required TResult Function(_InternalError value) internalError,
  }) {
    return internalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
  }) {
    return internalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_LocalError value)? localError,
    TResult Function(_InternalError value)? internalError,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(this);
    }
    return orElse();
  }
}

abstract class _InternalError implements FailureModel {
  const factory _InternalError(final dynamic message) = _$_InternalError;

  @override
  dynamic get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InternalErrorCopyWith<_$_InternalError> get copyWith =>
      throw _privateConstructorUsedError;
}
