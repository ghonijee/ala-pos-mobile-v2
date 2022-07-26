import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/repositories/transaction_repository.dart';

part 'submit_transaction_state.dart';
part 'submit_transaction_cubit.freezed.dart';

@injectable
class SubmitTransactionCubit extends Cubit<SubmitTransactionState> {
  TransactionRepository repository;
  SubmitTransactionCubit(this.repository) : super(SubmitTransactionState.initial());

  submitData(TransactionModel model) async {
    emit(SubmitTransactionState.loading());

    try {
      var result = await repository.storeData(model);

      result.fold((l) {
        emit(SubmitTransactionState.failed(l.message, model));
      }, (response) {
        TransactionModel transactionModel = TransactionModel.fromJson(response.data);
        emit(SubmitTransactionState.success(transactionModel));
      });
    } catch (e) {
      emit(SubmitTransactionState.failed(e.toString(), model));
    }
  }
}
