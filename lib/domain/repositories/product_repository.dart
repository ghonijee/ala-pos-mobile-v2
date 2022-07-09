import 'package:ala_pos/data/remote/product_remote_source.dart';
import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:core/core.dart';
import 'package:core/utils/fiter_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductRepository {
  final ProductRemoteSource remoteSource;
  ProductRepository(this.remoteSource);

  Future<Either<FailureModel, List<ProductModel>>> list(
      {int page = 1, int take = 15, String? searchValue, required int storeId}) async {
    try {
      var filterQuery = FilterBuilder().where(FilterData("store_id", storeId));

      if (searchValue!.isNotEmpty) {
        filterQuery = filterQuery
          ..where(FilterGroup.or([
            FilterData("name", searchValue, conjunction: 'contains'),
            FilterData("code", searchValue, conjunction: 'contains'),
          ]));
      }

      ApiResponse response = await remoteSource.paginate(
        page: page.toString(),
        filter: filterQuery.build(),
        take: take,
        sortBy: 'name',
      );

      if (!response.status!) {
        throw Exception(response.message);
      }
      List<ProductModel> data = <ProductModel>[];

      for (var item in response.data) {
        ProductModel model = ProductModel.fromJson(item);
        data.add(model);
      }

      return Right(data);
    } catch (e, stacktrace) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> create(ProductModel model) async {
    //
    try {
      ApiResponse response = await remoteSource.create(model.toJson());
      if (response.status! == false) {
        throw Exception(response.message);
      }

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> update(ProductModel model) async {
    try {
      ApiResponse response = await remoteSource.update(model.toJson(), model.id);
      if (response.status! == false) {
        throw Exception(response.message);
      }

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }
}
