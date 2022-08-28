import 'package:ala_pos/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
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
