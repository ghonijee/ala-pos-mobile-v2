import 'dart:convert';

import 'package:ala_pos/feature/user_management/domain/models/permission/permission_model.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Permission {
  static Future<bool> can(String key, {FlutterSecureStorage storage = const FlutterSecureStorage()}) async {
    var listPermissionEncoded = await storage.read(key: Constant.userPermissionList);
    if (listPermissionEncoded != null) {
      var listPermissionDecoded = json.decode(listPermissionEncoded) as List<dynamic>;
      List<PermissionModel> permissions = listPermissionDecoded.map((e) => PermissionModel.fromJson(e)).toList();

      var check = permissions.indexWhere((element) {
        return element.key.toLowerCase() == key.toLowerCase();
      });

      return check >= 0;
    }
    return false;
  }
}
