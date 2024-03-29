import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'gen/assets.gen.dart';
import 'start.dart';

void main() async {
  await dotenv.load(fileName: Assets.env.envDevelopment);
  await startApp();
}
