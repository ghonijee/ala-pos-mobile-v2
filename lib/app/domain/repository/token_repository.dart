import 'package:ala_pos/app/data/token_remote_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/constants/store_key.dart';
import '../../../shared/utils/platform_type.dart';
import '../models/token/token.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();
  Future<void> saveToken(Token token);
  Future<Token?> fetchToken();
  Future<bool> checkToken();
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref.read(platformTypeProvider), ref.read(tokenRemoteSourceProvider));
});

class TokenRepository implements TokenRepositoryProtocol {
  TokenRepository(platformType, tokenRemoteSource) {
    _platform = platformType;
    _tokenRemoteSource = tokenRemoteSource;
  }

  late PlatformType _platform;
  late TokenRemoteSource _tokenRemoteSource;
  Token? _token;

  @override
  Future<void> remove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: Constant.token);
      } on Exception catch (e) {}
    } else {
      await prefs.remove(Constant.token);
    }

    await prefs.remove(Constant.userModel);
  }

  @override
  Future<void> saveToken(Token token) async {
    final prefs = await SharedPreferences.getInstance();
    _token = token;
    if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(key: Constant.token, value: tokenToJson(token));
      } on Exception catch (e) {}
    } else {
      await prefs.setString(Constant.token, tokenToJson(token));
    }
  }

  @override
  Future<Token?> fetchToken() async {
    String? tokenValue;

    if (_platform == PlatformType.iOS || _platform == PlatformType.android || _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      tokenValue = await storage.read(key: Constant.token);
    } else {
      final prefs = await SharedPreferences.getInstance();
      tokenValue = prefs.getString(Constant.token);
    }
    try {
      if (tokenValue != null) {
        _token = tokenFromJson(tokenValue);
      }
    } on Exception catch (e) {
      return _token;
    }

    return _token;
  }

  @override
  Future<bool> checkToken() async {
    var result = await _tokenRemoteSource.checkToken();
    return result.when(success: (success) => true, error: (error) => false);
  }
}
