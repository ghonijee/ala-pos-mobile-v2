import 'package:ala_pos/data/remote/transaction_remote_source.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:core/core.dart';
import 'package:core/utils/fiter_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TransactionRepository {
  TransactionRemoteSource remoteSource;
  TransactionRepository(this.remoteSource);

  Future<Either<FailureModel, List<TransactionModel>>> list(
      {int page = 1, int take = 15, String? searchValue, required int storeId}) async {
    try {
      var filterQuery = FilterBuilder().where(FilterData("store_id", storeId));

      ApiResponse response = await remoteSource.paginate(
        page: page.toString(),
        filter: filterQuery.build(),
        take: take,
        sortBy: 'date',
        desc: true,
      );

      if (!response.status!) {
        throw Exception(response.message);
      }
      List<TransactionModel> data = <TransactionModel>[];

      for (var item in response.data) {
        TransactionModel model = TransactionModel.fromJson(item);
        data.add(model);
      }

      return Right(data);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> storeData(TransactionModel model) async {
    try {
      ApiResponse response = await remoteSource.create(model.toJson());

      if (!response.status!) {
        throw Exception(response.message);
      }

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }
}
