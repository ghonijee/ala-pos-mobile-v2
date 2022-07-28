import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

@injectable
class UserProfileCubit extends Cubit<UserProfileState> {
  StoreRepository storeRepository;
  AuthRepository authRepository;

  UserProfileCubit(
    this.storeRepository,
    this.authRepository,
  ) : super(UserProfileState.initial());

  load() async {
    try {
      emit(UserProfileState.loading());
      var store = await storeRepository.activeStore();
      var user = await authRepository.user;
      emit(UserProfileState.success(user, store));
    } catch (e) {
      emit(UserProfileState.failed(e.toString()));
    }
  }

  Future<bool> signOut() async {
    await authRepository.signOut();
    return true;
  }
}
