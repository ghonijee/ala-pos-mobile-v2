import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';

class CashValueButton extends StatelessWidget {
  const CashValueButton({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var primerTheme = PrimerTheme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primerTheme.brand.quaternary,
        elevation: 0,
        textStyle: primerTheme.typography.h6.copyWith(color: primerTheme.brand.primary),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: primerTheme.typography.h6.copyWith(color: primerTheme.brand.primary),
      ),
    );
  }
}
