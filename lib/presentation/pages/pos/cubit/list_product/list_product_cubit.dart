import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/repositories/product_repository.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_product_state.dart';
part 'list_product_cubit.freezed.dart';

@injectable
class ListProductCubit extends Cubit<ListProductState> {
  final ProductRepository productRepository;
  final StoreRepository storeRepository;
  ListProductCubit(this.productRepository, this.storeRepository) : super(ListProductState.initial());

  int page = 1;
  bool canFetchingData = true;
  int take = 20;

  getProductList({
    String value = '',
    bool nextPage = false,
    bool initialData = true,
  }) async {
    try {
      /// Init Temp List Data
      List<ProductModel> listData = <ProductModel>[];

      /// Reset data page and list data product
      ///  if fetch data for first time
      if (initialData) {
        emit(ListProductState.loading());
        page = 1;
        canFetchingData = true;
      }

      if (!canFetchingData) {
        return;
      }

      StoreModel store = await storeRepository.activeStore();

      /// Disable request where on have request proses
      canFetchingData = false;

      /// Save list data old to listData temp variabel
      state.maybeWhen(
          loaded: (data, _) {
            listData.addAll(data);
            emit(ListProductState.loaded(listData, nextPage));
          },
          orElse: () {});
      // Loading

      var result = await productRepository.list(
        storeId: store.id!,
        page: page,
        take: take,
        searchValue: '',
      );

      result.fold((error) {
        emit(ListProductState.fetchError());
      }, (data) {
        /// Push new data to temp Data
        listData.addAll(data);
        var countAllData = listData.length;
        page = countAllData.toInt() ~/ take.toInt() + 1;
      });
      emit(ListProductState.loaded(listData, false));

      /// Enable request after request proses
      canFetchingData = true;
    } catch (e) {
      canFetchingData = true;
      emit(ListProductState.fetchError());
    }
  }
}