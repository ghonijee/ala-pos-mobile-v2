import 'package:ala_pos/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:primer_flutter/primer_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return Scaffold(
      backgroundColor: primeTheme.accent.foreground,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          // child: Image.asset("assets/images/pos_logo.png"),
          child: Assets.images.posLogo.image(),
        ),
      ),
    );
  }
}
