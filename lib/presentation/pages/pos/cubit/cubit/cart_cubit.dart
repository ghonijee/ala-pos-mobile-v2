import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  add() {
    //
  }

  remove() {
    //
  }

  addQty() {
    //
  }

  decreaseQty() {
    //
  }

  updateProductItem() {
    //
  }
}
