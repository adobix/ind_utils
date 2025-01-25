// directory_manager.dart
import 'dart:io';
import 'package:ind_utils/src/logs/cli_logger.dart';
import 'file_manager.dart';

class DirectoryManager {
  static void createStructure(String screenName) {
  final baseDirectory = _createBaseDirectory(screenName);
  final screenDirectory = _createScreenSubdirectory(baseDirectory);
  FileManager.generateFiles(screenDirectory, screenName);

}

/// Retrieves the 'assets' directory and checks for existence.
  static Directory getAssetsDirectory() {
    final assetsDir = Directory('${Directory.current.path}/assets');
    if (!assetsDir.existsSync()) {
      CliLogger.error('Assets directory not found. Please create an "assets" folder and add images.', level: CliLoggerLevel.two);
      exit(1);
    }
    return assetsDir;
  }

  /// Retrieves all subdirectories within the provided directory.
  static List<Directory> getSubdirectories(Directory directory) {
    return directory.listSync().whereType<Directory>().toList();
  }

  /// Resolves or creates the target directory for the generated file.
  static Directory getTargetDirectory(Directory rootDir, String relativePath) {
    final targetDir = Directory('${rootDir.path}/$relativePath');
    if (!targetDir.existsSync()) {
      targetDir.createSync(recursive: true);
    }
    return targetDir;
  }


  /// Creates the base directory for the screen.
  static Directory _createBaseDirectory(String screenName) {
    final baseDirPath = '${Directory.current.path}/${screenName.toLowerCase()}';
    final baseDir = Directory(baseDirPath);
    if (!baseDir.existsSync()) {
      baseDir.createSync(recursive: true);
      CliLogger.directoryLog(screenName);
    }
    return baseDir;
  }

  /// Creates the 'screen' subdirectory within the base directory.
  static Directory _createScreenSubdirectory(Directory baseDirectory) {
    final screenDirPath = '${baseDirectory.path}/screen';
    final screenDir = Directory(screenDirPath);
    if (!screenDir.existsSync()) {
      screenDir.createSync();
    }
    return screenDir;
  }
}
