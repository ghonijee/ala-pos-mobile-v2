import 'package:ala_pos/domain/models/transaction/transaction_model.dart';

import '../../domain/models/transaction/transaction_group_model.dart';

var listOfTransaction = [
  TransactionModel(
    date: DateTime.now(),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now(),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now(),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now(),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 2)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 2)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 3)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 3)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 4)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 4)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
  TransactionModel(
    date: DateTime.now().subtract(Duration(days: 4)),
    amount: 50000,
    invoiceNumber: "TR20220701-0001",
  ),
];

List<TransactionGroupModel> listgroupTransaction = TransactionGroupModel.fromTransactionList(listOfTransaction);
