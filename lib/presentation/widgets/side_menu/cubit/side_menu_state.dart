part of 'side_menu_cubit.dart';

@freezed
class SideMenuState with _$SideMenuState {
  const factory SideMenuState.initial() = _Initial;
  const factory SideMenuState.loading() = _Loading;
  const factory SideMenuState.loaded(UserModel userModel, StoreModel storeModel) = _Loaded;
}
