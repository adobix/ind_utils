import 'dart:io';

import 'package:ind_utils/src/features/main.dart';
import 'package:ind_utils/src/features/screen/screen_controller_gen.dart';

void main(List<String> args) {
  assetsGen(args);
}

void assetsGen(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart screen_gen.dart <WidgetName> [ControllerName]');
    return;
  }
  // Assets File Here
  final currentDir = Directory.current;
  final flutterProjectRoot = getFlutterProjectRoot(currentDir);
  final mainDart = File('${flutterProjectRoot.path}/lib/main.dart');
  if (!mainDart.existsSync()) {
    mainDart.writeAsStringSync(genMainDart());
    print("App Colors Dart file Created at:${mainDart.path} Successfully ✅");
  }
  // Create helper files

  // Widget Generator Here
  final widgetName = args[0];
  final controllerName = args.length > 1 ? args[1] : null;
  generateWidget(widgetName, controllerName);
}
