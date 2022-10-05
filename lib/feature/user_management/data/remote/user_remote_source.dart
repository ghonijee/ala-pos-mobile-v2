import 'dart:convert';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';

class UserRemoteSource {
  ApiProvider _api;
  String resouce = "/user";

  UserRemoteSource(this._api);

  Future<APIResponse> paginate({int? page, int take = 15, String? sortBy, bool desc = true, String? filter}) async {
    var response = await _api.get(resouce, query: {
      "filter": filter,
      "sort": jsonEncode([
        {"selector": sortBy, "desc": desc}
      ]),
      "take": take.toString(),
      "page": page?.toString(),
    });

    return response;
  }

  Future<APIResponse> create(Map<String, dynamic> dataJson) async {
    var response = await _api.post(resouce, dataJson);
    return response;
  }

  Future<APIResponse> show(String id) async {
    var response = await _api.get("$resouce/$id");
    return response;
  }

  Future<APIResponse> update(Map<String, dynamic> dataJson, String id) async {
    var response = await _api.put("$resouce/$id", dataJson);
    return response;
  }

  Future<APIResponse> delete(String id) async {
    var response = await _api.delete("$resouce/$id");
    return response;
  }

  Future<APIResponse> changePassword(Map<String, dynamic> dataJson, String id) async {
    var response = await _api.post("/change-password/$id", dataJson);
    return response;
  }

  Future<APIResponse> rolePermission(String id) async {
    var response = await _api.get("/role/user/$id");
    return response;
  }
}
