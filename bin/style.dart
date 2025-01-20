import 'dart:io';
import 'package:ind_utils/src/screens/style.dart';
import 'package:ind_utils/src/utils/cli_logger.dart';

void main() {
  CliLogger.startedLog();
  final currentDirectory = Directory(Directory.current.path);

  /// Creating styles directory file in src/
  final stylesDir = Directory('${currentDirectory.path}/styles');
  if (!stylesDir.existsSync()) stylesDir.createSync(recursive: true);

  /// Create AppColors in src/style
  final appColorFile = File('${stylesDir.path}/app_color.dart');
  if (!appColorFile.existsSync()) {
    appColorFile.writeAsStringSync(genAppColor());
    CliLogger.screenLog('app_color.dart');
  }

  /// Create styles file in src/style
  final stylesFile = File('${stylesDir.path}/styles.dart');
  if (!stylesFile.existsSync()) {
    stylesFile.writeAsStringSync(genStyle());
    CliLogger.screenLog('styles.dart');
  }

  /// Create app_edge file in src/style
  final appEdge = File('${stylesDir.path}/app_edge.dart');
  if (!appEdge.existsSync()) {
    appEdge.writeAsStringSync(genAppEdge());
    CliLogger.screenLog('app_edge.dart');
  }
  CliLogger.endLog();
}
