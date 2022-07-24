part of 'transaction_detail_cubit.dart';

@freezed
class TransactionDetailState with _$TransactionDetailState {
  const factory TransactionDetailState.initial() = _Initial;
  const factory TransactionDetailState.loading() = _Loading;
  const factory TransactionDetailState.loaded(TransactionModel item) = _Loaded;
  const factory TransactionDetailState.failed(String message) = _Failed;
}
