import 'package:ala_pos/data/remote/user_remote_source.dart';
import 'package:ala_pos/domain/models/user/change_password_model.dart';
import 'package:ala_pos/domain/models/user/user_profile_model.dart';
import 'package:core/core.dart';
import 'package:core/resource/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository {
  final UserRemoteSource userRemoteSource;
  UserRepository(this.userRemoteSource);

  Future<Either<FailureModel, ApiResponse>> update(UserProfileModel model) async {
    try {
      ApiResponse response = await userRemoteSource.update(model.toJson(), model.id);
      if (response.status! == false) {
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
