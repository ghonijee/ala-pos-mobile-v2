import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  late VoidCallback action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer == null) {
      _timer = Timer(Duration(milliseconds: milliseconds), action);
    } else {
      _timer!.cancel();
    }
  }
}