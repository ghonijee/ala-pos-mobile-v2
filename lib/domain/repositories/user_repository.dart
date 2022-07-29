import 'package:ala_pos/data/remote/user_remote_source.dart';
import 'package:ala_pos/domain/models/user/change_password_model.dart';
import 'package:ala_pos/domain/models/user/user_profile_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:core/core.dart';
import 'package:core/resource/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository {
  final UserRemoteSource userRemoteSource;
  LocalStorage storage;
  UserRepository(this.userRemoteSource, this.storage);

  Future<UserModel> get user async {
    var userLogin = await storage.getValueJson(Constant.userLogin);
    return UserModel.fromJson(userLogin);
  }

  Future<Either<FailureModel, UserModel>> userProfile() async {
    try {
      var userLogin = await storage.getValueJson(Constant.userLogin);
      var userModel = UserModel.fromJson(userLogin);
      ApiResponse response = await userRemoteSource.show(userModel.id.toString());

      if (response.status == false) {
        throw Exception(response.message);
      }

      UserModel data = UserModel.fromJson(response.data);

      storage.setValue(Constant.userLogin, data.toJson());

      return Right(data);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> update(UserProfileModel model) async {
    try {
      ApiResponse response = await userRemoteSource.update(model.toJson(), model.id);
      if (response.status == false) {
        throw Exception(response.message);
      }

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }

  Future<Either<FailureModel, ApiResponse>> changePassword(ChangePasswordModel model) async {
    try {
      ApiResponse response = await userRemoteSource.changePassword(model.toJson(), model.id);
      if (response.status! == false) {
        throw Exception(response.message);
      }

      return Right(response);
    } catch (e) {
      return Left(FailureModel.serverError(e.toString()));
    }
  }
}
