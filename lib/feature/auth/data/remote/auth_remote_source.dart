import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';

final authRemoteSourceProvider = Provider((ref) {
  return AuthRemoteSource(ref.read(apiProvider));
});

class AuthRemoteSource {
  ApiProvider _api;

  AuthRemoteSource(this._api);

  Future<APIResponse> login(String username, String password, String deviceName) async {
    APIResponse response = await _api.post(
      "/mobile/sign-in",
      {
        "username": username,
        "password": password,
        "device_name": deviceName,
      },
    );

    return response;
  }

  Future<APIResponse> register({required String username, required String phone, required String password, required String deviceName}) async {
    APIResponse response = await _api.post("/mobile/sign-up", {
      "username": username,
      "phone": phone,
      "password": password,
      "device_name": deviceName,
    });
    return response;
  }

  Future<APIResponse> logout() async {
    APIResponse response = await _api.get("/mobile/logout");
    return response;
  }
}
