import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';

import '../../constants/button_enum.dart';

// ignore: must_be_immutable
class ButtonFixedText extends StatefulWidget {
  ButtonFixedText({
    Key? key,
    this.onPress,
    this.isLoading = false,
    this.buttonType = ButtonType.Primary,
    required this.text,
    required this.size,
  }) : super(key: key);
  Function()? onPress;
  bool isLoading;
  ButtonType buttonType;
  String text;
  final Size size;

  @override
  State<ButtonFixedText> createState() => _ButtonFullState();
}

class _ButtonFullState extends State<ButtonFixedText> {
  late PrimerThemeData primeTheme;
  late Color _color;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    setState(() {
      primeTheme = PrimerTheme.of(context);
      _color = primeTheme.brand.primary;
      _textColor = primeTheme.foreground.onEmphasis;
    });

    switch (widget.buttonType) {
      case ButtonType.Primary:
        _color = primeTheme.brand.primary;
        _textColor = primeTheme.foreground.onEmphasis;
        break;
      case ButtonType.Secondary:
        _color = primeTheme.brand.quaternary;
        _textColor = primeTheme.brand.primary;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      child: widget.isLoading
          ? CircularProgressIndicator(
              color: primeTheme.foreground.onEmphasis,
            )
          : Text(
              widget.text,
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _color,
        textStyle: PrimerTheme.of(context).typography.h5.copyWith(color: _textColor),
        foregroundColor: _textColor,
        fixedSize: widget.size,
        elevation: 0.5,
      ),
    );
  }
}
