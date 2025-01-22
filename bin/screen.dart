import 'package:ind_utils/src/screen/screen.dart';
import 'package:ind_utils/src/utils/cli_logger.dart';
import 'package:ind_utils/src/utils/utils.dart';
import 'dart:io';

import 'package:interact/interact.dart';

void main() {
  /// Creating Screens , Widget, Controller, Repository, Service
  CliLogger.startedLog();
  CliLogger.info('Ready To Create Dart File Based on Structures ...\n');

  /// Enter Screen Name which is lower case that will be create as directory and also create screen file
  final screenName = Input(prompt: 'Enter screen Name?: ').interact();
  final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');

  /// Create Directory Name here ---
  if (!screenNameDir.existsSync()) {
    screenNameDir.createSync(recursive: true);
    CliLogger.directoryLog(screenName);
  }

  ///Creating Screen Directory
  final screensDirectory = Directory('${screenNameDir.path}/screen');
  if (!screensDirectory.existsSync()) {
    screensDirectory.createSync();
  }

  /// Creating Screen Dart File
  final screenDartFile = File('${screensDirectory.path}/${screenName.toLowerCase()}.dart');
  screenDartFile.writeAsStringSync(generateStatefulWidget(toPascalCase(screenName)));

  /// Controller file?
  final controllerInput = Input(prompt: 'Do you want to provide a controller? (y/n): ').interact();
  if (controllerInput == 'y') {
    final controllerName = Input(prompt: 'Enter the controller name: ').interact();
    final controllerDirectory = Directory('${screenNameDir.path}/controller');
    if (!controllerDirectory.existsSync()) {
      controllerDirectory.createSync();
    }

    /// Creating Controller Dart File here ---
    final controllerFile = File('${controllerDirectory.path}/$controllerName.dart');
    controllerFile.writeAsStringSync(generateController(toPascalCase(controllerName)));
    CliLogger.controllerLog(controllerName);
  } else {
    CliLogger.info("Controller Skipped due to wrong input");
  }

  /// widget directory
  final widgetInput = Input(prompt: 'Do you want Widget Directory? (y/n): ').interact();
  if (widgetInput == 'y') {
    /// creating widget directory here ---
    final widgetDirName = Directory('${screenNameDir.path}/widgets');
    if (!widgetDirName.existsSync()) {
      widgetDirName.createSync();
      CliLogger.repositoryLog("Widget Directory Generated Successfully");
    }

    ///  creating widget dart file here ---
    final widgetsDartInput = Input(prompt: 'Enter Your one Widget Name:  ').interact();
    final widgetsDart = File('${screenNameDir.path}/widgets/$widgetsDartInput.dart');
    if (!widgetsDart.existsSync()) {
      widgetsDart.createSync(recursive: true);
      CliLogger.screenLog("$widgetsDartInput Generated Successfully");
    }
  } else {
    CliLogger.info("Widget Skipped due to wrong input");
  }

  /// model directory
  final modelInput = Input(prompt: 'Do you want to Model Directory? (y/n): ').interact();
  if (modelInput == 'y') {
    /// creating widget directory here ---
    final widgetDirName = Directory('${screenNameDir.path}/model');
    if (!widgetDirName.existsSync()) {
      widgetDirName.createSync();
      CliLogger.repositoryLog("Model Directory Generated Successfully");
    }
  } else {
    CliLogger.info("Model Skipped due to wrong input");
  }

  /// if you wanna provider repository
  final repositoryDirInput = Input(prompt: 'Do you want to provide repository? (y/n): ').interact();
  if (repositoryDirInput == 'y') {
    /// create repository directory here ---
    final repositoryDirectory = Directory('${screenNameDir.path}/repository');
    if (!repositoryDirectory.existsSync()) {
      repositoryDirectory.createSync();
    }

    /// repository
    final repositoryDartInput = Input(prompt: 'Enter Repository Name: ').interact();

    /// creating repository dart file
    final screenRepoDart = File('${repositoryDirectory.path}/$repositoryDartInput.dart');
    if (!screenRepoDart.existsSync()) {
      screenRepoDart.createSync(recursive: true);
      CliLogger.repositoryLog("Repository $repositoryDartInput Generated Successfully");
    }

    /// repository interface
    final repositoryInterfaceDartInput = Input(prompt: 'Do you want to screen repository interface dart? (y/n): ').interact();
    if (repositoryInterfaceDartInput == "y") {
      /// creating repository interface dart file
      final screenRepoDart = File('${repositoryDirectory.path}/${repositoryDartInput}_interface.dart');
      if (!screenRepoDart.existsSync()) {
        screenRepoDart.createSync(recursive: true);
        CliLogger.screenLog("Repository Generated Successfully");
      }
      screenRepoDart.writeAsStringSync(
        generateRepository(toPascalCase(repositoryDartInput), toPascalCase(repositoryDartInput)),
      );
      screenRepoDart.writeAsStringSync(generateRepositoryInterface(toPascalCase("${repositoryDartInput}_interface")));
    }
    screenRepoDart.writeAsStringSync(generateRepository(toPascalCase(repositoryDartInput), null));
  } else {
    CliLogger.info("Repository Skipped due to wrong input");
  }
  CliLogger.endLog();
}
