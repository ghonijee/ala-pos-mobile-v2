import 'package:ala_pos/domain/models/store/store_category_model.dart';
import 'package:ala_pos/domain/models/store/store_model.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_form_state.dart';
part 'store_form_cubit.freezed.dart';

@injectable
class StoreFormCubit extends Cubit<StoreFormState> {
  final StoreRepository storeRepository;
  late List<StoreCategoryModel> listCategory;

  StoreFormCubit(this.storeRepository) : super(StoreFormState.initial()) {
    listCategory = storeRepository.getStoreCategory();
  }

  submitted(String name, String address, String phone) async {
    emit(StoreFormState.submitted());
    StoreModel model = StoreModel(name: name, address: address, phone: phone);
    var result = await storeRepository.storeData(model);
    result.fold((l) {
      emit(StoreFormState.failed(message: l.message));
    }, (r) {
      emit(StoreFormState.success());
    });
  }

  changeCategory(StoreCategoryModel? value) {}
}
