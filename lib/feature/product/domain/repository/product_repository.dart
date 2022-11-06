import 'dart:convert';

import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/product/domain/models/product/product_model.dart';
import 'package:ala_pos/shared/utils/fiter_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';

import '../../data/remote/product_remote_source.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository(ref.read(productRemoteSourceProvider)));

class ProductRepository {
  final ProductRemoteSource remoteSource;
  ProductRepository(this.remoteSource);

  Future<Result<List<ProductModel>, AppException>> paginate({
    int page = 1,
    int take = 15,
    String? searchValue,
    String sortBy = "name",
    bool desc = true,
    required int storeId,
  }) async {
    try {
      var filterQuery = FilterBuilder().where(FilterData("store_id", storeId));

      if (searchValue != null && searchValue.isNotEmpty) {
        filterQuery = filterQuery
          ..where(FilterGroup.or([
            FilterData("name", searchValue, conjunction: 'contains'),
            FilterData("code", searchValue, conjunction: 'contains'),
          ]));
      }
      var result = await remoteSource.paginate(
        page: page,
        take: take,
        sortBy: sortBy,
        desc: desc,
        filter: filterQuery.build(),
      );

      if (result is APIError) {
        throw result.exception;
      }

      result as APISuccess;
      List<ProductModel> list = <ProductModel>[];
      if (result.resource.data != null) {
        list = productFromJsonList(result.resource.data);
      }
      return Success(list);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<String, AppException>> count({
    int page = 1,
    int take = 15,
    String? searchValue,
    String sortBy = "name",
    bool desc = true,
    required int storeId,
  }) async {
    try {
      var filterQuery = FilterBuilder().where(FilterData("store_id", storeId));

      if (searchValue != null && searchValue.isNotEmpty) {
        filterQuery = filterQuery
          ..where(FilterGroup.or([
            FilterData("name", searchValue, conjunction: 'contains'),
            FilterData("code", searchValue, conjunction: 'contains'),
          ]));
      }
      var result = await remoteSource.count(
        page: page,
        take: take,
        sortBy: sortBy,
        desc: desc,
        filter: filterQuery.build(),
      );

      if (result is APIError) {
        throw result.exception;
      }

      result as APISuccess;

      return Success(result.resource.data);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, AppException>> create(ProductModel model) async {
    try {
      var result = await remoteSource.create(model.toJson());
      if (result is APIError) {
        throw result.exception;
      }
      result as APISuccess;
      return Success(result.resource.status);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, AppException>> update(ProductModel model) async {
    try {
      var result = await remoteSource.update(model.toJson(), model.id.toString());
      if (result is APIError) {
        throw result.exception;
      }
      result as APISuccess;
      return Success(result.resource.status);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, AppException>> delete(ProductModel model) async {
    try {
      var result = await remoteSource.delete(model.id.toString());
      if (result is APIError) {
        throw result.exception;
      }
      result as APISuccess;
      return Success(result.resource.status);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<ProductModel, AppException>> show(String key) async {
    try {
      var result = await remoteSource.show(key);
      if (result is APIError) {
        throw result.exception;
      }
      result as APISuccess;
      var product = ProductModel.fromJson(result.resource.data);

      return Success(product);
    } on AppException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<ProductModel, AppException>> scan(String key) async {
    try {
      var result = await remoteSource.show(key);
      if (result is APIError) {
        throw result.exception;
      }
      result as APISuccess;
      var product = ProductModel.fromJson(result.resource.data);

      return Success(product);
    } on AppException catch (e) {
      return Failure(e);
    }
  }
}
