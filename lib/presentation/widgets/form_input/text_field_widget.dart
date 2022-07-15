import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final String? textHint;
  final bool isPassword;

  const TextFieldWidget({
    this.controller,
    this.validator,
    this.isPassword = false,
    this.textHint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: textHint,
      ),
    );
  }
}
