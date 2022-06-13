import 'package:core/core.dart';
import 'package:core/helpers/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:injectable/injectable.dart';

class ApiClient {
  List<Interceptor> interceptors = [];

  Dio dio;

  String baseUrl;

  ApiClient({required this.dio, this.baseUrl = 'http://127.0.0.1:8000/api'});

  void init() {
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 120000; //1min
    dio.options.followRedirects = false;
    dio.options.validateStatus = (t) {
      return t != null ? t < 500 : false;
    };

    if (kDebugMode) {
      //
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      // print(response.statusMessage.toString());

      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      if (e.response!.statusMessage!.contains("Unauthorized") && e.response!.statusCode == 401) {
        // If currenct page isn't LoginScreen, redirect to LoginScreen if response is Unauthorized

      }
      if (kDebugMode) {
        // SnackbarCustom.defaultColor("Network Error", e.message);
      }
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
  }

  Dio withToken({String token = ''}) {
    init();
    if (token.isEmpty) {
      LocalStorage().getValue(Constant.token).then((value) {
        token = value;
      });
    }
    dio.options.headers["Authorization"] = token;

    return dio;
  }

  Dio instance({String token = ''}) {
    init();
    if (token.isEmpty) {
      LocalStorage().getValue(Constant.token).then((value) {
        token = value ?? '';
      });
    }
    return dio;
  }
}
