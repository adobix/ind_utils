import 'dart:io';

import 'package:ind_utils/src/features/screen/screen_controller_gen.dart';
import 'package:ind_utils/src/styles/app_assets.dart';
import 'package:ind_utils/src/styles/style.dart';

void main() {
  assetGen();
}
void assetGen() {
  // Assets File Here
  final currentDir = Directory.current;
  final flutterProjectRoot = getFlutterProjectRoot(currentDir);
  final assetsDir = Directory('${flutterProjectRoot.path}/assets');
  // Create app_assets in helper
  if (!assetsDir.existsSync()) {
    print("Please First Create Assets File : 🚫");
    return;
  }
  final assetFiles = listAssetFiles(assetsDir);
  final libDir = Directory('${flutterProjectRoot.path}/lib');

  /// Creating styles directory file in src/
  final stylesDir = Directory('${libDir.path}/src/styles');
  if (!stylesDir.existsSync()) stylesDir.createSync(recursive: true);

  /// Create AppColors in src/style
  final appColorFile = File('${stylesDir.path}/app_color.dart');
  if (!appColorFile.existsSync()) {
    appColorFile.writeAsStringSync(genAppColor());
    print("App Colors Dart file Created at:${appColorFile.path} Successfully ✅");
  }

  /// Create styles file in src/style
  final stylesFile = File('${stylesDir.path}/styles.dart');
  if (!stylesFile.existsSync()) {
    stylesFile.writeAsStringSync(genStyle());
    print("App Style Dart file Created at:${appColorFile.path} Successfully ✅");
  }

  /// Create app_edge file in src/style
  final appEdge = File('${stylesDir.path}/app_edge.dart');
  if (!appEdge.existsSync()) {
    appEdge.writeAsStringSync(genAppEdge());
    print("App Style Dart file Created at:${appColorFile.path} Successfully ✅");
  }

  /// Create app_assets dart file with images in src/style
  final folderNames = getFolderNames(assetsDir);
  final outputFile = File('${stylesDir.path}/app_assets.dart');
  final assetContent = genAssetsClass(assetFiles, folderNames);
  outputFile.writeAsStringSync(assetContent);
  print("Assets Dart file Created at:${outputFile.path} Successfully ✅");
}
