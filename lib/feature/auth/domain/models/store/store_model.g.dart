// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreModel _$$_StoreModelFromJson(Map<String, dynamic> json) =>
    _$_StoreModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      useStockOpname: json['use_stock_opname'] as bool? ?? true,
      storeCategoryId: json['store_category_id'] as int?,
      storeCategoryName: json['store_category_name'] as String?,
      imageUrl: json['image_url'] as String?,
      imagePath: json['image_path'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      laravelThroughKey: json['laravel_through_key'] as int?,
    );

Map<String, dynamic> _$$_StoreModelToJson(_$_StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'use_stock_opname': instance.useStockOpname,
      'store_category_id': instance.storeCategoryId,
      'store_category_name': instance.storeCategoryName,
      'image_url': instance.imageUrl,
      'image_path': instance.imagePath,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'laravel_through_key': instance.laravelThroughKey,
    };
