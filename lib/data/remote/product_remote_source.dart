import 'dart:convert';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductRemoteSource {
  ApiClient apiClient;
  String resouce = "/product";

  ProductRemoteSource(this.apiClient);

  Future<ApiResponse> paginate({String? page, int take = 15, String? sortBy, bool desc = true, String? filter}) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.get(resouce, queryParameters: {
        "filter": filter!,
        'sort': jsonEncode([
          {'selector': sortBy!, 'desc': desc}
        ]),
        "take": take.toString(),
        "page": page!,
      });

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> create(Map<String, dynamic> dataJson) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.post(resouce, data: {});

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> show(String id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.get("$resouce/$id");

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

  Future<ApiResponse> delete(String id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.delete("$resouce/$id");

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }
}
