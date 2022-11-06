import 'package:ala_pos/feature/user_management/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../store/domain/repository/store_repository.dart';
import '../domain/models/transaction/transaction_item_model.dart';
import '../state/transaction/transaction_state.dart';

final transactionProvider = StateNotifierProvider<TransactionNotifier, TransactionState>((ref) => TransactionNotifier(ref.read(storeRepositoryProvider), ref.read(userRepositoryProvider)));

class TransactionNotifier extends StateNotifier<TransactionState> {
  TransactionNotifier(this.storeRepository, this.userRepository) : super(TransactionState.initial());

  final UserRepository userRepository;
  final StoreRepository storeRepository;

  init(List<TransactionItemModel> listItem) async {
    print("Call");
    var store = await storeRepository.activeStore();
    var user = await userRepository.userActive();
    var amount = 0;
    for (var item in listItem) {
      amount += item.result * item.quantity;
    }

    var modelPrevius = state.model;

    var model = modelPrevius!.copyWith(
      key: Uuid().v4(),
      userId: user!.id,
      storeId: store!.id,
      date: DateTime.now(),
      items: listItem,
      amount: amount,
      discountPrice: modelPrevius.discountPrice!,
    );

    state = state.copyWith(model: model);
  }

  changeNameCustomer(String value) {
    var model = state.model!.copyWith(
      customerName: value,
      customerId: 0,
    );
    state = state.copyWith(model: model);
  }

  applyDiscount(int? discountPrice) {
    var model = state.model!.copyWith(discountPrice: discountPrice ?? 0);
    state = state.copyWith(model: model);
  }
}
