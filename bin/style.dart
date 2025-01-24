import 'dart:io';
import 'package:ind_utils/src/screen/style.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';

void main() {
  CliLogger.startedLog();
  final currentDirectory = Directory(Directory.current.path);
  // Creating styles directory file in src/
  Directory stylesDirectory = _createStyleDirectory(currentDirectory);
  // Create AppColors in src/style
  _createAppColor(stylesDirectory);
  // Create styles file in src/style
  _createStyleFile(stylesDirectory);
  // Create app_edge file in src/style
  _createAppEdge(stylesDirectory);
  // End Message
  CliLogger.endLog();
}

//
Directory _createStyleDirectory(Directory currentDirectory) {
  final stylesDir = Directory('${currentDirectory.path}/styles');
  if (!stylesDir.existsSync()) stylesDir.createSync(recursive: true);
  return stylesDir;
}

//
void _createAppColor(Directory stylesDir) {
  final appColorFile = File('${stylesDir.path}/app_color.dart');
  if (!appColorFile.existsSync()) {
    appColorFile.writeAsStringSync(genAppColor());
    CliLogger.screenLog('app_color.dart');
  }
}

//
void _createStyleFile(Directory stylesDir) {
  final stylesFile = File('${stylesDir.path}/styles.dart');
  if (!stylesFile.existsSync()) {
    stylesFile.writeAsStringSync(genStyle());
    CliLogger.screenLog('styles.dart');
  }
}

//
void _createAppEdge(Directory stylesDir) {
  final appEdge = File('${stylesDir.path}/app_edge.dart');
  if (!appEdge.existsSync()) {
    appEdge.writeAsStringSync(genAppEdge());
    CliLogger.screenLog('app_edge.dart');
  }
}
//
