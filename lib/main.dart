import 'package:ala_pos/ala_pos.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String env = String.fromEnvironment("ENV", defaultValue: "notFound");

  await dotenv.load(fileName: env);

  configureDependencies();

  await initializeDateFormatting('id', null);

  await Core.initLocalDB();

  runApp(const AlaApp());
}
