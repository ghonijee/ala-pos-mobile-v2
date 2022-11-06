import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/transaction/transaction_model.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const TransactionState._();

  const factory TransactionState({
    TransactionModel? model,
  }) = _TransactionState;

  factory TransactionState.initial() => TransactionState(model: TransactionModel(items: []));
}
