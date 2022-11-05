import 'dart:convert';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/store/data/remote/store_category_remote_source.dart';
import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';

final storeCategoryRepositoryProvider = Provider((ref) => StoreCategoryRepository(ref.read(localStorageProvider), ref.read(storeCategoryRemoteSourceProvider)));

class StoreCategoryRepository {
  LocalStorage localStorage;
  StoreCategoryRemoteSource storeCategoryRemoteSource;
  StoreCategoryRepository(this.localStorage, this.storeCategoryRemoteSource);

  Future<Result<bool, AppException>> initFromRemote() async {
    try {
      var response = await storeCategoryRemoteSource.all();
      if (response is APIError) {
        throw response.exception;
      }
      response as APISuccess;
      localStorage.store(Constant.storeCategoryList, jsonEncode(response.resource.data));
      return Success(true);
    } on AppException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppException.error());
    }
  }

  Future<Result<List<StoreCategoryModel>, AppException>> getRemoteList() async {
    try {
      var response = await storeCategoryRemoteSource.all();
      if (response is APIError) {
        throw response.exception;
      }
      response as APISuccess;
      List<StoreCategoryModel> listCategory = storeCategoryFromStringDecode(response.resource.data);

      return Success(listCategory);
    } on AppException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppException.errorWithMessage("Fetch data error"));
    }
  }

  Future<List<StoreCategoryModel>> getList() async {
    var jsonEncodeList = await localStorage.read(Constant.storeCategoryList);
    if (jsonEncodeList == null) {
      return List<StoreCategoryModel>.empty();
    }
    var json = jsonDecode(jsonEncodeList);
    List<StoreCategoryModel> listCategory = storeCategoryFromStringDecode(json);
    return listCategory;
  }
}
