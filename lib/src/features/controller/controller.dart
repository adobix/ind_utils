/// controller.dart
String generateController(String controllerClassName) {
  return '''
import 'package:flutter/material.dart';

class $controllerClassName extends ChangeNotifier {
  // Controller logic here
}
''';
}
