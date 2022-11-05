import 'package:ala_pos/feature/auth/domain/repository/auth_repository.dart';
import 'package:ala_pos/feature/user_management/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final logoutProvider = Provider<bool>((ref) {
  AuthRepository authRepository = ref.read(authRepositoryProvider);
  var result = authRepository.signOut();
  return result;
});

final userProfileProvider = FutureProvider(
  (ref) async {
    UserRepository userRepository = ref.read(userRepositoryProvider);
    var userModel = await userRepository.userActive();
    return userModel;
  },
);
