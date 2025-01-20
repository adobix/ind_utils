import 'dart:io';

List<Directory> getSubAssetsDirectories(Directory directory) {
  final dirs = <Directory>[];
  directory.listSync(recursive: true, followLinks: false).forEach((entity) {
    if (entity is Directory) dirs.add(entity);
  });
  return dirs;
}
