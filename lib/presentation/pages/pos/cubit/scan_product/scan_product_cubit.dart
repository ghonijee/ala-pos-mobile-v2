import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/domain/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'scan_product_state.dart';
part 'scan_product_cubit.freezed.dart';

@injectable
class ScanProductCubit extends Cubit<ScanProductState> {
  final ProductRepository repository;
  ScanProductCubit(this.repository) : super(ScanProductState.initial());

  scan(String code) async {
    try {
      emit(ScanProductState.loading());

      var result = await repository.scanCode(code);
      result.fold((failure) {
        emit(ScanProductState.failed(failure.message));
      }, (response) {
        // if(response)
        print(code.toString());
        print(response.toString());
        ProductModel model = ProductModel.fromJson(response.data);
        emit(ScanProductState.success(model));
      });
    } catch (e) {
      emit(ScanProductState.failed(e.toString()));
    }
  }
}
