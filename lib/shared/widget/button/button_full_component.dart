import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_flutter/primer_flutter.dart';

enum ButtonType {
  Primary,
  Secondary,
}

// ignore: must_be_immutable
class ButtonFullText extends StatefulWidget {
  ButtonFullText({
    Key? key,
    this.onPress,
    this.isLoading = false,
    this.buttonType = ButtonType.Primary,
    this.elevation = 1.0,
    required this.text,
  }) : super(key: key);
  Function()? onPress;
  bool isLoading;
  ButtonType buttonType;
  String text;
  double elevation;

  @override
  State<ButtonFullText> createState() => _ButtonFullState();
}

class _ButtonFullState extends State<ButtonFullText> {
  late PrimerThemeData primeTheme;
  late Color _color;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    setState(() {
      primeTheme = PrimerTheme.of(context);
      _color = primeTheme.brand.primary;
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
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: primeTheme.foreground.onEmphasis,
              ),
            )
          : Text(
              widget.text,
              style: PrimerTheme.of(context).typography.h5.copyWith(color: _textColor),
            ),
      style: ElevatedButton.styleFrom(
        elevation: widget.elevation,
        backgroundColor: _color,
        textStyle: PrimerTheme.of(context).typography.h5.copyWith(color: _textColor),
        minimumSize: Size.fromHeight(48),
      ),
    );
  }
}
