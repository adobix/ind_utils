import 'package:ind_utils/ind_utils.dart';
import 'package:interact/interact.dart';
import 'dart:io';

void main() {
  // Starting Message
  CliLogger.startedLog();
  // Creating Screens , Widget, Controller, Repository, Service
  CliLogger.info('Ready To Create Dart File Based on Structures ...\n');
  // Enter Screen Name which is lower case that will be create as directory and also create screen file
  final screenName = Input(prompt: 'Enter screen Name?: ').interact();
  //
  Directory screenNameDirectory = _createScreenDirectoryName(screenName);
  //Creating Screen Directory
  Directory screensDirectory = _createScreenDirectory(screenNameDirectory);
  // Creating Screen Dart File
  _createScreenDart(screensDirectory, screenName);
  // Controller file?
  ScreenGenerator.providerFile(screenName);
  // widget directory
  ScreenGenerator.widgetFile(screenName);
  // model directory
  ScreenGenerator.modelFile(screenName);
  // if you wanna provider repository
  ScreenGenerator.repositoryFile(screenName);
  // End Message
  CliLogger.endLog();
}
//
Directory _createScreenDirectoryName(String screenName) {
  final screenNameDirectory = Directory('${Directory.current.path}/${screenName.toLowerCase()}');
  // Create Directory Name here ---
  if (!screenNameDirectory.existsSync()) {
    screenNameDirectory.createSync(recursive: true);
    CliLogger.directoryLog(screenName);
  }
  return screenNameDirectory;
}
//
Directory _createScreenDirectory(Directory screenNameDir) {
  final screensDirectory = Directory('${screenNameDir.path}/screen');
  if (!screensDirectory.existsSync()) {
    screensDirectory.createSync();
  }
  return screensDirectory;
}
//
void _createScreenDart(Directory screensDirectory, String screenName) {
  final screenDartFile = File('${screensDirectory.path}/${screenName.toLowerCase()}.dart');
  screenDartFile.writeAsStringSync(generateStatefulWidget(FileCase.toPascalCase(screenName)));
}
