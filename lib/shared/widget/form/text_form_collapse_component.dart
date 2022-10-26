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
    this.prefix,
    this.suffix,
    this.textInputType = TextInputType.text,
    this.isValid = true,
    this.errorText,
    this.collapseMode = InputCollapseMode.Left,
    this.textAlign = TextAlign.start,
  }) : super(key: key);
  final double height;
  String? labelText;
  String? hintText;
  final bool isSecureText;
  Function(String)? onChange;
  Widget? suffix;
  Widget? prefix;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool? isValid;
  String? errorText;
  InputCollapseMode collapseMode;
  TextAlign textAlign;

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
                    child: widget.prefix,
                  )
                : SizedBox(),
            Expanded(
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: primeTheme.canvas.dflt,
                  borderRadius: BorderRadius.only(
                    topLeft: [InputCollapseMode.Right].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    bottomLeft: [InputCollapseMode.Right].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    topRight: [InputCollapseMode.Left].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
                    bottomRight: [InputCollapseMode.Left].contains(widget.collapseMode) ? Radius.circular(8) : Radius.zero,
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
                    textAlign: widget.textAlign,
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
                    child: widget.suffix)
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