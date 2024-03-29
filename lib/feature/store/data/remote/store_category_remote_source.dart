import 'package:ala_pos/shared/http/api_provider.dart';
import 'package:ala_pos/app/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storeCategoryRemoteSourceProvider = Provider((ref) => StoreCategoryRemoteSource(ref.read(apiProvider)));

class StoreCategoryRemoteSource {
  ApiProvider _api;
  StoreCategoryRemoteSource(this._api);

  String resource = "store-category";

  Future<APIResponse> all() async {
    APIResponse response = await _api.get("/$resource");
    return response;
  }
}
