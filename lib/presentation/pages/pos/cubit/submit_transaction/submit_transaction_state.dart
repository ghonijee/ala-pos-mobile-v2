part of 'submit_transaction_cubit.dart';

@freezed
class SubmitTransactionState with _$SubmitTransactionState {
  const factory SubmitTransactionState.initial() = _Initial;
  const factory SubmitTransactionState.loading() = _Loading;
  const factory SubmitTransactionState.success(TransactionModel model) = _Success;
  const factory SubmitTransactionState.failed(String message, TransactionModel model) = _Failed;
}
