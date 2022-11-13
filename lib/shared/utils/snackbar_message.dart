import 'package:flutter/material.dart';

class SnackbarMessage {
  static failed(BuildContext context, String message, {Color? bgColor, Color? textColor}) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static success(BuildContext context, String message, {Color? bgColor, Color? textColor}) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
