part of 'transaction_list_cubit.dart';

@freezed
class TransactionListState with _$TransactionListState {
  const factory TransactionListState.initial() = _Initial;
  const factory TransactionListState.loading() = _Loading;
  const factory TransactionListState.loaded(list, bool nextPage) = _Loaded;
}
