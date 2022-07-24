import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/domain/repositories/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_detail_state.dart';
part 'transaction_detail_cubit.freezed.dart';

@injectable
class TransactionDetailCubit extends Cubit<TransactionDetailState> {
  TransactionRepository transactionRepository;
  TransactionDetailCubit(this.transactionRepository) : super(TransactionDetailState.initial());

  load(TransactionModel itemModel) {
    emit(TransactionDetailState.loaded(itemModel));
  }
}
