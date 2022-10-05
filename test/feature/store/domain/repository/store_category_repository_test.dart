import 'dart:convert';

import 'package:ala_pos/feature/store/data/remote/store_category_remote_source.dart';
import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/feature/store/domain/repository/store_category_repository.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStoreCategoryRemoteSource extends Mock implements StoreCategoryRemoteSource {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  StoreCategoryRemoteSource remoteSource = MockStoreCategoryRemoteSource();
  LocalStorage localStorage = MockLocalStorage();
  test("Can init list from remote and save to local with return TRUE", () async {
    var storeModelList = [StoreCategoryModel(id: 1, name: "Test-category").toJson(), StoreCategoryModel(id: 1, name: "Test-category").toJson()];
    when(
      () => remoteSource.all(),
    ).thenAnswer((_) => Future.value(APIResponse.success(JsonResource(status: true, data: storeModelList))));
    when(
      () => localStorage.store(Constant.storeCategoryList, any()),
    ).thenAnswer((_) => Future<void>.value());
    var repository = StoreCategoryRepository(localStorage, remoteSource);

    var result = await repository.initFromRemote();
    expect(result.isSuccess, true);
    expect(result.success, true);
    verify(() => localStorage.store(Constant.storeCategoryList, any())).called(1);
  });

  test("Failed init list from remote with return AppException", () async {
    var storeModelList = [StoreCategoryModel(id: 1, name: "Test-category").toJson(), StoreCategoryModel(id: 1, name: "Test-category").toJson()];
    when(
      () => remoteSource.all(),
    ).thenAnswer((_) => Future.value(APIResponse.error(AppException.errorWithMessage("Failed"))));
    var repository = StoreCategoryRepository(localStorage, remoteSource);

    var result = await repository.initFromRemote();
    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
    verifyNever(() => localStorage.store(Constant.storeCategoryList, any()));
  });

  test("Can get list store category model from local Storage", () async {
    var storeModelList = [StoreCategoryModel(id: 1, name: "Test-category").toJson(), StoreCategoryModel(id: 1, name: "Test-category").toJson()];
    when(
      () => localStorage.read(Constant.storeCategoryList),
    ).thenAnswer((_) => Future<String?>.value(jsonEncode(storeModelList)));
    var repository = StoreCategoryRepository(localStorage, remoteSource);

    var result = await repository.getList();
    List<StoreCategoryModel> listExpected = storeModelList.map((e) => StoreCategoryModel.fromJson(e as Map<String, dynamic>)).toList();

    expect(result, listExpected);
    verify(() => localStorage.read(Constant.storeCategoryList)).called(1);
  });

  test("Can get list store category model from local Storage with return Empty List", () async {
    when(
      () => localStorage.read(Constant.storeCategoryList),
    ).thenAnswer((_) => Future<String?>.value(null));
    var repository = StoreCategoryRepository(localStorage, remoteSource);

    var result = await repository.getList();
    expect(result, List<StoreCategoryModel>.empty());
    verify(() => localStorage.read(Constant.storeCategoryList)).called(1);
  });
}
