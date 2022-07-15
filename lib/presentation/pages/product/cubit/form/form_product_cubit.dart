import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:ala_pos/domain/repositories/product_repository.dart';
import 'package:ala_pos/domain/repositories/store_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../field/field.dart';

part 'form_product_state.dart';
part 'form_product_cubit.freezed.dart';

@injectable
class FormProductCubit extends Cubit<FormProductState> {
  AuthRepository authRepository;
  ProductRepository productRepository;
  StoreRepository storeRepository;
  bool isUpdate = false;
  FormProductCubit(
    this.productRepository,
    this.storeRepository,
    this.authRepository,
  ) : super(FormProductState());

  createProduct() async {
    var storeActive = await storeRepository.activeStore();
    isUpdate = false;
    emit(FormProductState(
      id: 0,
      storeId: storeActive.id,
      stock: StockField.dirty(0),
    ));
  }

  showProduct(ProductModel model) {
    isUpdate = true;
    emit(state.copyWith(
      id: model.id,
      storeId: model.storeId,
      name: NameField.dirty(model.name),
      price: PriceField.dirty(model.price),
      stock: StockField.dirty(model.stock),
      minStock: MinStockField.dirty(model.minStock!),
      code: CodeField.dirty(model.code!),
      cost: CostField.dirty(model.cost!),
      desc: DescField.dirty(model.description!),
      unit: UnitField.dirty(model.unit!),
      statusSubmission: FormzStatus.pure,
    ));
  }

  storeProduct() async {
    try {
      emit(state.copyWith(statusSubmission: FormzStatus.submissionInProgress));

      var result = await productRepository.create(state.toModel());
      result.fold((failure) {
        emit(state.copyWith(statusSubmission: FormzStatus.submissionFailure, message: failure.message));
      }, (response) {
        emit(state.copyWith(statusSubmission: FormzStatus.submissionSuccess, message: response.message!));
      });
    } catch (e) {
      emit(state.copyWith(statusSubmission: FormzStatus.submissionFailure, message: e.toString()));
    }
  }

  updateProduct() async {
    try {
      emit(state.copyWith(statusSubmission: FormzStatus.submissionInProgress));

      var result = await productRepository.update(state.toModel());
      result.fold((failure) {
        emit(state.copyWith(statusSubmission: FormzStatus.submissionFailure, message: failure.message));
      }, (response) {
        emit(state.copyWith(statusSubmission: FormzStatus.submissionSuccess, message: response.message!));
      });
    } catch (e) {
      emit(state.copyWith(statusSubmission: FormzStatus.submissionFailure, message: e.toString()));
    }
  }

  nameChange(value) {
    final nameField = NameField.dirty(value);
    emit(state.copyWith(
      name: nameField,
    ));
  }

  priceChange(int? value) {
    final priceField = PriceField.dirty(value);
    emit(state.copyWith(
      price: priceField,
    ));
  }

  stockChange(int? value) {
    final stockField = StockField.dirty(value);
    emit(state.copyWith(
      stock: stockField,
    ));
  }

  minStockChange(int? value) {
    final minStockField = MinStockField.dirty(value ?? 0);
    emit(state.copyWith(
      minStock: minStockField,
    ));
  }

  codeChange(String value) {
    final field = CodeField.dirty(value);
    emit(state.copyWith(
      code: field,
    ));
  }

  costChange(int value) {
    final field = CostField.dirty(value);
    emit(state.copyWith(
      cost: field,
    ));
  }

  descChange(String value) {
    final field = DescField.dirty(value);
    emit(state.copyWith(
      desc: field,
    ));
  }

  unitChange(String value) {
    final field = UnitField.dirty(value);
    emit(state.copyWith(
      unit: field,
    ));
  }
}
