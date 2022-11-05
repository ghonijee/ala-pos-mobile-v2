import 'dart:convert';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/store/data/remote/store_remote_source.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';

import '../models/store/store_model.dart';

final storeRepositoryProvider = Provider((ref) => StoreRepository(ref.read(storeRemoteSourceProvider), ref.read(localStorageProvider)));

class StoreRepository {
  StoreRemoteSource storeRemoteSource;
  LocalStorage localStorage;
  StoreRepository(this.storeRemoteSource, this.localStorage);

  Future<Result<bool, AppException>> storeData(StoreModel model) async {
    try {
      APIResponse response = await storeRemoteSource.create(
        phone: model.phone!,
        address: model.address!,
        name: model.name,
      );

      if (response is APIError) {
        throw response.exception;
      }
      response as APISuccess;
      StoreModel data = StoreModel.fromJson(response.resource.data);

      localStorage.store(Constant.mainStore, jsonEncode(data.toJson()));

      return Success(true);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, AppException>> update(StoreModel model) async {
    try {
      APIResponse response = await storeRemoteSource.update(model.toJson(), model.id!);

      if (response is APIError) {
        throw response.exception;
      }
      response as APISuccess;
      localStorage.store(Constant.mainStore, jsonEncode(model.toJson()));

      return Success(response.resource.status);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, AppException>> mainStore() async {
    try {
      APIResponse response = await storeRemoteSource.main();

      if (response is APIError) {
        throw response.exception;
      }
      response as APISuccess;

      StoreModel data = StoreModel.fromJson(response.resource.data);

      localStorage.store(Constant.mainStore, jsonEncode(data.toJson()));

      return Success(true);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<StoreModel?> activeStore() async {
    var jsonEncode = await localStorage.read(Constant.mainStore);
    if (jsonEncode == null) {
      return null;
    }
    Map<String, dynamic> json = jsonDecode(jsonEncode);
    StoreModel model = StoreModel.fromJson(json);
    return model;
  }
}
