import 'dart:convert';

import 'package:ala_pos/app/domain/models/response/response.dart';
import 'package:ala_pos/feature/user_management/data/remote/user_remote_source.dart';
import 'package:ala_pos/feature/user_management/domain/models/role/role_model.dart';
import 'package:ala_pos/feature/user_management/domain/models/user/user_model.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider((ref) => UserRepository(ref.read(localStorageProvider), ref.read(userRemoteSourceProvider)));

class UserRepository {
  LocalStorage localStorage;
  UserRemoteSource userRemoteSource;
  UserRepository(this.localStorage, this.userRemoteSource);

  Future<RoleModel?> roleActive() async {
    var roleModelData = await localStorage.read(Constant.userRole);
    if (roleModelData == null) {
      return null;
    }
    RoleModel roleModel = RoleModel.fromJson(json.decode(roleModelData));
    return roleModel;
  }

  Future<UserModel?> userActive() async {
    var userModelData = await localStorage.read(Constant.userModel);
    if (userModelData == null) {
      return null;
    }
    UserModel userModel = UserModel.fromJson(json.decode(userModelData));
    return userModel;
  }

  /// Get Role and Permission for current User.
  void rolePermissions() async {
    var userModel = await userActive();
    var response = await userRemoteSource.rolePermission(userModel!.id.toString());
    response as APISuccess;
    var roleModel = RoleModel.fromJson(response.resource.data);
    localStorage.store(Constant.userRole, json.encode(roleModel.toJson()));
    localStorage.store(Constant.userPermissionList, json.encode(response.resource.data['permissions']));
  }
}
