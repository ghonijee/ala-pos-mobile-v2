import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

extension extensionString on String {
  String initial() {
    return this.isNotEmpty ? this.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase() : '';
  }

  String get titleProduct {
    var name = this.isNotEmpty ? this.trim().split(RegExp(' +')).take(2).join(" ") : '';
    if (name.length > 15) {
      return name.split(RegExp(' +')).take(1).join() + " ...";
    }
    return name;
  }

  String firstCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  /// Convert from [String] to [int?]
  /// with formated Currency Rupiah (Rp.)
  ///
  /// ```dart
  /// String test = "10.000";
  /// int? result = test.toNumber();
  /// print(result!) // 10000
  ///
  /// String test2 = "Rp. 10.000";
  /// int? result = test2.toNumber();
  /// print(result!) // 10000
  /// ```
  int? toNumber() {
    if (this.length > 0) {
      return int.parse(toNumericString(this));
    }
    return null;
  }

  double? toDouble() {
    if (this.length > 0) {
      return double.parse(this);
    }
    return null;
  }
}

extension ExtensionInt on num {
  /// Convert from int to string
  /// with formated Currency Rupiah (Rp.)
  /// ```dart
  /// int test = 10000;
  /// String result = test.toIDR();
  /// print(result) // Rp. 10.000
  /// ``
  String toIDR({decimalDigit = 0}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(this);
  }

  /// Convert from int to string
  /// with formated ThousandSeparator(.)
  /// ```dart
  /// int test = 10000;
  /// String result = test.toThousandSeparator();
  /// print(result) // 10.000
  /// ```
  String toThousandSeparator() {
    return toCurrencyString(
      this.toString(),
      thousandSeparator: ThousandSeparator.Period,
      mantissaLength: 0,
    );
  }
}
