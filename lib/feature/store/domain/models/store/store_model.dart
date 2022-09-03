import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  factory StoreModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'use_stock_opname') @Default(true) bool useStockOpname,
    @JsonKey(name: 'store_category_id') int? storeCategoryId,
    @JsonKey(name: 'store_category_name') String? storeCategoryName,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_path') String? imagePath,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'laravel_through_key') int? laravelThroughKey,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) => _$StoreModelFromJson(json);
}
