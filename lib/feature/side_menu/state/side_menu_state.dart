import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/domain/models/user/user_model.dart';
import '../../store/domain/models/store/store_model.dart';

part 'side_menu_state.freezed.dart';

@freezed
class SideMenuState with _$SideMenuState {
  const factory SideMenuState.initial() = _Initial;
  const factory SideMenuState.loading() = _Loading;
  const factory SideMenuState.loaded(UserModel userModel, StoreModel storeModel) = _Loaded;
}
