import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonGroupComponent extends StatefulWidget {
  const ButtonGroupComponent({super.key, required this.children});
  final List<ButtonGroupItem> children;

  @override
  State<ButtonGroupComponent> createState() => _ButtonGroupComponentState();
}

class _ButtonGroupComponentState extends State<ButtonGroupComponent> {
  @override
  Widget build(BuildContext context) {
    PrimerThemeData primerTheme = PrimerTheme.of(context);

    return Container(
      width: 100.w,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: primerTheme.canvas.dflt, border: Border.all(color: primerTheme.border.dflt)),
      child: Row(
        children: widget.children,
      ),
    );
  }
}

class ButtonGroupItem<T> extends StatefulWidget {
  ButtonGroupItem({
    super.key,
    required this.text,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = false,
    this.onTap,
    required this.value,
  });
  final String text;
  final T value;
  bool isFirst;
  bool isLast;
  bool isActive;
  Function()? onTap;

  @override
  State<ButtonGroupItem> createState() => _ButtonGroupItemState();
}

class _ButtonGroupItemState extends State<ButtonGroupItem> {
  @override
  Widget build(BuildContext context) {
    PrimerThemeData primerTheme = PrimerTheme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: widget.isActive ? primerTheme.brand.primary : primerTheme.brand.quaternary,
            borderRadius: BorderRadius.only(
                topLeft: widget.isFirst ? Radius.circular(8) : Radius.zero,
                bottomLeft: widget.isFirst ? Radius.circular(8) : Radius.zero,
                topRight: widget.isLast ? Radius.circular(8) : Radius.zero,
                bottomRight: widget.isLast ? Radius.circular(8) : Radius.zero),
          ),
          child: Text(
            widget.text,
            style: primerTheme.typography.h6.copyWith(color: widget.isActive ? primerTheme.foreground.onEmphasis : primerTheme.brand.primary),
          ),
        ),
      ),
    );
  }
}
