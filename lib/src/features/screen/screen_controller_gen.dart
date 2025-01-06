import 'dart:io';
import '../../utils/utils.dart';

import '../controller/controller.dart';
import '../widget/stateful_widget.dart';

void generateWidget(String widgetName, [String? controllerName]) {
  /// This will give 'ProfileScreen'
  final controllerFileName = controllerName ?? '${widgetName.toLowerCase()}_controller';
  var controllerClassName = "";
  if(controllerName ==null){
    controllerClassName = controllerName ??'${toPascalCase(widgetName.toLowerCase())}Controller';
  }else{
    controllerClassName = toPascalCase(controllerName);
  }

  /// Get the Flutter project root and 'lib' directory
  final currentDir = Directory.current;
  final flutterProjectRoot = getFlutterProjectRoot(currentDir);
  final libDir = Directory('${flutterProjectRoot.path}/lib');

  /// Create the main directory under lib/features
  final srcDir = Directory('${libDir.path}/src');
  if (!srcDir.existsSync()) {
    print(" src : Dir Is Created Successfully ✅");
    srcDir.createSync();
  }

  /// Create the main directory under lib/features
  final featuresDir = Directory('${libDir.path}/src/features');
  if (!featuresDir.existsSync()) {
    print(" features : Dir Is Created Successfully ✅");
    featuresDir.createSync();
  }

  /// Create widgets in src directory with lowercase
  final mainDir = Directory('${libDir.path}/src/features/${widgetName.toLowerCase()}');
  if (!mainDir.existsSync()) {
    print(" ${widgetName.toLowerCase()} : Widget Is Created Successfully ✅");
    mainDir.createSync(recursive: true);
  }

  /// Create 'screens' directory under lib/src/features/<widgetName>/
  final screensDir = Directory('${mainDir.path}/screens');
  print(" screens : Dir Is Created Successfully ✅");
  if (!screensDir.existsSync()) {
    screensDir.createSync();
  }

  /// Create 'controller' directory under lib/src/features/<widgetName>/
  final controllerDir = Directory('${mainDir.path}/controller');
  if (!controllerDir.existsSync()) {
    print("Controller Is Created Successfully ✅");
    controllerDir.createSync();
  }

  /// Generate StatefulWidget file
  final widgetTemplate = generateStatefulWidget(toPascalCase(widgetName), controllerFileName, controllerClassName);
  final widgetFile = File('${screensDir.path}/${widgetName.toLowerCase()}.dart');
  widgetFile.writeAsStringSync(widgetTemplate);
  print("Stateful widget ${toPascalCase(widgetName)} Created Successfully : ✅");

  /// Generate Controller file
  final controllerTemplate = generateController(controllerClassName);
  final controllerFile = File('${controllerDir.path}/$controllerFileName.dart');
  controllerFile.writeAsStringSync(controllerTemplate);
  print("Controller $controllerClassName Created Successfully : ✅");
}



Directory getFlutterProjectRoot(Directory startDir) {
  Directory currentDir = startDir;
  while (currentDir.existsSync()) {
    if (File('${currentDir.path}/pubspec.yaml').existsSync()) {
      return currentDir;
    }
    currentDir = currentDir.parent;
  }
  throw Exception('Could not find Flutter project root directory');
}
