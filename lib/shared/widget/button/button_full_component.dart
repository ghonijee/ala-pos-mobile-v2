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
    required this.text,
  }) : super(key: key);
  Function()? onPress;
  bool isLoading;
  ButtonType buttonType;
  String text;

  @override
  State<ButtonFullText> createState() => _ButtonFullState();
}

class _ButtonFullState extends State<ButtonFullText> {
  late PrimerThemeData primeTheme;
  late Color _color;

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
        break;
      case ButtonType.Secondary:
        _color = primeTheme.brand.primary;
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
              style: TextStyle(),
            ),
      style: ElevatedButton.styleFrom(
        primary: _color,
        textStyle: PrimerTheme.of(context).typography.h5,
        minimumSize: Size.fromHeight(48),
      ),
    );
  }
}
