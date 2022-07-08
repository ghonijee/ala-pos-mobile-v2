import 'package:ala_pos/domain/models/product/product_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  resetCart() {
    emit(CartState.initial());
  }

  add(ProductModel productModel) async {
    final cartItem = TransactionItemModel(
      quantity: 1,
      amount: productModel.price * 1,
      price: productModel.price,
      id: '',
      productId: productModel.id,
      productName: productModel.name,
      storeId: 1,
      transactionId: '',
    );
    final cartItemIndex = state.items.indexWhere(
      (item) => item.productId == cartItem.productId,
    );

    if (cartItemIndex >= 0) {
      _increaseCartItemCount(cartItem, cartItemIndex);
    } else {
      final items = state.items.rebuild((builder) => builder.add(cartItem));

      emit(state.copyWith(items: items));
    }
  }

  increase(TransactionItemModel cartItem) async {
    final cartItemIndex = state.items.indexWhere(
      (item) => item.productId == cartItem.productId,
    );

    _increaseCartItemCount(cartItem, cartItemIndex);
  }

  decrease(TransactionItemModel cartItem) async {
    final cartItemIndex = state.items.indexWhere(
      (item) => item.productId == cartItem.productId,
    );

    _decreaseCartItemCount(cartItem, cartItemIndex);
  }

  updateItem(TransactionItemModel cartItem, index) async {
    final items = state.items.rebuild(
      (builder) => builder[index] = builder[index].copyWith(
        productName: cartItem.productName,
        price: cartItem.price,
        quantity: cartItem.quantity,
        discountPrice: cartItem.discountPrice,
        note: cartItem.note,
      ),
    );
    emit(state.copyWith(items: items));
  }

  deleteItem(int index) {
    final items = state.items.rebuild(
      (builder) => builder.removeAt(index),
    );
    emit(state.copyWith(items: items));
  }

  _increaseCartItemCount(
    TransactionItemModel item,
    int index,
  ) async {
    _changeCartItemCount(item, index, 1);
  }

  _decreaseCartItemCount(
    TransactionItemModel item,
    int index,
  ) async {
    _changeCartItemCount(item, index, -1);
  }

  _changeCartItemCount(
    TransactionItemModel item,
    int index,
    int value,
  ) async {
    final items = state.items.rebuild(
      (builder) => builder[index] = item.copyWith(quantity: builder[index].quantity + value),
    );
    emit(state.copyWith(items: items));
  }
}
