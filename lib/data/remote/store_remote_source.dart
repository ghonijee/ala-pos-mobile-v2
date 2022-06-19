import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StoreRemoteSource {
  ApiClient apiClient;
  String resouce = "/store";

  StoreRemoteSource(this.apiClient);

  Future<ApiResponse> create({
    required String phone,
    required String address,
    required String name,
  }) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.post("/store", data: {
        "name": name,
        "phone": phone,
        "address": address,
      });

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> main() async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.get("$resouce/main");

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> update(Map<String, dynamic> dataJson) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.put(resouce, data: dataJson);

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }
}
