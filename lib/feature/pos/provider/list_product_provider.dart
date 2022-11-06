import 'package:ala_pos/feature/pos/state/list_product/list_product_state.dart';
import 'package:ala_pos/feature/product/domain/repository/product_repository.dart';
import 'package:ala_pos/feature/store/domain/repository/store_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../product/domain/models/product/product_model.dart';
import '../../store/domain/models/store/store_model.dart';

final listProductProvider = StateNotifierProvider<ListProductNotifier, ListProductState>((ref) => ListProductNotifier(ref.read(storeRepositoryProvider), ref.read(productRepositoryProvider)));

class ListProductNotifier extends StateNotifier<ListProductState> {
  StoreRepository storeRepository;
  ProductRepository productRepository;
  ListProductNotifier(this.storeRepository, this.productRepository) : super(ListProductState.initial()) {
    getListProduct(initialData: true);
  }

  int page = 1;
  bool canFetchingData = true;
  int take = 20;

  getListProduct({String value = '', bool nextPage = false, bool initialData = true}) async {
    try {
      /// Init Temp List Data
      List<ProductModel> listData = <ProductModel>[];

      /// Reset data page and list data product
      ///  if fetch data for first time
      if (initialData) {
        state = ListProductState.loading();
        page = 1;
        canFetchingData = true;
      }

      if (!canFetchingData) {
        return;
      }

      StoreModel? store = await storeRepository.activeStore();

      /// Disable request where on have request proses
      canFetchingData = false;

      /// Save list data old to listData temp variabel
      if (state is LoadedList) {
        var value = state as LoadedList;
        listData.addAll(value.data);
        state = ListProductState.loaded(listData, nextPage, "Loading...");
      }

      var result = await productRepository.paginate(
        storeId: store!.id!,
        page: page,
        take: take,
        searchValue: value,
      );
      var resultCount = await productRepository.count(
        storeId: store.id!,
        page: page,
        take: take,
        searchValue: value,
      );

      if (result.isFailure) {
        state = ListProductState.fetchError();
      } else {
        listData.addAll(result.success);
        var countAllData = listData.length;
        page = countAllData.toInt() ~/ take.toInt() + 1;
      }

      if (listData.isEmpty && value.isNotEmpty) {
        state = ListProductState.notFound();
      } else if (listData.isEmpty) {
        state = ListProductState.initial();
      } else {
        state = ListProductState.loaded(listData, false, "${listData.length} / ${resultCount.success}");
      }

      /// Enable request after request proses
      canFetchingData = true;
    } catch (e) {
      canFetchingData = true;
      state = ListProductState.fetchError();
    }
  }
}
