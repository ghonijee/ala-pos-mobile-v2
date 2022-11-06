import 'package:ala_pos/feature/pos/state/cart/cart_state.dart';
import 'package:ala_pos/feature/product/domain/models/product/product_model.dart';
import 'package:ala_pos/feature/store/domain/models/store/store_model.dart';
import 'package:ala_pos/feature/store/domain/repository/store_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/models/transaction/transaction_item_model.dart';

final cartProductProvider = StateNotifierProvider<CartProductNotifier, CartState>((ref) => CartProductNotifier(ref.read(storeRepositoryProvider)));

class CartProductNotifier extends StateNotifier<CartState> {
  StoreRepository storeRepository;
  late StoreModel storeModel;
  CartProductNotifier(this.storeRepository) : super(CartState.initial()) {
    storeRepository.activeStore().then((value) {
      storeModel = value!;
    });
  }

  add(ProductModel productModel) async {
    final cartItem = TransactionItemModel(
      quantity: 1,
      amount: productModel.price * 1,
      price: productModel.price,
      productCost: productModel.cost,
      productId: productModel.id,
      productName: productModel.name,
      storeId: storeModel.id,
    );
    final cartItemIndex = state.items.indexWhere(
      (item) => item.productId == cartItem.productId,
    );

    if (cartItemIndex >= 0) {
      _increaseCartItemCount(cartItem, cartItemIndex);
    } else {
      var items = state.items;
      items.add(cartItem);
      state = state.copyWith(items: items);
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

  reset() {
    state = CartState.initial();
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
    TransactionItemModel _itemChange = state.items[index];
    _itemChange.quantity = _itemChange.quantity + value;
    _itemChange.amount = item.result * (_itemChange.quantity + value);
    final items = state.items;
    items[index] = _itemChange;
    state = state.copyWith(items: items);
  }
}
