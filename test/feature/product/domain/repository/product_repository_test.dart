import 'package:ala_pos/feature/product/data/remote/product_remote_source.dart';
import 'package:ala_pos/feature/product/domain/models/product/product_model.dart';
import 'package:ala_pos/feature/product/domain/repository/product_repository.dart';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/shared/utils/fiter_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteSource extends Mock implements ProductRemoteSource {}

void main() {
  ProductRemoteSource remoteSource = MockProductRemoteSource();
  late ProductRepository productRepository;

  setUp(() {
    productRepository = ProductRepository(remoteSource);
  });

  test("Get list ProductModel with paginate when success request", () async {
    var filterQuery = FilterBuilder().where(FilterData("store_id", 1));
    var jsonData = [ProductModel(name: "test1", price: 1000).toJson(), ProductModel(name: "test2", price: 2000).toJson()];
    when(() => remoteSource.paginate(
          page: 1,
          take: 2,
          sortBy: "name",
          desc: true,
          filter: filterQuery.build(),
        )).thenAnswer((invocation) async => APIResponse.success(
          JsonResource(status: true, data: jsonData),
        ));

    var result = await productRepository.paginate(
      page: 1,
      take: 2,
      sortBy: "name",
      desc: true,
      storeId: 1,
    );

    expect(result.isSuccess, true);
    expect(result.success.length, jsonData.length);
  });
  test("Return AppException when list paginate failed request", () async {
    var filterQuery = FilterBuilder().where(FilterData("store_id", 1));
    when(() => remoteSource.paginate(
          page: 1,
          take: 2,
          sortBy: "name",
          desc: true,
          filter: filterQuery.build(),
        )).thenAnswer((invocation) async => APIResponse.error(
          AppException.errorWithMessage("SQL Error"),
        ));

    var result = await productRepository.paginate(
      page: 1,
      take: 2,
      sortBy: "name",
      desc: true,
      storeId: 1,
    );

    expect(result.isFailure, true);
    var exception = result.failure as AppExceptionErrorMessage;
    expect(exception.message, "SQL Error");
  });

  test("Create return bool when request success", () async {
    ProductModel model = ProductModel(name: "test1", price: 1000);
    when(() => remoteSource.create(model.toJson())).thenAnswer((invocation) async => APIResponse.success(JsonResource(status: true, data: model.toJson())));
    var result = await productRepository.create(model);

    expect(result.isSuccess, true);
    expect(result.success, isA<bool>());
    expect(result.success, true);
  });
  test("Create return AppException when request error", () async {
    ProductModel model = ProductModel(name: "test1", price: 1000);
    when(() => remoteSource.create(model.toJson())).thenAnswer((invocation) async => APIResponse.error(AppException.errorWithMessage("error")));
    var result = await productRepository.create(model);

    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });
  test("Update return bool when request success", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.update(model.toJson(), model.id.toString())).thenAnswer((invocation) async => APIResponse.success(JsonResource(status: true, data: model.toJson())));
    var result = await productRepository.update(model);

    expect(result.isSuccess, true);
    expect(result.success, isA<bool>());
    expect(result.success, true);
  });
  test("Update return AppException when request error", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.update(model.toJson(), model.id.toString())).thenAnswer((invocation) async => APIResponse.error(AppException.errorWithMessage("error")));
    var result = await productRepository.update(model);

    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });
  test("delete return bool when request success", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.delete(model.id.toString())).thenAnswer((invocation) async => APIResponse.success(JsonResource(status: true)));
    var result = await productRepository.delete(model);

    expect(result.isSuccess, true);
    expect(result.success, isA<bool>());
    expect(result.success, true);
  });
  test("delete return AppException when request error", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.delete(model.id.toString())).thenAnswer((invocation) async => APIResponse.error(AppException.errorWithMessage("error")));
    var result = await productRepository.delete(model);

    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });
  test("Show data return bool when request success", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.show(model.id.toString())).thenAnswer((invocation) async => APIResponse.success(JsonResource(status: true, data: model.toJson())));
    var result = await productRepository.show(model.id.toString());

    expect(result.isSuccess, true);
    expect(result.success, isA<ProductModel>());
    expect(result.success.id, model.id);
  });
  test("Show data return AppException when request error", () async {
    ProductModel model = ProductModel(id: 1, name: "test1", price: 1000);
    when(() => remoteSource.show(model.id.toString())).thenAnswer((invocation) async => APIResponse.error(AppException.errorWithMessage("error")));
    var result = await productRepository.show(model.id.toString());

    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });

  test("Scan data return bool when request success", () async {
    ProductModel model = ProductModel(id: 1, code: "code", name: "test1", price: 1000);
    when(() => remoteSource.show(model.id.toString())).thenAnswer((invocation) async => APIResponse.success(JsonResource(status: true, data: model.toJson())));
    var result = await productRepository.scan(model.id.toString());

    expect(result.isSuccess, true);
    expect(result.success, isA<ProductModel>());
    expect(result.success.id, model.id);
  });
  test("Scan data return AppException when request error", () async {
    ProductModel model = ProductModel(id: 1, code: "code", name: "test1", price: 1000);
    when(() => remoteSource.show(model.code!)).thenAnswer((invocation) async => APIResponse.error(AppException.errorWithMessage("error")));
    var result = await productRepository.show(model.code!);

    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
  });
}
