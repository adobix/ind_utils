import 'dart:io';
import 'package:ind_utils/ind_utils.dart';
import 'package:path/path.dart' as p;

void writeAssetsName(List<String> files, StringBuffer buffer, String groupName, String folderName) {
  for (var file in files) {
    final name = p.basenameWithoutExtension(file);
    final camelCaseName = toCamelCaseAssets(name);
    final extension = p.extension(file).substring(1);
    String imageName = folderName[0].toUpperCase() + folderName.substring(1);
    buffer.writeln('  static const String ${camelCaseName + imageName} = \'$groupName/$name.$extension\';');
  }
}

String writingAssetsClass(List<String> files, List<String> folderNames) {
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
    writeAssetsName(folderFiles, buffer, '\$$folder', folder);
  }

  buffer.writeln('}');
  CliLogger.success('Assets Dart file Created Successfully\n', level: CliLoggerLevel.one);
  return buffer.toString();
}
List<String> getListAssetFiles(Directory assetsDir) {
  final allFiles = <String>[];
  assetsDir.listSync(recursive: true).whereType<File>().forEach((file) {
    allFiles.add(file.path);
  });
  return allFiles;
}
List<Directory> getSubAssetsDirectories(Directory directory) {
  final dirs = <Directory>[];
  directory.listSync(recursive: true, followLinks: false).forEach((entity) {
    if (entity is Directory) dirs.add(entity);
  });
  return dirs;
}
