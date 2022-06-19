part of 'store_form_cubit.dart';

@freezed
class StoreFormState with _$StoreFormState {
  const factory StoreFormState.initial() = _Initial;
  const factory StoreFormState.submitted() = _Submitted;
  const factory StoreFormState.success() = _Success;
  const factory StoreFormState.failed({message}) = _Failed;
}
