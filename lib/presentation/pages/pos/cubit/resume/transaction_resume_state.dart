part of 'transaction_resume_cubit.dart';

@freezed
class TransactionResumeState with _$TransactionResumeState {
  const TransactionResumeState._();

  const factory TransactionResumeState({
    TransactionModel? model,
  }) = _TransactionResumeState;

  factory TransactionResumeState.initial() => TransactionResumeState(model: TransactionModel(items: []));
}
