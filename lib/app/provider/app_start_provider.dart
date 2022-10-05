import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/repository/token_repository.dart';
import '../state/app_start_state.dart';

final appStartProvider = StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  return AppStartNotifier(
    const AppStartState.initial(),
    ref.read(tokenRepositoryProvider),
  );
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
    AppStartState appStartState,
    tokenRepository,
  ) : super(appStartState) {
    _init();
    _tokenRepository = tokenRepository;
  }

  late TokenRepository _tokenRepository;

  Future<void> _init() async {
    state = const AppStartState.initial();

    Future.delayed(const Duration(seconds: 3), () async {
      await authCheck();
    });
  }

  Future<void> authCheck() async {
    try {
      final token = await _tokenRepository.fetchToken();
      if (token == null) {
        state = const AppStartState.unauthenticated();
        return;
      }

      // check validate token
      var tokenValid = await _tokenRepository.checkToken();
      if (!tokenValid) {
        state = const AppStartState.unauthenticated();
        return;
      }

      // Set State User Authenticated
      if (mounted) {
        state = const AppStartState.authenticated();
      }
    } on Exception catch (e) {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
