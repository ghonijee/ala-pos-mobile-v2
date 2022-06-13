import 'package:ala_pos/ala_pos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String env = String.fromEnvironment("ENV", defaultValue: "notFound");

  await dotenv.load(fileName: env);

  configureDependencies();

  runApp(const AlaApp());
}
