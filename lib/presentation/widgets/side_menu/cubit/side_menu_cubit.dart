import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'side_menu_state.dart';
part 'side_menu_cubit.freezed.dart';

@injectable
class SideMenuCubit extends Cubit<SideMenuState> {
  final AuthRepository authRepository;

  SideMenuCubit(this.authRepository) : super(SideMenuState.initial());

  void getUserProfile() async {
    UserModel userModel = await authRepository.user;
    emit(SideMenuState.loaded(userModel));
  }

  Future<bool> singOut() async {
    await authRepository.signOut();
    return true;
  }
}
