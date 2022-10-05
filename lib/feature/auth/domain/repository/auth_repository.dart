import 'dart:convert';
import 'package:ala_pos/app/app.dart';
import 'package:ala_pos/feature/auth/data/remote/auth_remote_source.dart';
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
        // Save Token
        localStorage.store(Constant.token, userLogin.personalAccessToken);
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

  Future<bool> signOut() async {
    return true;
  }

  Future signUp({required String username, required String password, required String phone}) async {}
}
