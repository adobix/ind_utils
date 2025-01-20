import 'dart:io';

import 'package:ind_utils/src/utils/cli_logger.dart';
import 'package:ind_utils/src/utils/get_sub_directory.dart';
import 'package:ind_utils/src/utils/write_assets_name.dart';
import 'package:interact/interact.dart';
import 'package:path/path.dart' as p;

void main() {
  final flutterProjectRoot = Directory.current;
  CliLogger.startedLog();
  CliLogger.info('Inserting Assets images ...\n');

  /// Check Assets Directory
  final assetsDir = Directory('${flutterProjectRoot.path}/assets');
  if (!assetsDir.existsSync()) {
    CliLogger.error('Please Create Assets Folder And Insert Images', level: CliLoggerLevel.two);
    exit(1);
  }

  /// Get all subdirectories of the 'assets' directory recursively
  final assetDirs = getSubAssetsDirectories(assetsDir);
  if (assetDirs.isEmpty) {
    CliLogger.error('No subdirectories found in the assets folder.', level: CliLoggerLevel.two);
    exit(1);
  }
  final folderNames = assetDirs.map((dir) => p.basename(dir.path)).toList();
  print("Where do you want to create this file: example - lib/src/styles/");
  final appAssetsInput = Input(prompt: 'Where do you want to create this file: ').interact();
  final getLibDirectory = Directory('${flutterProjectRoot.path}/$appAssetsInput');

  if (!getLibDirectory.existsSync()) {
    getLibDirectory.createSync(recursive: true);
  }

  final outputFile = File('${getLibDirectory.path}/app_assets.dart');
  final getAssetFilesList = getListAssetFiles(assetsDir);
  outputFile.writeAsStringSync(writingAssetsClass(getAssetFilesList, folderNames));
  CliLogger.endLog();
}
