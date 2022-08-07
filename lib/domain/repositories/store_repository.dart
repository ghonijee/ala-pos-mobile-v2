import 'package:ala_pos/data/remote/store_remote_source.dart';
import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StoreRepository {
  StoreRemoteSource remoteSource;
  LocalStorage storage;

  StoreRepository(this.remoteSource, this.storage);

  Future<Either<FailureModel, bool>> storeData(StoreModel model) async {
    try {
      ApiResponse response = await remoteSource.create(
        phone: model.phone!,
        address: model.address!,
        name: model.name,
      );

      if (!response.status!) {
        throw Exception(response.message);
      }

      StoreModel data = StoreModel.fromJson(response.data);

      storage.setValue(Constant.mainStore, data.toJson());

      return Right(true);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> update(StoreModel model) async {
    try {
      ApiResponse response = await remoteSource.update(model.toJson());

      if (!response.status!) {
        throw Exception(response.message);
      }

      storage.setValue(Constant.mainStore, model.toJson());

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, bool>> mainStore() async {
    try {
      ApiResponse response = await remoteSource.main();

      if (response.status! == false) {
        throw Exception(response.message);
      }

      StoreModel data = StoreModel.fromJson(response.data);

      storage.setValue(Constant.mainStore, data.toJson());

      return Right(true);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<StoreModel> activeStore() async {
    var json = await storage.getValueJson(Constant.mainStore);
    StoreModel model = StoreModel.fromJson(json);
    return model;
  }
}
