import 'package:flutter/material.dart';

class LabelTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final String? label;
  final String? textHint;
  final bool isPassword;

  const LabelTextFieldWidget({
    this.controller,
    this.validator,
    this.isPassword = false,
    this.textHint,
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label!,
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyText1,
          validator: validator,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: textHint,
          ),
        ),
      ],
    );
  }
}
