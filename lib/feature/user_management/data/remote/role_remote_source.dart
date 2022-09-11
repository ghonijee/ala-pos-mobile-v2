import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';

class RoleRemoteSource {
  ApiProvider _api;
  RoleRemoteSource(this._api);

  String resource = "/role";

  /// Get List All role by Store ID.
  /// This request used queryAdapter for builder filter
  /// data roles by store_id
  Future<APIResponse> list(String filter) async {
    var response = await _api.get(resource, query: {
      "filter": filter,
    });
    return response;
  }

  /// Get role of user by send `userId`
  Future<APIResponse> userRole(String userId) async {
    var response = await _api.get("/user/role/${userId}");
    return response;
  }

  /// Create new role for Store
  Future<APIResponse> create(Map<String, dynamic> data) async {
    var response = await _api.post(resource, data);
    return response;
  }
}
