import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'receipt_state.dart';
part 'receipt_cubit.freezed.dart';

@injectable
class ReceiptCubit extends Cubit<ReceiptState> {
  final StoreRepository storeRepository;
  ReceiptCubit(this.storeRepository) : super(ReceiptState.initial());

  build(TransactionModel transactionModel) async {
    var storeActive = await storeRepository.activeStore();
    emit(ReceiptState.loaded(transactionModel, storeActive));
  }
}
