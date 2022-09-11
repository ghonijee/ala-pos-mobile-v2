import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@freezed
class PermissionModel with _$PermissionModel {
  factory PermissionModel({
    required int id,
    @JsonKey(name: "key") required String key,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "is_active") required int isActive,
  }) = _PermissionModel;

  factory PermissionModel.fromJson(json) => _$PermissionModelFromJson(json);
}
