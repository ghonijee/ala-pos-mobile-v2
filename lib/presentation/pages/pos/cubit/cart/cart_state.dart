part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required BuiltList<TransactionItemModel> items,
  }) = _CartState;

  int get countItem {
    var count = 0;
    for (var item in items) {
      count += item.quantity;
    }
    return count;
  }

  int get amountPrice {
    var count = 0;
    for (var item in items) {
      count += item.price * item.quantity;
    }
    return count;
  }

  factory CartState.initial() => CartState(items: <TransactionItemModel>[].build());
}
