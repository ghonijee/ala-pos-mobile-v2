// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/core.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/auth_remote_source.dart' as _i4;
import '../domain/repositories/auth_repository.dart' as _i6;
import '../presentation/splashscreen/cubit/splash_cubit.dart' as _i7;
import 'service_locator.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiClient>(() => registerModule.apiClient);
  gh.singleton<_i4.AuthRemoteSource>(
      _i4.AuthRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio);
  gh.singleton<_i3.LocalStorage>(registerModule.localStorage);
  gh.lazySingleton<_i6.AuthRepository>(() => _i6.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i7.SplashCubit>(
      () => _i7.SplashCubit(authRepository: get<_i6.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
