import 'dart:io';
import 'package:path/path.dart' as p;
import '../utils/utils.dart';

String genAssetsClass(List<String> files, List<String> folderNames) {
  final buffer = StringBuffer();
  buffer.writeln("part of 'styles.dart'; \nclass AppAssets {");

  for (var folder in folderNames) {
    final folderPath = 'assets/$folder';
    buffer.writeln('\n  /* $folder Folder */');
    buffer.writeln('  static const String $folder = \'$folderPath\';');

    final folderFiles = files
        .where((file) => p.dirname(file).endsWith(folder))
        .toList();

    writeGroupedAssets(folderFiles, buffer, '\$$folder',folder);
  }

  buffer.writeln('}');
  return buffer.toString();
}

void writeGroupedAssets(List<String> files, StringBuffer buffer, String groupName ,String folderName) {
  for (var file in files) {
    final name = p.basenameWithoutExtension(file);
    final camelCaseName = toCamelCaseAssets(name);
    final extension = p.extension(file).substring(1);
    String imageName = folderName[0].toUpperCase() + folderName.substring(1);
    buffer.writeln('  static const String ${camelCaseName+imageName} = \'$groupName/$name.$extension\';');
  }
}

List<String> listAssetFiles(Directory assetsDir) {
  final assetDirs = assetsDir.listSync(recursive: false).whereType<Directory>().toList();
  final allFiles = <String>[];
  for (var dir in assetDirs) {
    final files = dir.listSync(recursive: true).whereType<File>().map((file) => file.path).toList();
    allFiles.addAll(files);
  }
  return allFiles;
}

List<String> getFolderNames(Directory assetsDir) {
  final assetDirs = assetsDir.listSync(recursive: false).whereType<Directory>().toList();
  return assetDirs.map((dir) => p.basename(dir.path)).toList();
}
