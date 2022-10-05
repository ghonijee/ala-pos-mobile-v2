import 'dart:async';
import 'dart:io';
import 'package:ala_pos/app/domain/repository/token_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/domain/models/exception/app_exception.dart';
import '../../app/domain/models/json/json_resource.dart';
import '../../app/domain/models/response/api_response.dart';
import '../../app/domain/models/token/token_model.dart';
import '../constants/store_key.dart';
import 'interceptor/dio_connectivity_request_retrier.dart';
import 'interceptor/retry_interceptor.dart';

enum ContentType { urlEncoded, json }

final connectivityProvider = Provider.autoDispose(
  (ref) => Connectivity(),
);

final dioProvider = Provider.autoDispose(
  (ref) => Dio(),
);

final apiProvider = Provider<ApiProvider>(
  (ref) => ApiProvider(ref.read(dioProvider), ref.read(connectivityProvider)),
);

class ApiProvider {
  final headers = {
    'accept': '*/*',
    'Content-Type': "application/json",
  };

  late Dio _dio;

  Connectivity connectivity;

  // TokenRepository _tokenRepository;

  late String _baseUrl;

  Dio get dio => _dio;

  ApiProvider(this._dio, this.connectivity) {
    _dio.options.sendTimeout = 30000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;

    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    _dio.httpClientAdapter = DefaultHttpClientAdapter();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(request: false));
    }

    if (dotenv.env['BASE_URL'] != null) {
      _baseUrl = dotenv.env['BASE_URL']!;
    }
  }

  Future<Dio> instance() async {
    try {
      String? tokenValue;
      Token? _appToken;

      const storage = FlutterSecureStorage();
      tokenValue = await storage.read(key: Constant.token);
      if (tokenValue != null) {
        _appToken = tokenFromJson(tokenValue);
      }
      // _appToken = await _tokenRepository.fetchToken();
      // final _appToken = null;
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken.token}';
      }
      _dio.options.headers = headers;
      _dio.options.baseUrl = _baseUrl;
      return _dio;
    } on Exception catch (e) {
      return _dio;
    }
  }

  APIResponse responseHandle(response) {
    if (response.statusCode == null) {
      return const APIResponse.error(AppException.connectivity());
    }

    JsonResource resource = JsonResource.fromJson(response.data);

    if (response.statusCode! < 300) {
      return APIResponse.success(resource);
    } else {
      if (response.statusCode! == 401) {
        return APIResponse.error(AppException.unauthorized());
      } else if (response.statusCode! == 502) {
        return const APIResponse.error(AppException.error());
      } else {
        return APIResponse.error(AppException.errorWithMessage(resource.error ?? resource.message ?? "Server error"));
      }
    }
  }

  APIResponse dioErrorHandle(e) {
    if (e.error is SocketException) {
      return const APIResponse.error(AppException.connectivity());
    }
    if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
      return const APIResponse.error(AppException.connectivity());
    }

    if (e.response != null) {
      JsonResource resource = JsonResource.fromJson(e.response!.data);
      APIResponse.error(AppException.errorWithMessage(resource.error ?? resource.message ?? "Server error"));
    }
    return APIResponse.error(AppException.errorWithMessage(e.message));
  }

  Future<APIResponse> post(String path, dynamic body, {String? newBaseUrl, String? token, Map<String, String?>? query, ContentType contentType = ContentType.json}) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }

    await instance();
    try {
      var url = "${path}";
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      return responseHandle(response);
    } on DioError catch (e) {
      return dioErrorHandle(e);
    } on Error catch (e) {
      return APIResponse.error(AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> get(String path, {String? newBaseUrl, String? token, Map<String, String?>? query, ContentType contentType = ContentType.json}) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    await instance();

    try {
      var url = "${path}";
      final response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      return responseHandle(response);
    } on DioError catch (e) {
      return dioErrorHandle(e);
    } on Error catch (e) {
      return APIResponse.error(AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> put(String path, dynamic body, {String? newBaseUrl, String? token, Map<String, String?>? query, ContentType contentType = ContentType.json}) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    await instance();

    try {
      var url = "${path}";
      final response = await _dio.put(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      return responseHandle(response);
    } on DioError catch (e) {
      return dioErrorHandle(e);
    } on Error catch (e) {
      return APIResponse.error(AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> delete(String path, {dynamic body, String? newBaseUrl, String? token, Map<String, String?>? query, ContentType contentType = ContentType.json}) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    await instance();

    try {
      var url = "${path}";
      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      return responseHandle(response);
    } on DioError catch (e) {
      return dioErrorHandle(e);
    } on Error catch (e) {
      return APIResponse.error(AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> patch(String path, dynamic body, {String? newBaseUrl, String? token, Map<String, String?>? query, ContentType contentType = ContentType.json}) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    await instance();

    try {
      var url = "${path}";
      final response = await _dio.patch(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      return responseHandle(response);
    } on DioError catch (e) {
      return dioErrorHandle(e);
    } on Error catch (e) {
      return APIResponse.error(AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }
}
