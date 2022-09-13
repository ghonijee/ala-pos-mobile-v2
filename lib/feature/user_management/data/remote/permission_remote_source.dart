import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';

class PermissionRemoteSource {
  ApiProvider _api;
  PermissionRemoteSource(this._api);

  String resource = "/permission";

  /// Get List All Permission.
  Future<APIResponse> list() async {
    var response = await _api.get(resource);
    return response;
  }
}
