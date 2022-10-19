// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';

class ResumeLabelValueWidget extends StatelessWidget {
  const ResumeLabelValueWidget({
    Key? key,
    required this.label,
    required this.value,
    this.isBold = false,
  }) : super(key: key);
  final String label;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold ? primerTheme.typography.bold : primerTheme.typography.normal,
        ),
        Text(
          value,
          style: isBold ? primerTheme.typography.bold : primerTheme.typography.normal,
        ),
      ],
    );
  }
}
