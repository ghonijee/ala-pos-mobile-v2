import 'package:ala_pos/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:primer_flutter/primer_flutter.dart';

enum InputCollapseMode { Right, Left, Both }

// ignore: must_be_immutable
class TextFieldCollapseComponent extends StatefulWidget {
  TextFieldCollapseComponent({
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
    this.collapseMode = InputCollapseMode.Left,
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
  InputCollapseMode collapseMode;

  @override
  State<TextFieldCollapseComponent> createState() => _TextFieldCollapseComponentState();
}

class _TextFieldCollapseComponentState extends State<TextFieldCollapseComponent> {
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
        Row(
          children: [
            [InputCollapseMode.Both, InputCollapseMode.Left].contains(widget.collapseMode)
                ? Container(
                    alignment: Alignment.center,
                    height: widget.height,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: primeTheme.brand.quaternary,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                      border: Border.all(
                        color: widget.isValid! ? _color : primeTheme.danger.foreground,
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      "Rp.",
                      style: primeTheme.typography.bold,
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: primeTheme.canvas.dflt,
                  borderRadius: BorderRadius.only(
                    topLeft: [InputCollapseMode.Both, InputCollapseMode.Right].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    bottomLeft: [InputCollapseMode.Both, InputCollapseMode.Right].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    topRight: [InputCollapseMode.Both, InputCollapseMode.Left].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    bottomRight: [InputCollapseMode.Both, InputCollapseMode.Left].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                  ),
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
                    style: primeTheme.typography.normal,
                    obscureText: widget.isSecureText,
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
            ),
            [InputCollapseMode.Both, InputCollapseMode.Right].contains(widget.collapseMode)
                ? Container(
                    alignment: Alignment.center,
                    height: widget.height,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: primeTheme.brand.quaternary,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      border: Border.all(
                        color: widget.isValid! ? _color : primeTheme.danger.foreground,
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      "%",
                      style: primeTheme.typography.bold,
                    ),
                  )
                : SizedBox(),
          ],
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