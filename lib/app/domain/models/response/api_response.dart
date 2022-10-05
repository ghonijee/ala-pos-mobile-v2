import 'package:ala_pos/app/domain/models/json/json_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../exception/app_exception.dart';
part 'api_response.freezed.dart';

@freezed
class APIResponse with _$APIResponse {
  const factory APIResponse.success(JsonResource resource) = APISuccess;
  const factory APIResponse.error(AppException exception) = APIError;
}
