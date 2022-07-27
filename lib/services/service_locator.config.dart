// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/auth_remote_source.dart' as _i4;
import '../data/remote/product_remote_source.dart' as _i6;
import '../data/remote/store_remote_source.dart' as _i9;
import '../data/remote/transaction_remote_source.dart' as _i11;
import '../domain/repositories/auth_repository.dart' as _i13;
import '../domain/repositories/product_repository.dart' as _i7;
import '../domain/repositories/store_repository.dart' as _i10;
import '../domain/repositories/transaction_repository.dart' as _i12;
import '../presentation/pages/auth/login/cubit/login_cubit.dart' as _i17;
import '../presentation/pages/auth/register/cubit/register_cubit.dart' as _i20;
import '../presentation/pages/auth/store_form/cubit/store_form_cubit.dart'
    as _i23;
import '../presentation/pages/pos/cubit/cart/cart_cubit.dart' as _i14;
import '../presentation/pages/pos/cubit/list_product/list_product_cubit.dart'
    as _i16;
import '../presentation/pages/pos/cubit/payment/payment_cubit.dart' as _i5;
import '../presentation/pages/pos/cubit/resume/transaction_resume_cubit.dart'
    as _i27;
import '../presentation/pages/pos/cubit/scan_product/scan_product_cubit.dart'
    as _i8;
import '../presentation/pages/pos/cubit/submit_transaction/submit_transaction_cubit.dart'
    as _i24;
import '../presentation/pages/product/cubit/form/form_product_cubit.dart'
    as _i15;
import '../presentation/pages/product/cubit/master/master_product_cubit.dart'
    as _i18;
import '../presentation/pages/receipt/cubit/receipt_cubit.dart' as _i19;
import '../presentation/pages/splashscreen/cubit/splash_cubit.dart' as _i22;
import '../presentation/pages/transaction/cubit/transaction_detail/transaction_detail_cubit.dart'
    as _i25;
import '../presentation/pages/transaction/cubit/transaction_list/transaction_list_cubit.dart'
    as _i26;
import '../presentation/widgets/side_menu/cubit/side_menu_cubit.dart' as _i21;
import 'service_locator.dart' as _i28; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.PaymentCubit>(() => _i5.PaymentCubit());
  gh.lazySingleton<_i6.ProductRemoteSource>(
      () => _i6.ProductRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i7.ProductRepository>(
      () => _i7.ProductRepository(get<_i6.ProductRemoteSource>()));
  gh.factory<_i8.ScanProductCubit>(
      () => _i8.ScanProductCubit(get<_i7.ProductRepository>()));
  gh.lazySingleton<_i9.StoreRemoteSource>(
      () => _i9.StoreRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i10.StoreRepository>(() => _i10.StoreRepository(
      get<_i9.StoreRemoteSource>(), get<_i3.LocalStorage>()));
  gh.lazySingleton<_i11.TransactionRemoteSource>(
      () => _i11.TransactionRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i12.TransactionRepository>(
      () => _i12.TransactionRepository(get<_i11.TransactionRemoteSource>()));
  gh.lazySingleton<_i13.AuthRepository>(() => _i13.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i14.CartCubit>(() => _i14.CartCubit(get<_i10.StoreRepository>()));
  gh.factory<_i15.FormProductCubit>(() => _i15.FormProductCubit(
      get<_i7.ProductRepository>(),
      get<_i10.StoreRepository>(),
      get<_i13.AuthRepository>()));
  gh.factory<_i16.ListProductCubit>(() => _i16.ListProductCubit(
      get<_i7.ProductRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i17.LoginCubit>(() =>
      _i17.LoginCubit(get<_i13.AuthRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i18.MasterProductCubit>(() => _i18.MasterProductCubit(
      get<_i7.ProductRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i19.ReceiptCubit>(
      () => _i19.ReceiptCubit(get<_i10.StoreRepository>()));
  gh.factory<_i20.RegisterCubit>(
      () => _i20.RegisterCubit(get<_i13.AuthRepository>()));
  gh.factory<_i21.SideMenuCubit>(
      () => _i21.SideMenuCubit(get<_i13.AuthRepository>()));
  gh.factory<_i22.SplashCubit>(
      () => _i22.SplashCubit(authRepository: get<_i13.AuthRepository>()));
  gh.factory<_i23.StoreFormCubit>(
      () => _i23.StoreFormCubit(get<_i10.StoreRepository>()));
  gh.factory<_i24.SubmitTransactionCubit>(
      () => _i24.SubmitTransactionCubit(get<_i12.TransactionRepository>()));
  gh.factory<_i25.TransactionDetailCubit>(
      () => _i25.TransactionDetailCubit(get<_i12.TransactionRepository>()));
  gh.factory<_i26.TransactionListCubit>(() => _i26.TransactionListCubit(
      get<_i12.TransactionRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i27.TransactionResumeCubit>(() => _i27.TransactionResumeCubit(
      get<_i13.AuthRepository>(), get<_i10.StoreRepository>()));
  return get;
}

class _$RegisterModule extends _i28.RegisterModule {}
