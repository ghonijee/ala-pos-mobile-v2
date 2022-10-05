import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ala_pos/app/app.dart';

final storeRemoteSourceProvider = Provider<StoreRemoteSource>((ref) => StoreRemoteSource(ref.read(apiProvider)));

class StoreRemoteSource {
  ApiProvider _api;
  String resouce = "/store";

  StoreRemoteSource(this._api);

  Future<APIResponse> create({required String phone, required String address, required String name}) async {
    APIResponse response = await _api.post("/$resouce", {
      "name": name,
      "phone": phone,
      "address": address,
    });

    return response;
  }

  Future<APIResponse> main() async {
    APIResponse response = await _api.get("$resouce/main");
    return response;
  }

  Future<APIResponse> update(Map<String, dynamic> dataJson, int id) async {
    APIResponse response = await _api.put("/$resouce/$id", dataJson);

    return response;
  }
}
