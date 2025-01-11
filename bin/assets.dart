import 'package:ind_utils/src/utils/cli_logger.dart';
import 'package:ind_utils/src/utils/utils.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

void main() {
  final flutterProjectRoot = Directory.current;
  CliLogger.startedLog();
  CliLogger.info('Inserting Assets images ...\n');

  /// Check Assets Directory
  if (!Directory('${flutterProjectRoot.path}/assets').existsSync()) {
    CliLogger.error('Please Create Assets File And Insert Images', level: CliLoggerLevel.two);
    exit(1);
  }

  final getAssetsDirectory = Directory('${flutterProjectRoot.path}/assets');
  final getLibDirectory = Directory('${flutterProjectRoot.path}/lib');
  final assetDirs = getAssetsDirectory.listSync(recursive: false).whereType<Directory>().toList();
  final folderNames = assetDirs.map((dir) => p.basename(dir.path)).toList();
  final outputFile = File('${getLibDirectory.path}/app_assets.dart');

  final getAssetFilesList = _getListAssetFiles(getAssetsDirectory);
  outputFile.writeAsStringSync(_writingAssetsClass(getAssetFilesList, folderNames));
  CliLogger.endLog();
}

String _writingAssetsClass(List<String> files, List<String> folderNames) {
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

void _writeAssetsName(List<String> files, StringBuffer buffer, String groupName, String folderName) {
  for (var file in files) {
    final name = p.basenameWithoutExtension(file);
    final camelCaseName = toCamelCaseAssets(name);
    final extension = p.extension(file).substring(1);
    String imageName = folderName[0].toUpperCase() + folderName.substring(1);
    buffer.writeln('  static const String ${camelCaseName + imageName} = \'$groupName/$name.$extension\';');
  }
}

List<String> _getListAssetFiles(Directory assetsDir) {
  final assetDirs = assetsDir.listSync(recursive: false).whereType<Directory>().toList();
  final allFiles = <String>[];
  for (var dir in assetDirs) {
    final files = dir.listSync(recursive: true).whereType<File>().map((file) => file.path).toList();
    allFiles.addAll(files);
  }
  return allFiles;
}
