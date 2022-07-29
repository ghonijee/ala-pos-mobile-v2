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
import '../data/remote/user_remote_source.dart' as _i13;
import '../domain/repositories/auth_repository.dart' as _i15;
import '../domain/repositories/product_repository.dart' as _i7;
import '../domain/repositories/store_repository.dart' as _i10;
import '../domain/repositories/transaction_repository.dart' as _i12;
import '../domain/repositories/user_repository.dart' as _i14;
import '../presentation/pages/auth/login/cubit/login_cubit.dart' as _i20;
import '../presentation/pages/auth/register/cubit/register_cubit.dart' as _i23;
import '../presentation/pages/auth/store_form/cubit/store_form_cubit.dart'
    as _i26;
import '../presentation/pages/pos/cubit/cart/cart_cubit.dart' as _i16;
import '../presentation/pages/pos/cubit/list_product/list_product_cubit.dart'
    as _i19;
import '../presentation/pages/pos/cubit/payment/payment_cubit.dart' as _i5;
import '../presentation/pages/pos/cubit/resume/transaction_resume_cubit.dart'
    as _i30;
import '../presentation/pages/pos/cubit/scan_product/scan_product_cubit.dart'
    as _i8;
import '../presentation/pages/pos/cubit/submit_transaction/submit_transaction_cubit.dart'
    as _i27;
import '../presentation/pages/product/cubit/form/form_product_cubit.dart'
    as _i17;
import '../presentation/pages/product/cubit/master/master_product_cubit.dart'
    as _i21;
import '../presentation/pages/profile/cubit/form_user/form_user_cubit.dart'
    as _i18;
import '../presentation/pages/profile/cubit/user/user_profile_cubit.dart'
    as _i31;
import '../presentation/pages/receipt/cubit/receipt_cubit.dart' as _i22;
import '../presentation/pages/splashscreen/cubit/splash_cubit.dart' as _i25;
import '../presentation/pages/transaction/cubit/transaction_detail/transaction_detail_cubit.dart'
    as _i28;
import '../presentation/pages/transaction/cubit/transaction_list/transaction_list_cubit.dart'
    as _i29;
import '../presentation/widgets/side_menu/cubit/side_menu_cubit.dart' as _i24;
import 'service_locator.dart' as _i32; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.UserRemoteSource>(
      () => _i13.UserRemoteSource(get<_i3.ApiClient>()));
  gh.lazySingleton<_i14.UserRepository>(
      () => _i14.UserRepository(get<_i13.UserRemoteSource>()));
  gh.lazySingleton<_i15.AuthRepository>(() => _i15.AuthRepository(
      remoteSource: get<_i4.AuthRemoteSource>(),
      storage: get<_i3.LocalStorage>()));
  gh.factory<_i16.CartCubit>(() => _i16.CartCubit(get<_i10.StoreRepository>()));
  gh.factory<_i17.FormProductCubit>(() => _i17.FormProductCubit(
      get<_i7.ProductRepository>(),
      get<_i10.StoreRepository>(),
      get<_i15.AuthRepository>()));
  gh.factory<_i18.FormUserCubit>(
      () => _i18.FormUserCubit(get<_i14.UserRepository>()));
  gh.factory<_i19.ListProductCubit>(() => _i19.ListProductCubit(
      get<_i7.ProductRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i20.LoginCubit>(() =>
      _i20.LoginCubit(get<_i15.AuthRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i21.MasterProductCubit>(() => _i21.MasterProductCubit(
      get<_i7.ProductRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i22.ReceiptCubit>(
      () => _i22.ReceiptCubit(get<_i10.StoreRepository>()));
  gh.factory<_i23.RegisterCubit>(
      () => _i23.RegisterCubit(get<_i15.AuthRepository>()));
  gh.factory<_i24.SideMenuCubit>(
      () => _i24.SideMenuCubit(get<_i15.AuthRepository>()));
  gh.factory<_i25.SplashCubit>(
      () => _i25.SplashCubit(authRepository: get<_i15.AuthRepository>()));
  gh.factory<_i26.StoreFormCubit>(
      () => _i26.StoreFormCubit(get<_i10.StoreRepository>()));
  gh.factory<_i27.SubmitTransactionCubit>(
      () => _i27.SubmitTransactionCubit(get<_i12.TransactionRepository>()));
  gh.factory<_i28.TransactionDetailCubit>(
      () => _i28.TransactionDetailCubit(get<_i12.TransactionRepository>()));
  gh.factory<_i29.TransactionListCubit>(() => _i29.TransactionListCubit(
      get<_i12.TransactionRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i30.TransactionResumeCubit>(() => _i30.TransactionResumeCubit(
      get<_i15.AuthRepository>(), get<_i10.StoreRepository>()));
  gh.factory<_i31.UserProfileCubit>(() => _i31.UserProfileCubit(
      get<_i10.StoreRepository>(), get<_i15.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i32.RegisterModule {}
