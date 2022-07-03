// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/auth_remote_source.dart' as _i4;
import '../data/remote/product_remote_source.dart' as _i6;
import '../data/remote/store_remote_source.dart' as _i8;
import '../domain/repositories/auth_repository.dart' as _i10;
import '../domain/repositories/product_repository.dart' as _i7;
import '../domain/repositories/store_repository.dart' as _i9;
import '../presentation/pages/auth/login/cubit/login_cubit.dart' as _i12;
import '../presentation/pages/auth/register/cubit/register_cubit.dart' as _i13;
import '../presentation/pages/auth/store_form/cubit/store_form_cubit.dart'
    as _i16;
import '../presentation/pages/pos/cubit/cart/cart_cubit.dart' as _i5;
import '../presentation/pages/pos/cubit/list_product/list_product_cubit.dart'
    as _i11;
import '../presentation/pages/pos/cubit/resume/transaction_resume_cubit.dart'
    as _i17;
import '../presentation/pages/splashscreen/cubit/splash_cubit.dart' as _i15;
import '../presentation/widgets/side_menu/cubit/side_menu_cubit.dart' as _i14;
import 'service_locator.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.ApiClient>(registerModule.apiClient);
  gh.lazySingleton<_i4.AuthRemoteSource>(
      () => _i4.AuthRemoteSource(get<_i3.ApiClient>()));
  gh.factory<_i5.CartCubit>(() => _i5.CartCubit());
  gh.singleton<_i3.LocalStorage>(registerModule.localStorage);
  gh.lazySingleton<_i6.ProductRemoteSource>(
      () => _i6.ProductRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i7.ProductRepository>(
      () => _i7.ProductRepository(get<_i6.ProductRemoteSource>()));
  gh.lazySingleton<_i8.StoreRemoteSource>(
      () => _i8.StoreRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i9.StoreRepository>(() => _i9.StoreRepository(
      get<_i8.StoreRemoteSource>(), get<_i3.LocalStorage>()));
  gh.lazySingleton<_i10.AuthRepository>(() => _i10.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i11.ListProductCubit>(() => _i11.ListProductCubit(
      get<_i7.ProductRepository>(), get<_i9.StoreRepository>()));
  gh.factory<_i12.LoginCubit>(() =>
      _i12.LoginCubit(get<_i10.AuthRepository>(), get<_i9.StoreRepository>()));
  gh.factory<_i13.RegisterCubit>(
      () => _i13.RegisterCubit(get<_i10.AuthRepository>()));
  gh.factory<_i14.SideMenuCubit>(
      () => _i14.SideMenuCubit(get<_i10.AuthRepository>()));
  gh.factory<_i15.SplashCubit>(
      () => _i15.SplashCubit(authRepository: get<_i10.AuthRepository>()));
  gh.factory<_i16.StoreFormCubit>(
      () => _i16.StoreFormCubit(get<_i9.StoreRepository>()));
  gh.factory<_i17.TransactionResumeCubit>(() => _i17.TransactionResumeCubit(
      get<_i10.AuthRepository>(), get<_i9.StoreRepository>()));
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {}
