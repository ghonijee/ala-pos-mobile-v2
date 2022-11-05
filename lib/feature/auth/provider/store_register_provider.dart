import 'package:ala_pos/feature/auth/domain/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/store/store_register_state.dart';

final storeRegisterProvider = StateNotifierProvider<StoreRegisterNotifier, StoreRegisterState>(
  (ref) => StoreRegisterNotifier(
    ref.read(
      authRepositoryProvider,
    ),
  ),
);

class StoreRegisterNotifier extends StateNotifier<StoreRegisterState> {
  final AuthRepository authRepository;
  StoreRegisterNotifier(this.authRepository) : super(StoreRegisterState());

  //
}
