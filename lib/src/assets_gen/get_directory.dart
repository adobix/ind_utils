
import 'dart:io';

class GetDirectory{
 static List<String> getAllAssetFiles(Directory assetsDirectory) {
    final allFiles = <String>[];
    assetsDirectory.listSync(recursive: true).whereType<File>().forEach((file) {
      allFiles.add(file.path);
    });
    return allFiles;
  }

 static List<Directory> getSubdirectories(Directory directory) {
    final dirs = <Directory>[];
    directory.listSync(recursive: true, followLinks: false).forEach((entity) {
      if (entity is Directory) dirs.add(entity);
    });
    return dirs;
  }
}