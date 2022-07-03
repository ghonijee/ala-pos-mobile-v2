import 'package:ala_pos/domain/models/transaction/transaction_item_model.dart';
import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../../domain/repositories/store_repository.dart';

part 'transaction_resume_state.dart';
part 'transaction_resume_cubit.freezed.dart';

@injectable
class TransactionResumeCubit extends Cubit<TransactionResumeState> {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  TransactionResumeCubit(this.authRepository, this.storeRepository) : super(TransactionResumeState.initial());

  init(List<TransactionItemModel> listItem) async {
    var store = await storeRepository.activeStore();
    var user = await authRepository.user;
    var amount = 0;
    for (var item in listItem) {
      amount += item.result * item.quantity;
    }

    var modelPrevius = state.model;

    var model = TransactionModel(
      id: Uuid().v4(),
      userId: user.id,
      storeId: store.id,
      date: DateTime.now(),
      items: listItem,
      amount: amount,
      discountPrice: modelPrevius!.discountPrice!,
    );

    emit(state.copyWith(model: model));
  }

  applyDiscount(int? discountPrice) {
    var model = state.model!.copyWith(discountPrice: discountPrice ?? 0);
    emit(state.copyWith(model: model));
  }
}
