import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'submit_transaction_state.dart';
part 'submit_transaction_cubit.freezed.dart';

@injectable
class SubmitTransactionCubit extends Cubit<SubmitTransactionState> {
  SubmitTransactionCubit() : super(SubmitTransactionState.initial());

  submitData(TransactionModel model) async {
    emit(SubmitTransactionState.loading());

    Future.delayed(Duration(seconds: 3), () {
      // emit(SubmitTransactionState.failed("Internet mati", model));
      emit(SubmitTransactionState.success(model));
    });

    //
  }
}
