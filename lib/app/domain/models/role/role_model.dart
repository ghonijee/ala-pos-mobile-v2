import 'package:freezed_annotation/freezed_annotation.dart';

import '../permission/permission_model.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  factory RoleModel({
    required int id,
    @JsonKey(name: "store_id") required int storeId,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "permissions") required List<PermissionModel> permissions,
  }) = _RoleModel;

  factory RoleModel.fromJson(json) => _$RoleModelFromJson(json);
}
