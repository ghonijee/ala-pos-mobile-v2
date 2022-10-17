import 'package:ala_pos/l10n/l10n.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';

class TextAreaComponent extends StatefulWidget {
  TextAreaComponent({
    Key? key,
    this.height = 100.0,
    this.labelText = "Label",
    this.onChange,
    this.isSecureText = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.isValid = true,
    this.errorText,
    this.maxLines = 4,
  }) : super(key: key);
  final double height;
  final String labelText;
  final bool isSecureText;
  Function(String)? onChange;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool? isValid;
  String? errorText;
  int? maxLines;

  @override
  State<TextAreaComponent> createState() => _TextAreaComponentState();
}

class _TextAreaComponentState extends State<TextAreaComponent> {
  late PrimerThemeData primeTheme;
  late Color _color;

  @override
  void initState() {
    super.initState();
    setState(() {
      primeTheme = PrimerTheme.of(context);
      _color = primeTheme.border.dflt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: primeTheme.canvas.dflt,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: widget.isValid! ? _color : primeTheme.danger.foreground,
              width: 1.0,
            ),
          ),
          child: Focus(
            onFocusChange: (focused) {
              setState(() {
                _color = focused ? primeTheme.brand.primary : primeTheme.border.dflt;
              });
            },
            child: TextField(
              keyboardType: widget.textInputType,
              controller: widget.controller,
              onChanged: widget.onChange,
              style: PrimerTheme.of(context).typography.normal,
              obscureText: widget.isSecureText,
              maxLines: widget.maxLines,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                labelText: widget.labelText,
                labelStyle: primeTheme.typography.normal.copyWith(
                  color: primeTheme.foreground.subtle,
                ),
                floatingLabelStyle: primeTheme.typography.normal.copyWith(
                  color: primeTheme.foreground.muted,
                ),
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
              ),
            ),
          ),
        ),
        widget.isValid!
            ? SizedBox()
            : SizedBox(
                height: AppSpacings.s,
              ),
        widget.isValid!
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.errorText ?? "-",
                  style: primeTheme.typography.small.copyWith(color: primeTheme.danger.foreground),
                ),
              )
      ],
    );
  }
}

// widget.isValid!
//             ? SizedBox()
//             : Text(
//                 widget.errorText ?? "-",
//                 style: primeTheme.typography.small.copyWith(color: primeTheme.danger.foreground),
//               )