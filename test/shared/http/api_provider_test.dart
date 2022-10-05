import 'dart:convert';

import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

// class MockDioAdapter extends Mock implements HttpClientAdapter {}

class MockTokenRepository extends Mock implements TokenRepository {}

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late Dio dio;
  late Connectivity connectivity;
  late TokenRepository tokenRepository;
  late DioAdapter dioAdapter;
  const baseUrl = 'https://alapos.id';
  final headers = {
    'accept': '*/*',
    'Content-Type': "application/json",
  };
  late ApiProvider apiProvider;

  setUp(() async {
    dio = Dio();
    tokenRepository = MockTokenRepository();
    connectivity = MockConnectivity();

    when(() => tokenRepository.fetchToken()).thenAnswer(
      (invocation) => Future.value(
        Token(token: "token-valid"),
      ),
    );

    when(
      () => connectivity.checkConnectivity(),
    ).thenAnswer((invocation) => Future.value(ConnectivityResult.mobile));

    dotenv.testLoad(fileInput: '''BASE_URL=https://alapos.id''');
    apiProvider = ApiProvider(dio, connectivity);
    dioAdapter = DioAdapter(dio: await apiProvider.instance());
  });

  group("POST Method", () {
    test("HTTP request response success (200)", () async {
      var successResponse = {"status": true, "message": "success", "data": null};
      dioAdapter.onPost(
        "/test",
        (server) => server.reply(200, successResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.post("/test", null);
      response as APISuccess;
      expect(response.resource, isA<JsonResource>());
      expect(response.resource.status, true);
      expect(response.resource.data, null);
      expect(response.resource.message, "success");
    });
    test("HTTP request response not found (404)", () async {
      var notFoundResponse = {"status": false, "message": "Data not found", "data": null};
      dioAdapter.onPost(
        "/test",
        (server) => server.reply(404, notFoundResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.post("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, notFoundResponse['message']);
    });
    test("HTTP request response internal error (500)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onPost(
        "/test",
        (server) => server.reply(500, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.post("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
    test("HTTP request response Unauthorized (401)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onPost(
        "/test",
        (server) => server.reply(401, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.post("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionUnauthorized;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionUnauthorized>());
    });

    test("HTTP request response Validated Error (422)", () async {
      var jsonResponse = {"status": false, "message": "The device name field is required.", "data": null};
      dioAdapter.onPost(
        "/test",
        (server) => server.reply(422, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.post("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
  });

  group("GET Method", () {
    test("HTTP request response success (200)", () async {
      var successResponse = {"status": true, "message": "success", "data": null};
      dioAdapter.onGet(
        "/test",
        (server) => server.reply(200, successResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.get("/test");
      response as APISuccess;
      expect(response.resource, isA<JsonResource>());
      expect(response.resource.status, true);
      expect(response.resource.data, null);
      expect(response.resource.message, "success");
    });
    test("HTTP request response not found (404)", () async {
      var notFoundResponse = {"status": false, "message": "Data not found", "data": null};
      dioAdapter.onGet(
        "/test",
        (server) => server.reply(404, notFoundResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.get("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, notFoundResponse['message']);
    });
    test("HTTP request response internal error (500)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onGet(
        "/test",
        (server) => server.reply(500, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.get("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
    test("HTTP request response Unauthorized (401)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onGet(
        "/test",
        (server) => server.reply(401, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.get("/test");
      response as APIError;
      var exception = response.exception as AppExceptionUnauthorized;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionUnauthorized>());
    });

    test("HTTP request response Validated Error (422)", () async {
      var jsonResponse = {"status": false, "message": "The device name field is required.", "data": null};
      dioAdapter.onGet(
        "/test",
        (server) => server.reply(422, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.get("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
  });

  group("PUT Method", () {
    test("HTTP request response success (200)", () async {
      var successResponse = {"status": true, "message": "success", "data": null};
      dioAdapter.onPut(
        "/test",
        (server) => server.reply(200, successResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.put("/test", null);
      response as APISuccess;
      expect(response.resource, isA<JsonResource>());
      expect(response.resource.status, true);
      expect(response.resource.data, null);
      expect(response.resource.message, "success");
    });
    test("HTTP request response not found (404)", () async {
      var notFoundResponse = {"status": false, "message": "Data not found", "data": null};
      dioAdapter.onPut(
        "/test",
        (server) => server.reply(404, notFoundResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.put("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, notFoundResponse['message']);
    });
    test("HTTP request response internal error (500)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onPut(
        "/test",
        (server) => server.reply(500, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.put("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
    test("HTTP request response Unauthorized (401)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onPut(
        "/test",
        (server) => server.reply(401, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.put("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionUnauthorized;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionUnauthorized>());
    });
    test("HTTP request response Validated Error (422)", () async {
      var jsonResponse = {"status": false, "message": "The device name field is required.", "data": null};
      dioAdapter.onPut(
        "/test",
        (server) => server.reply(422, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.put("/test", null);
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
  });

  group("DELETE Method", () {
    test("HTTP request response success (200)", () async {
      var successResponse = {"status": true, "message": "success", "data": null};
      dioAdapter.onDelete(
        "/test",
        (server) => server.reply(200, successResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.delete("/test");
      response as APISuccess;
      expect(response.resource, isA<JsonResource>());
      expect(response.resource.status, true);
      expect(response.resource.data, null);
      expect(response.resource.message, "success");
    });
    test("HTTP request response not found (404)", () async {
      var notFoundResponse = {"status": false, "message": "Data not found", "data": null};
      dioAdapter.onDelete(
        "/test",
        (server) => server.reply(404, notFoundResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.delete("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, notFoundResponse['message']);
    });
    test("HTTP request response internal error (500)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onDelete(
        "/test",
        (server) => server.reply(500, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.delete("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
    test("HTTP request response Unauthorized (401)", () async {
      var jsonResponse = {"status": false, "message": "Query SQL bla bla bla", "data": null};
      dioAdapter.onDelete(
        "/test",
        (server) => server.reply(401, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.delete("/test");
      response as APIError;
      var exception = response.exception as AppExceptionUnauthorized;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionUnauthorized>());
    });
    test("HTTP request response Validated Error (422)", () async {
      var jsonResponse = {"status": false, "message": "The device name field is required.", "data": null};
      dioAdapter.onDelete(
        "/test",
        (server) => server.reply(422, jsonResponse, delay: const Duration(seconds: 1)),
        data: null,
        queryParameters: null,
      );

      var response = await apiProvider.delete("/test");
      response as APIError;
      var exception = response.exception as AppExceptionErrorMessage;
      expect(response.exception, isA<AppException>());
      expect(exception, isA<AppExceptionErrorMessage>());
      expect(exception.message, jsonResponse['message']);
    });
  });
}
