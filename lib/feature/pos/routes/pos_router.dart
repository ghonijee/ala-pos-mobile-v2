import 'package:ala_pos/feature/pos/screen/pos_main_screen.dart';
import 'package:auto_route/auto_route.dart';

class PosRouteName {
  static const String Pos = "/pos";
}

const posRouter = [
  AutoRoute(page: PosMainScreen, path: PosRouteName.Pos),
];
