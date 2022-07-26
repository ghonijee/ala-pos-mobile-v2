import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_state.dart';

class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit(TransactionModel transactionModel) : super(ReceiptState(transactionModel));
}
