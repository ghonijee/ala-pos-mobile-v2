// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JsonResource _$$_JsonResourceFromJson(Map<String, dynamic> json) =>
    _$_JsonResource(
      status: json['status'] as bool? ?? true,
      message: json['message'] as String? ?? 'success',
      error: json['error'] as String? ?? 'error',
      data: json['data'],
    );

Map<String, dynamic> _$$_JsonResourceToJson(_$_JsonResource instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };
