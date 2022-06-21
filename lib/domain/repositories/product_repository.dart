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
      {int page = 1, String? searchValue, required int storeId}) async {
    try {
      var filterQuery = FilterBuilder().where(FilterData("store_id", storeId));

      if (searchValue!.isNotEmpty) {
        filterQuery = filterQuery
          ..where(FilterGroup.or([
            FilterData("name", searchValue),
            FilterData("code", searchValue),
          ]));
      }

      ApiResponse response = await remoteSource.paginate(
        page: page.toString(),
        filter: filterQuery.build(),
        take: 15,
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
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }
}
