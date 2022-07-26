import 'package:ala_pos/domain/models/transaction/transaction_model.dart';
import 'package:ala_pos/presentation/pages/receipt/screen/receipt_screen.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({Key? key, required this.transactionModel}) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return ReceiptScreen(
      transactionModel: transactionModel,
    );
  }
}
