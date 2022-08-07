import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:ala_pos/domain/repositories/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/models/store/store_model.dart';

part 'transaction_list_state.dart';
part 'transaction_list_cubit.freezed.dart';

@injectable
class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionRepository transactionRepository;
  StoreRepository storeRepository;
  TransactionListCubit(this.transactionRepository, this.storeRepository) : super(TransactionListState.empty());

  int page = 1;
  bool canFetchingData = true;
  int take = 20;
  int count = 0;

  getTransactionList({
    String value = '',
    bool nextPage = false,
    bool initialData = true,
  }) async {
    try {
      /// Init Temp List Data
      List<TransactionModel> listData = <TransactionModel>[];

      /// Reset data page and list data product
      ///  if fetch data for first time
      if (initialData) {
        emit(TransactionListState.loading());
        page = 1;
        canFetchingData = true;
      }

      if (canFetchingData == false) {
        return;
      }

      StoreModel store = await storeRepository.activeStore();

      /// Disable request where on have request proses
      canFetchingData = false;

      /// Save list data old to listData temp variabel
      state.maybeWhen(
          loaded: (data, _) {
            listData.addAll(data);
            emit(TransactionListState.loaded(listData, nextPage));
          },
          orElse: () {});

      // Loading
      var result = await transactionRepository.list(
        storeId: store.id!,
        page: page,
        take: take,
        searchValue: value,
      );

      result.fold((error) {
        // emit(TransactionListState.fetchError());
      }, (data) {
        /// Push new data to temp Data
        listData.addAll(data);
        var countAllData = listData.length;
        page = countAllData.toInt() ~/ take.toInt() + 1;
      });

      if (listData.isEmpty && value.isNotEmpty) {
        emit(TransactionListState.notFound());
      } else if (listData.isEmpty) {
        emit(TransactionListState.empty());
      } else {
        emit(TransactionListState.loaded(listData, false));
      }

      /// Enable request after request proses
      canFetchingData = true;
    } catch (e) {
      canFetchingData = true;
      // emit(TransactionListState.fetchError());
    }
  }
}
