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
      appBar: AppBar(
        title: Text('$pascalCaseName'),
      ),
      body: Center(
        child: Text('Hello, $pascalCaseName!'),
      ),
    );
  }
}
''';
}

/// controller.dart
String generateController(String controllerClassName) {
  return '''
import 'package:flutter/material.dart';

class $controllerClassName extends ChangeNotifier {
  // Controller logic here
}
''';
}

/// controller.dart
String generateRepository(String repositoryName, String? repoInterface) {
  if (repoInterface == null) {
    return '''
import 'package:flutter/material.dart';

class $repositoryName {
  // Repository logic here
}
''';
  } else {
    return '''
import 'package:flutter/material.dart';

class $repositoryName  implements $repoInterface{
  // Repository logic here
}
''';
  }
}

/// controller.dart
String generateRepositoryInterface(String controllerClassName) {
  return '''
import 'package:flutter/material.dart';

abstract class $controllerClassName {
  // Controller logic here
}
''';
}
