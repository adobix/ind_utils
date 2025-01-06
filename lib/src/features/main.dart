String genMainDart() {
  return '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upgrader/upgrader.dart';
import 'di_part.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Upgrader.clearSavedSettings();
  setUp();
  runApp(const MyApp());
}
''';
}