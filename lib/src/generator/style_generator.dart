import 'dart:io';

import 'package:ind_utils/src/constants/constants.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';

class StyleGenerator {
  /// Entry point to generate styles directory and files.
  static void generateStyles(Directory baseDirectory) {
    final stylesDirectory = _createStylesDirectory(baseDirectory);

    _createAppColorFile(stylesDirectory);
    _createStylesFile(stylesDirectory);
    _createAppEdgeFile(stylesDirectory);
  }

  /// Creates the `styles` directory under the base directory.
  static Directory _createStylesDirectory(Directory baseDirectory) {
    final stylesDir = Directory('${baseDirectory.path}/styles');

    if (!stylesDir.existsSync()) {
      stylesDir.createSync(recursive: true);
      CliLogger.info('Created styles directory at ${stylesDir.path}');
    }

    return stylesDir;
  }

  /// Creates the `app_color.dart` file in the `styles` directory.
  static void _createAppColorFile(Directory stylesDirectory) {
    final appColorFile = File('${stylesDirectory.path}/app_color.dart');

    if (!appColorFile.existsSync()) {
      appColorFile.writeAsStringSync(genAppColor());
      CliLogger.screenLog('app_color.dart');
    }
  }

  /// Creates the `styles.dart` file in the `styles` directory.
  static void _createStylesFile(Directory stylesDirectory) {
    final stylesFile = File('${stylesDirectory.path}/styles.dart');

    if (!stylesFile.existsSync()) {
      stylesFile.writeAsStringSync(genStyle());
      CliLogger.screenLog('styles.dart');
    }
  }

  /// Creates the `app_edge.dart` file in the `styles` directory.
  static void _createAppEdgeFile(Directory stylesDirectory) {
    final appEdgeFile = File('${stylesDirectory.path}/app_edge.dart');

    if (!appEdgeFile.existsSync()) {
      appEdgeFile.writeAsStringSync(genAppEdge());
      CliLogger.screenLog('app_edge.dart');
    }
  }
}

String genStyle() {
  return '''library;\nimport 'package:flutter/material.dart';\npart 'app_color.dart';\npart 'app_edge.dart';\n''';
}
