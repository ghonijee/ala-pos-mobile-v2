import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "store_id") required String storeId,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "reduce_price", nullable: true) int? reducePrice,
    @JsonKey(name: "code", nullable: true) String? code,
    @JsonKey(name: "cost", nullable: true) int? cost,
    @JsonKey(name: "stock", nullable: true) required int stock,
    @JsonKey(name: "min_stock", nullable: true) required int minStock,
    @JsonKey(name: "unit", nullable: true) String? unit,
    @JsonKey(name: "created_at", nullable: true) DateTime? createdAt,
    @JsonKey(name: "updated_at", nullable: true) DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
