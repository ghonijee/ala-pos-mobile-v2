import 'package:core/core.dart';
import 'package:core/resource/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRemoteSource {
  ApiClient apiClient;

  AuthRemoteSource(this.apiClient);

  login(String username, String password) {
    Dio dio = apiClient.instance();
  }

  register({required String username, required String phone, required String password}) {
    Dio dio = apiClient.instance();
  }

  Future<ApiResponse> checkToken() async {
    Dio dio = apiClient.instance();
    try {
      Response response = await dio.post("/mobile/check-token");
      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      rethrow;
    }
  }
}
