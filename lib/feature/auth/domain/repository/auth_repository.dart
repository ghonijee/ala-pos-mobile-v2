import 'dart:convert';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/auth/data/remote/auth_remote_source.dart';
import 'package:ala_pos/feature/auth/domain/models/sign_up/sign_up_model.dart';
import 'package:ala_pos/shared/constants/store_key.dart';
import 'package:ala_pos/shared/utils/device_info.dart';
import 'package:ala_pos/shared/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';
import '../models/login/login_model.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.read(authRemoteSourceProvider),
    ref.read(deviceInfoProvider),
    ref.read(localStorageProvider),
  ),
);

class AuthRepository {
  AuthRemoteSource authRemoteSource;
  DeviceInfo deviceInfo;
  LocalStorage localStorage;
  AuthRepository(this.authRemoteSource, this.deviceInfo, this.localStorage);

  Future<Result<LoginModel, AppException>> signIn(String username, String password) async {
    var deviceName = await deviceInfo.deviceName;

    APIResponse response = await authRemoteSource.login(username, password, deviceName);
    late LoginModel userLogin;
    var result = response.when(
      success: (resource) {
        userLogin = LoginModel.fromJson(resource.data);
        var _token = Token(token: userLogin.personalAccessToken);
        // Save Token
        localStorage.store(Constant.token, tokenToJson(_token));
        // Save data User
        localStorage.store(Constant.userModel, jsonEncode(userLogin.userModel.toJson()));
        return userLogin;
      },
      error: (exception) {
        return exception;
      },
    );
    if (result is AppException) {
      return Failure(result);
    }

    return Success(userLogin);
  }

  bool signOut() {
    localStorage.remove(Constant.token);
    localStorage.remove(Constant.userModel);
    return true;
  }

  Future<Result<LoginModel, AppException>> signUp(SignUpModel data) async {
    var deviceName = await deviceInfo.deviceName;
    APIResponse response = await authRemoteSource.register(username: data.username, phone: data.phone, password: data.password, deviceName: deviceName);
    late LoginModel userLogin;
    var result = response.when(
      success: (resource) {
        userLogin = LoginModel.fromJson(resource.data);
        var _token = Token(token: userLogin.personalAccessToken);
        // Save Token
        localStorage.store(Constant.token, tokenToJson(_token));
        // Save data User
        localStorage.store(Constant.userModel, jsonEncode(userLogin.userModel.toJson()));
        return userLogin;
      },
      error: (exception) {
        return exception;
      },
    );
    if (result is AppException) {
      return Failure(result);
    }

    return Success(userLogin);
  }

  Future storeSignUp({required String storeName, required String storeCategoryId, required String phone, required String address}) async {}
}
