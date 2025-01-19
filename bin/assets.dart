import 'package:ind_utils/src/utils/cli_logger.dart';
import 'package:ind_utils/src/utils/utils.dart';
import 'package:interact/interact.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

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
  final assetDirs = _getSubdirectories(assetsDir);
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

  final getAssetFilesList = _getListAssetFiles(assetsDir);
  outputFile.writeAsStringSync(_writingAssetsClass(getAssetFilesList, folderNames));

  CliLogger.endLog();
}

List<String> _getListAssetFiles(Directory assetsDir) {
  final allFiles = <String>[];
  assetsDir.listSync(recursive: true).whereType<File>().forEach((file) {
    allFiles.add(file.path);
  });
  return allFiles;
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

List<Directory> _getSubdirectories(Directory directory) {
  final dirs = <Directory>[];
  directory.listSync(recursive: true, followLinks: false).forEach((entity) {
    if (entity is Directory) dirs.add(entity);
  });
  return dirs;
}
