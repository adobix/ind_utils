import 'dart:io';
import 'package:ind_utils/src/constants/file_case.dart';
import 'package:ind_utils/src/generator/screen_generator.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';

class FileManager {
  /// Generates the necessary files for the given screen.
  static void generateFiles(Directory screenDirectory, String screenName) {
    _generateMainScreenFile(screenDirectory, screenName);
    ScreenGenerator.generateScreenFiles(screenName);
  }

  /// Generates the main screen Dart file.
  static void _generateMainScreenFile(Directory screenDirectory, String screenName) {
    final fileName = '${screenName.toLowerCase()}.dart';
    final filePath = '${screenDirectory.path}/$fileName';
    final file = File(filePath);
    final content = generateStatefulWidget(FileCase.toPascalCase(screenName));
    file.writeAsStringSync(content);
    CliLogger.success('Created $fileName in ${screenDirectory.path}');
  }
}

String generateStatefulWidget(String widgetName) {
  return '''
import 'package:flutter/material.dart';
class ${widgetName[0].toUpperCase() + widgetName.substring(1)} extends StatelessWidget {
  const ${widgetName[0].toUpperCase() + widgetName.substring(1)}({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
''';
}
