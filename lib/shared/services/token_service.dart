import 'package:ala_pos/shared/http/api_response.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../http/api_provider.dart';

abstract class TokenServiceInterface {
  Future<APIResponse> checkToken();
}

final tokenServiceProvider = Provider<TokenService>((ref) => TokenService(ref.read));

class TokenService implements TokenServiceInterface {
  final Reader _reader;
  TokenService(this._reader);

  @override
  Future<APIResponse> checkToken() async {
    ApiProvider _api = _reader(apiProvider);
    try {
      APIResponse response = await _api.get("/mobile/check-token");
      return response;
    } on DioError catch (e) {
      throw new Exception(e);
    }
  }
}
