import 'dart:io';
import 'package:ind_utils/ind_utils.dart';
import 'package:interact/interact.dart';
import 'package:path/path.dart' as p;

void main() {
  final flutterProjectRoot = Directory.current;
  CliLogger.startedLog();
  CliLogger.info('Inserting Assets images ...\n');

  // Check Assets Directory
  final assetsDirectory = Directory('${flutterProjectRoot.path}/assets');
  if (!assetsDirectory.existsSync()) {
    CliLogger.error('Please Create Assets Folder And Insert Images', level: CliLoggerLevel.two);
    exit(1);
  }

  // Get all subdirectories of the 'assets' directory recursively
  final assetDirectory = GetDirectory.getSubdirectories(assetsDirectory);
  if (assetDirectory.isEmpty) {
    CliLogger.error('No subdirectories found in the assets folder.', level: CliLoggerLevel.two);
    exit(1);
  }

  print("Where do you want to create this file: example - lib/src/styles/");
  final appAssetsInput = Input(prompt: 'Where do you want to create this file: ').interact();
  //
  Directory getLibDirectory = getProjectDirectory(flutterProjectRoot, appAssetsInput);
  //
  _appAssetsDartFile(getLibDirectory, flutterProjectRoot, assetDirectory);
  // End Message
  CliLogger.endLog();
}
// Get your Project Directory
Directory getProjectDirectory(Directory flutterProjectRoot, String appAssetsInput) {
  final getLibDirectory = Directory('${flutterProjectRoot.path}/$appAssetsInput');
  if (!getLibDirectory.existsSync()) {
    getLibDirectory.createSync(recursive: true);
  }
  return getLibDirectory;
}
// Create Asset Dart File with code Template
void _appAssetsDartFile(Directory getLibDirectory, Directory flutterProjectRoot, List<Directory> assetDirectory) {
  final outputFile = File('${getLibDirectory.path}/app_assets.dart');
  final getAssetFilesList = GetDirectory.getAllAssetFiles(Directory('${flutterProjectRoot.path}/assets'));
  final folderNames = assetDirectory.map((dir) => p.basename(dir.path)).toList();
  outputFile.writeAsStringSync(WriteAssetsClass.writingAssets(getAssetFilesList, folderNames));
}
