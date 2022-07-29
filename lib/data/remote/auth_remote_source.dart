import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRemoteSource {
  ApiClient apiClient;

  AuthRemoteSource(this.apiClient);

  Future<ApiResponse> login(String username, String password, String deviceName) async {
    Dio dio = await apiClient.instance();
    try {
      Response response = await dio.post(
        "/mobile/sign-in",
        data: {
          "username": username,
          "password": password,
          "device_name": deviceName,
        },
      );
      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    }
  }

  Future<ApiResponse> register(
      {required String username, required String phone, required String password, required String deviceName}) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.post("/mobile/sign-up", data: {
        "username": username,
        "phone": phone,
        "password": password,
        "device_name": deviceName,
      });

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    }
  }

  Future<ApiResponse> logout() async {
    Dio dio = await apiClient.instance();
    try {
      Response response = await dio.get("/mobile/logout");
      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      return FailedResponse.fromJson(e.response!.data);
    }
  }

  Future<ApiResponse> checkToken() async {
    Dio dio = await apiClient.instance();
    try {
      Response response = await dio.get("/mobile/check-token");
      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      rethrow;
    }
  }
}
