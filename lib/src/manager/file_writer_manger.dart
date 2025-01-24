import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:ind_utils/src/assets_gen/write_assets_class.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';

class FileWriter {
  /// Generates the app_assets.dart file with the asset mappings.
  static void generateAssetsDartFile(Directory targetDir, Directory assetsDir, List<Directory> subdirectories) {
    try {
      final outputFile = File('${targetDir.path}/app_assets.dart');
      // Convert File list to List<String> of file paths
      final allAssetFilePaths = assetsDir.listSync(recursive: true).whereType<File>().map((file) => file.path).toList();
      final folderNames = subdirectories.map((dir) => p.basename(dir.path)).toList();
      final fileContent = WriteAssetsClass.writingAssets(allAssetFilePaths, folderNames);
      outputFile.writeAsStringSync(fileContent);
      CliLogger.success('Generated app_assets.dart at ${outputFile.path}');
    } catch (e) {
      CliLogger.error('Failed to generate app_assets.dart: $e', level: CliLoggerLevel.one);
      rethrow;
    }
  }
}
