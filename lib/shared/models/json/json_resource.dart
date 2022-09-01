import 'package:freezed_annotation/freezed_annotation.dart';

import '../exception/app_exception.dart';

part 'json_resource.freezed.dart';
part 'json_resource.g.dart';

@freezed
class JsonResource with _$JsonResource {
  const factory JsonResource({
    @JsonKey(name: "status", defaultValue: true) required bool status,
    @JsonKey(name: "message", defaultValue: "success") String? message,
    @JsonKey(name: "error", defaultValue: "error") String? error,
    @JsonKey(name: "data", defaultValue: null) dynamic data,
    @JsonKey(ignore: true) AppException? exception,
  }) = _JsonResource;

  factory JsonResource.fromJson(Map<String, dynamic> json) => _$JsonResourceFromJson(json);
}
