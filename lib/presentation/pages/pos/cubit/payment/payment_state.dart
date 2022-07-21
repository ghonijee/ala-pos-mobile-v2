part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loaded(TransactionModel model) = _Loaded;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success() = _Success;
  const factory PaymentState.failed() = _Failed;
}
