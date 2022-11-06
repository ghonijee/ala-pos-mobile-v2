import 'package:ala_pos/l10n/l10n.dart';
import 'package:ala_pos/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';

class TextFieldComponent extends StatefulWidget {
  TextFieldComponent({
    Key? key,
    this.height = 56.0,
    this.labelText,
    this.hintText,
    this.onChange,
    this.isSecureText = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.isValid = true,
    this.errorText,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
  }) : super(key: key);
  final double height;
  String? labelText;
  String? hintText;
  final bool isSecureText;
  Function(String)? onChange;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool? isValid;
  String? errorText;
  TextAlign textAlign;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
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
              textAlign: widget.textAlign,
              keyboardType: widget.textInputType,
              controller: widget.controller,
              onChanged: widget.onChange,
              style: primeTheme.typography.normal,
              obscureText: widget.isSecureText,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
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
                hintText: widget.hintText,
                hintStyle: primeTheme.typography.normal.copyWith(
                  color: primeTheme.foreground.subtle,
                ),
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