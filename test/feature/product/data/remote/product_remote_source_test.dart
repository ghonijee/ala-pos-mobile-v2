import 'dart:convert';
import 'dart:math';

import 'package:ala_pos/feature/product/data/remote/product_remote_source.dart';
import 'package:ala_pos/feature/product/domain/models/product/product_model.dart';
import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiProvider {}

void main() {
  ApiProvider apiProvider = MockApiService();
  late ProductRemoteSource productRemoteSource;
  String resouce = "/product";

  setUp(() {
    productRemoteSource = ProductRemoteSource(apiProvider);
  });

  test("Paginate can return APISuccess when request success", () async {
    String? filter;
    String? sortBy;
    bool desc = true;
    int take = 15;
    int page = 1;

    when(() => apiProvider.get(resouce, query: {
          "filter": filter,
          "sort": jsonEncode([
            {"selector": sortBy, "desc": desc}
          ]),
          "take": take.toString(),
          "page": page.toString(),
        })).thenAnswer((_) => Future.value(APIResponse.success(JsonResource(status: true, data: []))));

    productRemoteSource = ProductRemoteSource(apiProvider);
    var response = await productRemoteSource.paginate(
      page: 1,
      sortBy: sortBy,
      filter: filter,
    );

    var result = response as APISuccess;
    expect(result.resource.status, true);
  });
  test("Paginate can return APIError when request failed", () async {
    String? filter;
    String? sortBy;
    bool desc = true;
    int take = 15;
    int page = 1;

    when(() => apiProvider.get(resouce, query: {
          "filter": filter,
          "sort": jsonEncode([
            {"selector": sortBy, "desc": desc}
          ]),
          "take": take.toString(),
          "page": page.toString(),
        })).thenAnswer((_) => Future.value(
          APIResponse.error(AppException.error()),
        ));

    productRemoteSource = ProductRemoteSource(apiProvider);
    var response = await productRemoteSource.paginate(
      page: 1,
      sortBy: sortBy,
      filter: filter,
    );

    var result = response as APIError;
    expect(result.exception, isA<AppException>());
  });

  test("Create can return APISuccess when request success", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.post(resouce, productModel.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: productModel.toJson()),
      ),
    );

    var response = await productRemoteSource.create(productModel.toJson());
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, productModel.toJson());
  });
  test("Create can return APIError when request failed", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.post(resouce, productModel.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await productRemoteSource.create(productModel.toJson());
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Show data can return APISuccess when request success", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.get("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: productModel.toJson()),
      ),
    );

    var response = await productRemoteSource.show("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, productModel.toJson());
  });
  test("Show data can return APIError when request failed", () async {
    when(() => apiProvider.get("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("product not found")),
    );

    var response = await productRemoteSource.show("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Find data by Code/SKU can return APISuccess when request success", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.get("$resouce/find/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: productModel.toJson()),
      ),
    );

    var response = await productRemoteSource.findByCode("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, productModel.toJson());
  });
  test("Find data by Code/SKU can return APIError when request failed", () async {
    when(() => apiProvider.get("$resouce/find/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("product not found")),
    );

    var response = await productRemoteSource.show("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Update can return APISuccess when request success", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.put("$resouce/1", productModel.toJson())).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true, data: productModel.toJson()),
      ),
    );

    var response = await productRemoteSource.update(productModel.toJson(), "1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
    expect(response.resource.data, productModel.toJson());
  });
  test("Update can return APIError when request failed", () async {
    ProductModel productModel = ProductModel(name: "test product", price: 20000);
    when(() => apiProvider.put("$resouce/1", productModel.toJson())).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await productRemoteSource.update(productModel.toJson(), "1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
  test("Delete can return APISuccess when request success", () async {
    when(() => apiProvider.delete("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.success(
        JsonResource(status: true),
      ),
    );

    var response = await productRemoteSource.delete("1");
    expect(response, isA<APISuccess>());
    response as APISuccess;
    expect(response.resource.status, true);
  });
  test("Delete can return APIError when request failed", () async {
    when(() => apiProvider.delete("$resouce/1")).thenAnswer(
      (_) async => await APIResponse.error(AppException.errorWithMessage("error data")),
    );

    var response = await productRemoteSource.delete("1");
    expect(response, isA<APIError>());
    response as APIError;
    expect(response.exception, isA<AppExceptionErrorMessage>());
  });
}
