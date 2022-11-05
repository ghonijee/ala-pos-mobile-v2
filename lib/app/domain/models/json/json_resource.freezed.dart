// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'json_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JsonResource _$JsonResourceFromJson(Map<String, dynamic> json) {
  return _JsonResource.fromJson(json);
}

/// @nodoc
mixin _$JsonResource {
  @JsonKey(name: "status", defaultValue: true)
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message", defaultValue: "success")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "error", nullable: true)
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: "data", defaultValue: null)
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  AppException? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JsonResourceCopyWith<JsonResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonResourceCopyWith<$Res> {
  factory $JsonResourceCopyWith(
          JsonResource value, $Res Function(JsonResource) then) =
      _$JsonResourceCopyWithImpl<$Res, JsonResource>;
  @useResult
  $Res call(
      {@JsonKey(name: "status", defaultValue: true) bool status,
      @JsonKey(name: "message", defaultValue: "success") String? message,
      @JsonKey(name: "error", nullable: true) String? error,
      @JsonKey(name: "data", defaultValue: null) dynamic data,
      @JsonKey(ignore: true) AppException? exception});

  $AppExceptionCopyWith<$Res>? get exception;
}

/// @nodoc
class _$JsonResourceCopyWithImpl<$Res, $Val extends JsonResource>
    implements $JsonResourceCopyWith<$Res> {
  _$JsonResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? error = freezed,
    Object? data = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppExceptionCopyWith<$Res>? get exception {
    if (_value.exception == null) {
      return null;
    }

    return $AppExceptionCopyWith<$Res>(_value.exception!, (value) {
      return _then(_value.copyWith(exception: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JsonResourceCopyWith<$Res>
    implements $JsonResourceCopyWith<$Res> {
  factory _$$_JsonResourceCopyWith(
          _$_JsonResource value, $Res Function(_$_JsonResource) then) =
      __$$_JsonResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status", defaultValue: true) bool status,
      @JsonKey(name: "message", defaultValue: "success") String? message,
      @JsonKey(name: "error", nullable: true) String? error,
      @JsonKey(name: "data", defaultValue: null) dynamic data,
      @JsonKey(ignore: true) AppException? exception});

  @override
  $AppExceptionCopyWith<$Res>? get exception;
}

/// @nodoc
class __$$_JsonResourceCopyWithImpl<$Res>
    extends _$JsonResourceCopyWithImpl<$Res, _$_JsonResource>
    implements _$$_JsonResourceCopyWith<$Res> {
  __$$_JsonResourceCopyWithImpl(
      _$_JsonResource _value, $Res Function(_$_JsonResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? error = freezed,
    Object? data = null,
    Object? exception = freezed,
  }) {
    return _then(_$_JsonResource(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JsonResource implements _JsonResource {
  const _$_JsonResource(
      {@JsonKey(name: "status", defaultValue: true) required this.status,
      @JsonKey(name: "message", defaultValue: "success") this.message,
      @JsonKey(name: "error", nullable: true) this.error,
      @JsonKey(name: "data", defaultValue: null) this.data,
      @JsonKey(ignore: true) this.exception});

  factory _$_JsonResource.fromJson(Map<String, dynamic> json) =>
      _$$_JsonResourceFromJson(json);

  @override
  @JsonKey(name: "status", defaultValue: true)
  final bool status;
  @override
  @JsonKey(name: "message", defaultValue: "success")
  final String? message;
  @override
  @JsonKey(name: "error", nullable: true)
  final String? error;
  @override
  @JsonKey(name: "data", defaultValue: null)
  final dynamic data;
  @override
  @JsonKey(ignore: true)
  final AppException? exception;

  @override
  String toString() {
    return 'JsonResource(status: $status, message: $message, error: $error, data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JsonResource &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, error,
      const DeepCollectionEquality().hash(data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JsonResourceCopyWith<_$_JsonResource> get copyWith =>
      __$$_JsonResourceCopyWithImpl<_$_JsonResource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JsonResourceToJson(
      this,
    );
  }
}

abstract class _JsonResource implements JsonResource {
  const factory _JsonResource(
      {@JsonKey(name: "status", defaultValue: true) required final bool status,
      @JsonKey(name: "message", defaultValue: "success") final String? message,
      @JsonKey(name: "error", nullable: true) final String? error,
      @JsonKey(name: "data", defaultValue: null) final dynamic data,
      @JsonKey(ignore: true) final AppException? exception}) = _$_JsonResource;

  factory _JsonResource.fromJson(Map<String, dynamic> json) =
      _$_JsonResource.fromJson;

  @override
  @JsonKey(name: "status", defaultValue: true)
  bool get status;
  @override
  @JsonKey(name: "message", defaultValue: "success")
  String? get message;
  @override
  @JsonKey(name: "error", nullable: true)
  String? get error;
  @override
  @JsonKey(name: "data", defaultValue: null)
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  AppException? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_JsonResourceCopyWith<_$_JsonResource> get copyWith =>
      throw _privateConstructorUsedError;
}
