import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState.initial());

  init(TransactionModel model) {
    emit(PaymentState.loaded(model));
  }

  setPayment(int cash) {
    var model = state.when(initial: () => null, loaded: (model) => model);
    emit(PaymentState.initial());
    emit(
      PaymentState.loaded(
        model!.copyWith(
          receivedMoney: cash,
          changeMoney: cash - model.result,
        ),
      ),
    );
  }

  paymentValid() {
    return state.when(
      initial: () {
        return true;
      },
      loaded: (model) => model.receivedMoney! > model.result,
    );
  }
}
