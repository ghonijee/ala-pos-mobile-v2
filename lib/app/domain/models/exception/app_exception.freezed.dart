// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unauthorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(AppExceptionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppExceptionConnectivity value)? connectivity,
    TResult? Function(AppExceptionUnauthorized value)? unauthorized,
    TResult? Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(AppExceptionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(AppExceptionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppExceptionConnectivityCopyWith<$Res> {
  factory _$$AppExceptionConnectivityCopyWith(_$AppExceptionConnectivity value,
          $Res Function(_$AppExceptionConnectivity) then) =
      __$$AppExceptionConnectivityCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppExceptionConnectivityCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppExceptionConnectivity>
    implements _$$AppExceptionConnectivityCopyWith<$Res> {
  __$$AppExceptionConnectivityCopyWithImpl(_$AppExceptionConnectivity _value,
      $Res Function(_$AppExceptionConnectivity) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppExceptionConnectivity implements AppExceptionConnectivity {
  const _$AppExceptionConnectivity();

  @override
  String toString() {
    return 'AppException.connectivity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppExceptionConnectivity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return connectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unauthorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return connectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(AppExceptionError value) error,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppExceptionConnectivity value)? connectivity,
    TResult? Function(AppExceptionUnauthorized value)? unauthorized,
    TResult? Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(AppExceptionError value)? error,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class AppExceptionConnectivity implements AppException {
  const factory AppExceptionConnectivity() = _$AppExceptionConnectivity;
}

/// @nodoc
abstract class _$$AppExceptionUnauthorizedCopyWith<$Res> {
  factory _$$AppExceptionUnauthorizedCopyWith(_$AppExceptionUnauthorized value,
          $Res Function(_$AppExceptionUnauthorized) then) =
      __$$AppExceptionUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppExceptionUnauthorizedCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppExceptionUnauthorized>
    implements _$$AppExceptionUnauthorizedCopyWith<$Res> {
  __$$AppExceptionUnauthorizedCopyWithImpl(_$AppExceptionUnauthorized _value,
      $Res Function(_$AppExceptionUnauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppExceptionUnauthorized implements AppExceptionUnauthorized {
  const _$AppExceptionUnauthorized();

  @override
  String toString() {
    return 'AppException.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppExceptionUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unauthorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(AppExceptionError value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppExceptionConnectivity value)? connectivity,
    TResult? Function(AppExceptionUnauthorized value)? unauthorized,
    TResult? Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(AppExceptionError value)? error,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class AppExceptionUnauthorized implements AppException {
  const factory AppExceptionUnauthorized() = _$AppExceptionUnauthorized;
}

/// @nodoc
abstract class _$$AppExceptionErrorMessageCopyWith<$Res> {
  factory _$$AppExceptionErrorMessageCopyWith(_$AppExceptionErrorMessage value,
          $Res Function(_$AppExceptionErrorMessage) then) =
      __$$AppExceptionErrorMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AppExceptionErrorMessageCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppExceptionErrorMessage>
    implements _$$AppExceptionErrorMessageCopyWith<$Res> {
  __$$AppExceptionErrorMessageCopyWithImpl(_$AppExceptionErrorMessage _value,
      $Res Function(_$AppExceptionErrorMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AppExceptionErrorMessage(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppExceptionErrorMessage implements AppExceptionErrorMessage {
  const _$AppExceptionErrorMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppException.errorWithMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppExceptionErrorMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppExceptionErrorMessageCopyWith<_$AppExceptionErrorMessage>
      get copyWith =>
          __$$AppExceptionErrorMessageCopyWithImpl<_$AppExceptionErrorMessage>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return errorWithMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unauthorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return errorWithMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(AppExceptionError value) error,
  }) {
    return errorWithMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppExceptionConnectivity value)? connectivity,
    TResult? Function(AppExceptionUnauthorized value)? unauthorized,
    TResult? Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(AppExceptionError value)? error,
  }) {
    return errorWithMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(this);
    }
    return orElse();
  }
}

abstract class AppExceptionErrorMessage implements AppException {
  const factory AppExceptionErrorMessage(final String message) =
      _$AppExceptionErrorMessage;

  String get message;
  @JsonKey(ignore: true)
  _$$AppExceptionErrorMessageCopyWith<_$AppExceptionErrorMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppExceptionErrorCopyWith<$Res> {
  factory _$$AppExceptionErrorCopyWith(
          _$AppExceptionError value, $Res Function(_$AppExceptionError) then) =
      __$$AppExceptionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppExceptionErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppExceptionError>
    implements _$$AppExceptionErrorCopyWith<$Res> {
  __$$AppExceptionErrorCopyWithImpl(
      _$AppExceptionError _value, $Res Function(_$AppExceptionError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppExceptionError implements AppExceptionError {
  const _$AppExceptionError();

  @override
  String toString() {
    return 'AppException.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppExceptionError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectivity,
    TResult? Function()? unauthorized,
    TResult? Function(String message)? errorWithMessage,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(AppExceptionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppExceptionConnectivity value)? connectivity,
    TResult? Function(AppExceptionUnauthorized value)? unauthorized,
    TResult? Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult? Function(AppExceptionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AppExceptionError implements AppException {
  const factory AppExceptionError() = _$AppExceptionError;
}
