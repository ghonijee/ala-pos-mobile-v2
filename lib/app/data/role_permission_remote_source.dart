import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rolePermissionRemoteSourceProvider = Provider.autoDispose((ref) {
  return RolePermissionRemoteSource(ref.read(apiProvider));
});

class RolePermissionRemoteSource {
  ApiProvider _api;
  RolePermissionRemoteSource(this._api);

  Future<APIResponse> userRole(String userId) async {
    var response = await _api.get("/user/role/${userId}");
    return response;
  }
}
