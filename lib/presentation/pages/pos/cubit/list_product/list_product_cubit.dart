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

  getProductList({String value = ''}) async {
    try {
      emit(ListProductState.loading());
      StoreModel store = await storeRepository.activeStore();
      var result = await productRepository.list(storeId: store.id!, page: 1, searchValue: '');
      result.fold((error) {
        emit(ListProductState.notFound());
      }, (data) {
        emit(ListProductState.loaded(data));
      });
    } catch (e) {
      emit(ListProductState.notFound());
    }
  }
}
