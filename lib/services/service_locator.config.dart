// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/auth_remote_source.dart' as _i4;
import '../data/remote/store_remote_source.dart' as _i5;
import '../domain/repositories/auth_repository.dart' as _i7;
import '../domain/repositories/store_repository.dart' as _i6;
import '../presentation/pages/auth/login/cubit/login_cubit.dart' as _i8;
import '../presentation/pages/auth/register/cubit/register_cubit.dart' as _i9;
import '../presentation/pages/auth/store_form/cubit/store_form_cubit.dart'
    as _i12;
import '../presentation/pages/splashscreen/cubit/splash_cubit.dart' as _i11;
import '../presentation/widgets/side_menu/cubit/side_menu_cubit.dart' as _i10;
import 'service_locator.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.ApiClient>(registerModule.apiClient);
  gh.lazySingleton<_i4.AuthRemoteSource>(
      () => _i4.AuthRemoteSource(get<_i3.ApiClient>()));
  gh.singleton<_i3.LocalStorage>(registerModule.localStorage);
  gh.lazySingleton<_i5.StoreRemoteSource>(
      () => _i5.StoreRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i6.StoreRepository>(() => _i6.StoreRepository(
      get<_i5.StoreRemoteSource>(), get<_i3.LocalStorage>()));
  gh.lazySingleton<_i7.AuthRepository>(() => _i7.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i8.LoginCubit>(() =>
      _i8.LoginCubit(get<_i7.AuthRepository>(), get<_i6.StoreRepository>()));
  gh.factory<_i9.RegisterCubit>(
      () => _i9.RegisterCubit(get<_i7.AuthRepository>()));
  gh.factory<_i10.SideMenuCubit>(
      () => _i10.SideMenuCubit(get<_i7.AuthRepository>()));
  gh.factory<_i11.SplashCubit>(
      () => _i11.SplashCubit(authRepository: get<_i7.AuthRepository>()));
  gh.factory<_i12.StoreFormCubit>(
      () => _i12.StoreFormCubit(get<_i6.StoreRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
