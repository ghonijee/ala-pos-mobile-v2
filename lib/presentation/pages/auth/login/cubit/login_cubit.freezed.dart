// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoginState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_OnSuccessCopyWith<$Res> {
  factory _$$_OnSuccessCopyWith(
          _$_OnSuccess value, $Res Function(_$_OnSuccess) then) =
      __$$_OnSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnSuccessCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_OnSuccessCopyWith<$Res> {
  __$$_OnSuccessCopyWithImpl(
      _$_OnSuccess _value, $Res Function(_$_OnSuccess) _then)
      : super(_value, (v) => _then(v as _$_OnSuccess));

  @override
  _$_OnSuccess get _value => super._value as _$_OnSuccess;
}

/// @nodoc

class _$_OnSuccess implements _OnSuccess {
  const _$_OnSuccess();

  @override
  String toString() {
    return 'LoginState.onSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) {
    return onSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) {
    return onSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class _OnSuccess implements LoginState {
  const factory _OnSuccess() = _$_OnSuccess;
}

/// @nodoc
abstract class _$$_NotHavestoreCopyWith<$Res> {
  factory _$$_NotHavestoreCopyWith(
          _$_NotHavestore value, $Res Function(_$_NotHavestore) then) =
      __$$_NotHavestoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotHavestoreCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_NotHavestoreCopyWith<$Res> {
  __$$_NotHavestoreCopyWithImpl(
      _$_NotHavestore _value, $Res Function(_$_NotHavestore) _then)
      : super(_value, (v) => _then(v as _$_NotHavestore));

  @override
  _$_NotHavestore get _value => super._value as _$_NotHavestore;
}

/// @nodoc

class _$_NotHavestore implements _NotHavestore {
  const _$_NotHavestore();

  @override
  String toString() {
    return 'LoginState.notHaveStore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotHavestore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) {
    return notHaveStore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) {
    return notHaveStore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) {
    if (notHaveStore != null) {
      return notHaveStore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) {
    return notHaveStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) {
    return notHaveStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (notHaveStore != null) {
      return notHaveStore(this);
    }
    return orElse();
  }
}

abstract class _NotHavestore implements LoginState {
  const factory _NotHavestore() = _$_NotHavestore;
}

/// @nodoc
abstract class _$$_OnFailureCopyWith<$Res> {
  factory _$$_OnFailureCopyWith(
          _$_OnFailure value, $Res Function(_$_OnFailure) then) =
      __$$_OnFailureCopyWithImpl<$Res>;
  $Res call({dynamic message});
}

/// @nodoc
class __$$_OnFailureCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_OnFailureCopyWith<$Res> {
  __$$_OnFailureCopyWithImpl(
      _$_OnFailure _value, $Res Function(_$_OnFailure) _then)
      : super(_value, (v) => _then(v as _$_OnFailure));

  @override
  _$_OnFailure get _value => super._value as _$_OnFailure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_OnFailure(
      message: message == freezed ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$_OnFailure implements _OnFailure {
  const _$_OnFailure({this.message});

  @override
  final dynamic message;

  @override
  String toString() {
    return 'LoginState.onFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnFailure &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_OnFailureCopyWith<_$_OnFailure> get copyWith =>
      __$$_OnFailureCopyWithImpl<_$_OnFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() onSuccess,
    required TResult Function() notHaveStore,
    required TResult Function(dynamic message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? onSuccess,
    TResult Function()? notHaveStore,
    TResult Function(dynamic message)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnSuccess value) onSuccess,
    required TResult Function(_NotHavestore value) notHaveStore,
    required TResult Function(_OnFailure value) onFailure,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_OnSuccess value)? onSuccess,
    TResult Function(_NotHavestore value)? notHaveStore,
    TResult Function(_OnFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _OnFailure implements LoginState {
  const factory _OnFailure({final dynamic message}) = _$_OnFailure;

  dynamic get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OnFailureCopyWith<_$_OnFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
