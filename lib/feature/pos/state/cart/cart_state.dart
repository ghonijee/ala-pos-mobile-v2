import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/transaction/transaction_item_model.dart';

part 'cart_state.freezed.dart';

@unfreezed
class CartState with _$CartState {
  const CartState._();

  factory CartState({
    required List<TransactionItemModel> items,
  }) = _CartState;

  num get countItem {
    num count = 0;
    for (var item in items) {
      count += item.quantity;
    }
    return count;
  }

  num get amountPrice {
    num count = 0;
    for (var item in items) {
      count += item.result * item.quantity;
    }
    return count;
  }

  factory CartState.initial() => CartState(items: <TransactionItemModel>[]);
}
