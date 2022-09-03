import 'dart:convert';

import 'package:ala_pos/feature/store/data/remote/store_remote_source.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/models/exception/app_exception.dart';
import 'package:ala_pos/shared/models/response/api_response.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:result_type/result_type.dart';

import '../models/store/store_model.dart';

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

  // Future<Either<FailureModel, ApiResponse>> update(StoreModel model) async {
  //   try {
  //     ApiResponse response = await remoteSource.update(model.toJson(), model.id!);

  //     if (!response.status!) {
  //       throw Exception(response.message);
  //     }

  //     storage.setValue(Constant.mainStore, model.toJson());

  //     return Right(response);
  //   } catch (e) {
  //     return Left(FailureModel.serverError(e.toString()));
  //   }
  // }

  // Future<Either<FailureModel, bool>> mainStore() async {
  //   try {
  //     ApiResponse response = await remoteSource.main();

  //     if (response.status! == false) {
  //       throw Exception(response.message);
  //     }

  //     StoreModel data = StoreModel.fromJson(response.data);

  //     storage.setValue(Constant.mainStore, data.toJson());

  //     return Right(true);
  //   } catch (e) {
  //     return Left(FailureModel.serverError(e.toString()));
  //   }
  // }

  // Future<StoreModel> activeStore() async {
  //   var json = await storage.getValueJson(Constant.mainStore);
  //   StoreModel model = StoreModel.fromJson(json);
  //   return model;
  // }

  // List<StoreCategoryModel> getStoreCategory() {
  //   return <StoreCategoryModel>[
  //     StoreCategoryModel(name: "Toko Retail/Kelontong", id: 1),
  //     StoreCategoryModel(name: "Warung/Kafe", id: 2),
  //   ];
  // }
}
