import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_model.freezed.dart';

@freezed
class FailureModel with _$FailureModel {
  const factory FailureModel.serverError(message) = _ServerError;
  const factory FailureModel.localError(message) = _LocalError;
  const factory FailureModel.internalError(message) = _InternalError;
}
