part of 'receipt_cubit.dart';

@freezed
class ReceiptState with _$ReceiptState {
  factory ReceiptState.initial() = _Initial;
  factory ReceiptState.loaded(TransactionModel transactionModel, StoreModel storeModel) = _Loaded;
}
