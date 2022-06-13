part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = Loading;
  const factory SplashState.loaded(bool authStatus) = Loaded;
}
