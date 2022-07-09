import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/presentation/pages/product/field/name_field.dart';
import 'package:ala_pos/presentation/pages/product/field/price_field.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'form_product_state.dart';
part 'form_product_cubit.freezed.dart';

@injectable
class FormProductCubit extends Cubit<FormProductState> {
  FormProductCubit() : super(FormProductState());

  showProduct(ProductModel model) {
    //
    emit(state.copyWith(
      name: NameField.dirty(model.name),
      price: PriceField.dirty(model.price.toString()),
    ));
  }

  nameChange(value) {
    final nameField = NameField.dirty(value);
    emit(state.copyWith(
      name: nameField,
      status: Formz.validate([state.price, state.name]),
    ));
  }

  priceChange(value) {
    final priceField = PriceField.dirty(value);
    emit(state.copyWith(
      price: priceField,
      status: Formz.validate([state.price, state.name]),
    ));

    print(value);
  }
}
