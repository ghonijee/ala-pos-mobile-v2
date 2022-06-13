import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
@module
abstract class RegisterModule {
  // @lazySingleton
  // Dio get dio => Dio();

  @singleton
  LocalStorage get localStorage => LocalStorage();

  @singleton
  ApiClient get apiClient => ApiClient(dio: Dio(), baseUrl: dotenv.get("BASE_URL"));
}

void configureDependencies() {
  initCoreApp();
  $initGetIt(getIt);
}

void initCoreApp() {
  // getIt.registerSingleton(Dio());
  // getIt.registerLazySingleton(() => ApiClient(dio: getIt(), baseUrl: dotenv.get("BASE_URL")));
}
