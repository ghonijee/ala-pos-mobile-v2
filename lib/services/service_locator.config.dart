// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/auth_remote_source.dart' as _i4;
import '../data/remote/product_remote_source.dart' as _i8;
import '../data/remote/store_remote_source.dart' as _i10;
import '../domain/repositories/auth_repository.dart' as _i13;
import '../domain/repositories/product_repository.dart' as _i9;
import '../domain/repositories/store_repository.dart' as _i11;
import '../presentation/pages/auth/login/cubit/login_cubit.dart' as _i15;
import '../presentation/pages/auth/register/cubit/register_cubit.dart' as _i17;
import '../presentation/pages/auth/store_form/cubit/store_form_cubit.dart'
    as _i20;
import '../presentation/pages/pos/cubit/cart/cart_cubit.dart' as _i5;
import '../presentation/pages/pos/cubit/list_product/list_product_cubit.dart'
    as _i14;
import '../presentation/pages/pos/cubit/payment/payment_cubit.dart' as _i7;
import '../presentation/pages/pos/cubit/resume/transaction_resume_cubit.dart'
    as _i21;
import '../presentation/pages/pos/cubit/submit_transaction/submit_transaction_cubit.dart'
    as _i12;
import '../presentation/pages/product/cubit/form/form_product_cubit.dart'
    as _i6;
import '../presentation/pages/product/cubit/master/master_product_cubit.dart'
    as _i16;
import '../presentation/pages/splashscreen/cubit/splash_cubit.dart' as _i19;
import '../presentation/widgets/side_menu/cubit/side_menu_cubit.dart' as _i18;
import 'service_locator.dart' as _i22; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.FormProductCubit>(() => _i6.FormProductCubit());
  gh.singleton<_i3.LocalStorage>(registerModule.localStorage);
  gh.factory<_i7.PaymentCubit>(() => _i7.PaymentCubit());
  gh.lazySingleton<_i8.ProductRemoteSource>(
      () => _i8.ProductRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i9.ProductRepository>(
      () => _i9.ProductRepository(get<_i8.ProductRemoteSource>()));
  gh.lazySingleton<_i10.StoreRemoteSource>(
      () => _i10.StoreRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i11.StoreRepository>(() => _i11.StoreRepository(
      get<_i10.StoreRemoteSource>(), get<_i3.LocalStorage>()));
  gh.factory<_i12.SubmitTransactionCubit>(() => _i12.SubmitTransactionCubit());
  gh.lazySingleton<_i13.AuthRepository>(() => _i13.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i14.ListProductCubit>(() => _i14.ListProductCubit(
      get<_i9.ProductRepository>(), get<_i11.StoreRepository>()));
  gh.factory<_i15.LoginCubit>(() =>
      _i15.LoginCubit(get<_i13.AuthRepository>(), get<_i11.StoreRepository>()));
  gh.factory<_i16.MasterProductCubit>(() => _i16.MasterProductCubit(
      get<_i9.ProductRepository>(), get<_i11.StoreRepository>()));
  gh.factory<_i17.RegisterCubit>(
      () => _i17.RegisterCubit(get<_i13.AuthRepository>()));
  gh.factory<_i18.SideMenuCubit>(
      () => _i18.SideMenuCubit(get<_i13.AuthRepository>()));
  gh.factory<_i19.SplashCubit>(
      () => _i19.SplashCubit(authRepository: get<_i13.AuthRepository>()));
  gh.factory<_i20.StoreFormCubit>(
      () => _i20.StoreFormCubit(get<_i11.StoreRepository>()));
  gh.factory<_i21.TransactionResumeCubit>(() => _i21.TransactionResumeCubit(
      get<_i13.AuthRepository>(), get<_i11.StoreRepository>()));
  return get;
}

class _$RegisterModule extends _i22.RegisterModule {}
