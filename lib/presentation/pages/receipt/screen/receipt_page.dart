import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/presentation/pages/receipt/cubit/receipt_cubit.dart';
import 'package:ala_pos/presentation/pages/receipt/screen/receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({Key? key, required this.transactionModel}) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<ReceiptCubit>(),
      child: ReceiptScreen(
        transactionModel: transactionModel,
      ),
    );
  }
}
