import 'package:ala_pos/feature/store/data/remote/store_remote_source.dart';
import 'package:ala_pos/feature/store/domain/models/store/store_model.dart';
import 'package:ala_pos/feature/store/domain/repository/store_repository.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/json/json_resource.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStoreRemoteSource extends Mock implements StoreRemoteSource {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  final LocalStorage localStorage = MockLocalStorage();
  final StoreRemoteSource storeRemoteSource = MockStoreRemoteSource();
  test("Store data return true when success create store", () async {
    StoreModel model = StoreModel(name: "Yunus Store", phone: "081516172799", address: "Jl. merdeka");
    when(
      () => storeRemoteSource.create(phone: model.phone!, address: model.address!, name: model.name),
    ).thenAnswer(
      (_) => Future.value(APIResponse.success(JsonResource(status: true, data: model.toJson()))),
    );
    when(
      () => localStorage.store(Constant.mainStore, any()),
    ).thenAnswer(
      (_) => Future<void>.value(),
    );
    var repository = StoreRepository(storeRemoteSource, localStorage);
    var result = await repository.storeData(model);
    expect(result.isSuccess, true);
    expect(result.success, true);
    verify(
      () => localStorage.store(Constant.mainStore, any()),
    ).called(1);
  });
  test("Store data return AppException when failed create store", () async {
    StoreModel model = StoreModel(name: "Yunus Store", phone: "081516172799", address: "Jl. merdeka");
    when(
      () => storeRemoteSource.create(phone: model.phone!, address: model.address!, name: model.name),
    ).thenAnswer(
      (_) => Future.value(APIResponse.error(AppException.errorWithMessage("Failed"))),
    );
    when(
      () => localStorage.store(Constant.mainStore, any()),
    ).thenAnswer(
      (_) => Future<void>.value(),
    );
    var repository = StoreRepository(storeRemoteSource, localStorage);
    var result = await repository.storeData(model);
    verifyNever(
      () => localStorage.store(Constant.mainStore, any()),
    );
    expect(result.isFailure, true);
    expect(result.failure, isA<AppException>());
    expect((result.failure as AppExceptionErrorMessage).message, "Failed");
  });
}
