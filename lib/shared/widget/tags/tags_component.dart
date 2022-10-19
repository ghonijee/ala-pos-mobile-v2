// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';

class TagsComponent extends StatefulWidget {
  TagsComponent({
    Key? key,
    required this.label,
    required this.isActive,
    this.onPress,
  }) : super(key: key);
  final String label;
  final bool isActive;
  final Function()? onPress;

  @override
  State<TagsComponent> createState() => _TagsComponentState();
}

class _TagsComponentState extends State<TagsComponent> {
  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.only(right: 4),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isActive ? primeTheme.brand.quaternary : primeTheme.canvas.dflt,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: widget.isActive ? primeTheme.brand.primary : primeTheme.border.dflt,
          ),
        ),
        child: Text(
          widget.label,
          style: primeTheme.typography.small,
        ),
      ),
    );
  }
}
