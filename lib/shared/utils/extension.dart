import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

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
