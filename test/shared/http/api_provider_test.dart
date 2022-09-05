import 'dart:convert';

import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:ala_pos/shared/models/token/token.dart';
import 'package:ala_pos/shared/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

// class MockDioAdapter extends Mock implements HttpClientAdapter {}

class MockTokenRepository extends Mock implements TokenRepository {}

void main() {
  late Dio dio;
  // late MockDioAdapter dioAdapterMock;
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

    when(() => tokenRepository.fetchToken()).thenAnswer(
      (invocation) => Future.value(
        Token(token: "token-valid"),
      ),
    );

    dotenv.testLoad(fileInput: '''BASE_URL=https://alapos.id''');
    apiProvider = ApiProvider(tokenRepository, dio);
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
}
