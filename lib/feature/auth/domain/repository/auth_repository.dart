import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:result_type/result_type.dart';

import '../models/user/user_model.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository {
  Future<bool> signOut() async {
    return true;
  }

  Future signIn(String username, String password) async {}

  Future signUp({required String username, required String password, required String phone}) async {}
}
