import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/http/api_provider.dart';
import '../../../../shared/models/response/api_response.dart';

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

  // Future<ApiResponse> register({required String username, required String phone, required String password, required String deviceName}) async {
  //   Dio dio = await apiClient.instance();
  //     Response registerResponse = await dio.post("/mobile/sign-up", data: {
  //       "username": username,
  //       "phone": phone,
  //       "password": password,
  //       "device_name": deviceName,
  //     });
  //   try {

  //     return SuccessResponse.fromJson(registerResponse.data);
  //   } on DioError catch (e) {
  //     rethrow;
  //   } catch (e) {
  //     return FailedResponse(message: e.toString(), status: false);
  //   }
  // }

  // Future<ApiResponse> logout() async {
  //   Dio dio = await apiClient.instance();
  //   try {
  //     Response response = await dio.get("/mobile/logout");
  //     return SuccessResponse.fromJson(response.data);
  //   } on DioError catch (e) {
  //     return FailedResponse.fromJson(e.response!.data);
  //   }
  // }

  // Future<ApiResponse> checkToken() async {
  //   Dio dio = await apiClient.instance();
  //   try {
  //     Response response = await dio.get("/mobile/check-token");
  //     return SuccessResponse.fromJson(response.data);
  //   } on DioError catch (e) {
  //     if (kDebugMode) {
  //       print(e.message);
  //     }
  //     rethrow;
  //   }
  // }
}
