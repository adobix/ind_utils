String generateStatefulWidget(String widgetName) {
  final pascalCaseName = widgetName[0].toUpperCase() + widgetName.substring(1);

  return '''
import 'package:flutter/material.dart';
class $pascalCaseName extends StatefulWidget {
  const $pascalCaseName({super.key});
  @override
  State<$pascalCaseName> createState() => _${pascalCaseName}State();
}
class _${pascalCaseName}State extends State<$pascalCaseName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$pascalCaseName')),
    );
  }
}
''';
}

/// controller.dart
String generateController(String controllerClassName) {
  return '''
// $controllerClassName logic here

import 'package:flutter/material.dart';
class $controllerClassName extends ChangeNotifier {

}
''';
}

/// controller.dart
String generateRepository(String repositoryName, String? repoInterface) => '''
// $repositoryName logic here

import 'package:flutter/material.dart';
class $repositoryName {

}''';

/// controller.dart
String generateRepositoryInterface(String repoClassName) => '''
// $repoClassName logic here

import 'package:flutter/material.dart';
abstract class $repoClassName {
  
}
''';
