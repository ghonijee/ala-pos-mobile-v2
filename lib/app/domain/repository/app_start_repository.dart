import 'dart:convert';

import 'package:ala_pos/app/data/role_permission_remote_source.dart';
import 'package:ala_pos/app/data/token_remote_source.dart';
import 'package:ala_pos/feature/auth/domain/models/user/user_model.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';

import '../../../feature/user_management/domain/models/role/role_model.dart';
import '../../../shared/constants/store_key.dart';
import '../../../shared/utils/local_storage.dart';

final appStartRepositoryProvider = Provider(
  (ref) {
    return AppStartRepository(
      localStorage: ref.read(localStorageProvider),
      rolePermissionRemoteSource: ref.read(rolePermissionRemoteSourceProvider),
      tokenRemoteSource: ref.read(tokenRemoteSourceProvider),
    );
  },
);

class AppStartRepository {
  RolePermissionRemoteSource rolePermissionRemoteSource;
  TokenRemoteSource tokenRemoteSource;
  LocalStorage localStorage;

  AppStartRepository({
    required this.rolePermissionRemoteSource,
    required this.tokenRemoteSource,
    required this.localStorage,
  });

  Future<Result<RoleModel, AppException>> userRole() async {
    // get user login ID
    String? encodedUserLogin = await localStorage.read(Constant.userModel);
    var userLogin = UserModel.fromJson(jsonDecode(encodedUserLogin!));
    var response = await rolePermissionRemoteSource.userRole(userLogin.id.toString());

    if (response is APIError) {
      return Failure(response.exception);
    }

    // Parse response to APISuccess
    response as APISuccess;
    var resource = response.resource;
    // Save roleName & data to local Storage
    RoleModel roleModel = RoleModel.fromJson(resource.data);
    // Store to local RoleName
    localStorage.store(Constant.userRole, roleModel.name);
    // store to lcoal list Permission with endcode JSON
    localStorage.store(Constant.userPermissionList, jsonEncode(resource.data['permissions']));
    return Success(roleModel);
  }

  Future<bool> tokenValidate() async {
    var result = await tokenRemoteSource.checkToken();
    return result.when(success: (success) => true, error: (error) => false);
  }
}
