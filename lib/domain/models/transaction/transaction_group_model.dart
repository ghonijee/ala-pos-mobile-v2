import 'transaction_model.dart';

class TransactionGroupModel {
  String? title;
  DateTime? date;
  int? amount = 0;
  List<TransactionModel>? items;

  TransactionGroupModel({this.title, this.amount = 0, this.items, this.date});

  static List<TransactionGroupModel> fromTransactionList(List<TransactionModel> items) {
    var group = <TransactionGroupModel>[];
    for (var item in items) {
      var indexGroup = group.indexWhere((element) => element.date == item.date);
      if (indexGroup < 0) {
        group.add(TransactionGroupModel(amount: item.amount, date: item.date, items: [item]));
      } else {
        var itemGroup = group[indexGroup];
        group[indexGroup].amount = itemGroup.amount! + item.amount!;
        group[indexGroup].items!.add(item);
      }
    }

    return group;
  }
}
