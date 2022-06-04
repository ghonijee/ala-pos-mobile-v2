import 'package:atomic_design/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFoundation.backgroundColorDark,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Image.asset("assets/images/pos_logo.png"),
        ),
      ),
    );
  }
}
