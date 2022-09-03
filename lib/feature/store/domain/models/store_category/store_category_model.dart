import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_category_model.freezed.dart';
part 'store_category_model.g.dart';

@freezed
class StoreCategoryModel with _$StoreCategoryModel {
  factory StoreCategoryModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') required String name,
  }) = _StoreCategoryModel;

  factory StoreCategoryModel.fromJson(Map<String, dynamic> json) => _$StoreCategoryModelFromJson(json);
}
