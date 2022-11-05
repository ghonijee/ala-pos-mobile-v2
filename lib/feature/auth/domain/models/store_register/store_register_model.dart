import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_register_model.freezed.dart';

@freezed
class StoreRegisterModel with _$StoreRegisterModel {
  factory StoreRegisterModel({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'store_category_id') required String store_category_id,
    @JsonKey(name: 'phone') required String phone,
  }) = _StoreRegisterModel;
}
