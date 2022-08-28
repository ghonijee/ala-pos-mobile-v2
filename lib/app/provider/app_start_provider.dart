import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/repository/token_repository.dart';
import '../state/app_start_state.dart';

final appStartProvider = StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  return AppStartNotifier(
    const AppStartState.initial(),
    ref.read,
  );
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
    AppStartState appStartState,
    this._reader,
  ) : super(appStartState) {
    _init();
  }

  late final TokenRepository _tokenRepository = _reader(tokenRepositoryProvider);
  final Reader _reader;

  Future<void> _init() async {
    Future.delayed(const Duration(seconds: 3), () async {
      await authCheck();
    });
  }

  Future<void> authCheck() async {
    try {
      final token = await _tokenRepository.fetchToken();
      if (token == null) {
        throw new Exception("Token not found");
      }

      // check validate token
      var tokenValid = await _tokenRepository.checkToken();
      if (!tokenValid) {
        throw new Exception("Token invalid");
      }

      // Set State User Authenticated
      if (mounted) {
        state = const AppStartState.authenticated();
      }
    } catch (e) {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
