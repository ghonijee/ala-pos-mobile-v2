// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$APIResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsonResource resource) success,
    required TResult Function(AppException exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsonResource resource)? success,
    TResult? Function(AppException exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsonResource resource)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess value) success,
    required TResult Function(APIError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APISuccess value)? success,
    TResult? Function(APIError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess value)? success,
    TResult Function(APIError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<$Res> {
  factory $APIResponseCopyWith(
          APIResponse value, $Res Function(APIResponse) then) =
      _$APIResponseCopyWithImpl<$Res, APIResponse>;
}

/// @nodoc
class _$APIResponseCopyWithImpl<$Res, $Val extends APIResponse>
    implements $APIResponseCopyWith<$Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$APISuccessCopyWith<$Res> {
  factory _$$APISuccessCopyWith(
          _$APISuccess value, $Res Function(_$APISuccess) then) =
      __$$APISuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({JsonResource resource});

  $JsonResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$$APISuccessCopyWithImpl<$Res>
    extends _$APIResponseCopyWithImpl<$Res, _$APISuccess>
    implements _$$APISuccessCopyWith<$Res> {
  __$$APISuccessCopyWithImpl(
      _$APISuccess _value, $Res Function(_$APISuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = null,
  }) {
    return _then(_$APISuccess(
      null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as JsonResource,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JsonResourceCopyWith<$Res> get resource {
    return $JsonResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value));
    });
  }
}

/// @nodoc

class _$APISuccess implements APISuccess {
  const _$APISuccess(this.resource);

  @override
  final JsonResource resource;

  @override
  String toString() {
    return 'APIResponse.success(resource: $resource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APISuccess &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APISuccessCopyWith<_$APISuccess> get copyWith =>
      __$$APISuccessCopyWithImpl<_$APISuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsonResource resource) success,
    required TResult Function(AppException exception) error,
  }) {
    return success(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsonResource resource)? success,
    TResult? Function(AppException exception)? error,
  }) {
    return success?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsonResource resource)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess value) success,
    required TResult Function(APIError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APISuccess value)? success,
    TResult? Function(APIError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess value)? success,
    TResult Function(APIError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class APISuccess implements APIResponse {
  const factory APISuccess(final JsonResource resource) = _$APISuccess;

  JsonResource get resource;
  @JsonKey(ignore: true)
  _$$APISuccessCopyWith<_$APISuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIErrorCopyWith<$Res> {
  factory _$$APIErrorCopyWith(
          _$APIError value, $Res Function(_$APIError) then) =
      __$$APIErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});

  $AppExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$$APIErrorCopyWithImpl<$Res>
    extends _$APIResponseCopyWithImpl<$Res, _$APIError>
    implements _$$APIErrorCopyWith<$Res> {
  __$$APIErrorCopyWithImpl(_$APIError _value, $Res Function(_$APIError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$APIError(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppExceptionCopyWith<$Res> get exception {
    return $AppExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$APIError implements APIError {
  const _$APIError(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'APIResponse.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIError &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIErrorCopyWith<_$APIError> get copyWith =>
      __$$APIErrorCopyWithImpl<_$APIError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsonResource resource) success,
    required TResult Function(AppException exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsonResource resource)? success,
    TResult? Function(AppException exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsonResource resource)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess value) success,
    required TResult Function(APIError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APISuccess value)? success,
    TResult? Function(APIError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess value)? success,
    TResult Function(APIError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class APIError implements APIResponse {
  const factory APIError(final AppException exception) = _$APIError;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$APIErrorCopyWith<_$APIError> get copyWith =>
      throw _privateConstructorUsedError;
}
