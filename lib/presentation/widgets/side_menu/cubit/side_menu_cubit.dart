import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'side_menu_state.dart';
part 'side_menu_cubit.freezed.dart';

@injectable
class SideMenuCubit extends Cubit<SideMenuState> {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;

  SideMenuCubit(this.authRepository, this.storeRepository) : super(SideMenuState.initial());

  void getUserProfile() async {
    UserModel userModel = await authRepository.user;
    StoreModel storeModel = await storeRepository.activeStore();
    emit(SideMenuState.loaded(userModel, storeModel));
  }

  Future<bool> singOut() async {
    await authRepository.signOut();
    return true;
  }
}
