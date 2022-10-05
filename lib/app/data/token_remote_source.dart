import 'package:ala_pos/app/domain/models/response/api_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/http/api_provider.dart';

final tokenRemoteSourceProvider = Provider<TokenRemoteSource>((ref) => TokenRemoteSource(
      ref.read(apiProvider),
    ));

class TokenRemoteSource {
  final ApiProvider _api;
  TokenRemoteSource(this._api);

  Future<APIResponse> checkToken() async {
    APIResponse response = await _api.get("/mobile/check-token");
    return response;
  }
}
