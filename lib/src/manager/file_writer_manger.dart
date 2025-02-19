import 'dart:io';
import 'package:ind_utils/src/constants/file_case.dart';
import 'package:path/path.dart' as p;
import 'package:ind_utils/src/print_log/cli_logger.dart';

class FileWriter {
  /// Generates the app_assets.dart file with the asset mappings.
  static void generateAssetsDartFile(Directory targetDir, Directory assetsDir, List<Directory> subdirectories) {
    try {
      final outputFile = File('${targetDir.path}/app_assets.dart');
      // Convert File list to List<String> of file paths
      final allAssetFilePaths = assetsDir.listSync(recursive: true).whereType<File>().map((file) => file.path).toList();
      final folderNames = subdirectories.map((dir) => p.basename(dir.path)).toList();
      final fileContent = writingAssets(allAssetFilePaths, folderNames);
      outputFile.writeAsStringSync(fileContent);
      CliLogger.success('Generated app_assets.dart at ${outputFile.path}');
    } catch (e) {
      CliLogger.error('Failed to generate app_assets.dart: $e', level: CliLoggerLevel.one);
      rethrow;
    }
  }

  static String writingAssets(List<String> files, List<String> folderNames) {
    final buffer = StringBuffer();
    buffer.writeln("class AppAssets {");
    for (var i = 0; i < folderNames.length; i++) {
      final folder = folderNames[i];
      buffer.writeln('\n  /* $folder Folder */');
      buffer.writeln('  static const String $folder = \'${'assets/$folder'}\';');
      final folderFiles = files.where((file) => p.dirname(file).endsWith(folder)).toList();
      CliLogger.success('$folder Folder Generated Successfully', level: CliLoggerLevel.two);
      if (i == folderNames.length - 1) {
        print('');
      }
      _writeAssetsName(folderFiles, buffer, '\$$folder', folder);
    }
    buffer.writeln('}');
    CliLogger.success('Assets Dart file Created Successfully\n', level: CliLoggerLevel.one);
    return buffer.toString();
  }

  static void _writeAssetsName(List<String> files, StringBuffer buffer, String groupName, String folderName) {
    for (var file in files) {
      final name = p.basenameWithoutExtension(file);
      final camelCaseName = FileCase.toCamelCaseAssets(name);
      final extension = p.extension(file).substring(1);
      String imageName = folderName[0].toUpperCase() + folderName.substring(1);
      buffer.writeln('  static const String ${camelCaseName + imageName} = \'$groupName/$name.$extension\';');
    }
  }
}
