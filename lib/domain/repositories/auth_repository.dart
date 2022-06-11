import 'package:ala_pos/data/remote/auth_remote_source.dart';
import 'package:ala_pos/domain/models/auth_model.dart';
import 'package:core/core.dart';
import 'package:core/helpers/constant.dart';
import 'package:core/resource/failure_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  AuthRemoteSource remoteSource;
  LocalStorage storage;
  AuthRepository({required this.remoteSource, required this.storage});

  Future<Either<FailureModel, AuthModel>> checkToken() async {
    try {
      if (storage.getValue(Constant.token) == null) {
        return Right(AuthModel(loggedStatus: false));
      }
      var response = await remoteSource.checkToken();
      if (response.status == true) {
        return Right(AuthModel(
          loggedStatus: true,
        ));
      }

      return Right(AuthModel(loggedStatus: false));
    } on DioError catch (e) {
      return Left(FailureModel.serverError(e.message));
    } catch (e) {
      return Left(FailureModel.internalError(e.toString()));
    }
  }
}
