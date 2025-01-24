import 'package:ind_utils/ind_utils.dart';
import 'package:interact/interact.dart';
import 'dart:io';

class ScreenGenerator {
  static providerFile(String screenName) {
    final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');
    final controllerInput = Input(prompt: 'Do you want to provide a controller? (y/n): ').interact();
    if (controllerInput == 'y') {
      final controllerName = Input(prompt: 'Enter the controller name: ').interact();
      final controllerDirectory = Directory('${screenNameDir.path}/controller');
      if (!controllerDirectory.existsSync()) {
        controllerDirectory.createSync();
      }
      // Creating Controller Dart File here ---
      final controllerFile = File('${controllerDirectory.path}/$controllerName.dart');
      controllerFile.writeAsStringSync(generateController(FileCase.toPascalCase(controllerName)));
      CliLogger.controllerLog(controllerName);
    } else {
      CliLogger.info("Controller Skipped due to wrong input");
    }
  }

  static widgetFile(String screenName) {
    final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');
    final widgetInput = Input(prompt: 'Do you want Widget Directory? (y/n): ').interact();
    if (widgetInput == 'y') {
      // creating widget directory here ---
      final widgetDirName = Directory('${screenNameDir.path}/widgets');
      if (!widgetDirName.existsSync()) {
        widgetDirName.createSync();
        CliLogger.repositoryLog("Widget Directory Generated Successfully");
      }
      //  creating widget dart file here ---
      final widgetsDartInput = Input(prompt: 'Enter Your one Widget Name:  ').interact();
      final widgetsDart = File('${screenNameDir.path}/widgets/$widgetsDartInput.dart');
      if (!widgetsDart.existsSync()) {
        widgetsDart.createSync(recursive: true);
        CliLogger.screenLog("$widgetsDartInput Generated Successfully");
      }
    } else {
      CliLogger.info("Widget Skipped due to wrong input");
    }
  }

  static modelFile(String screenName) {
    final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');
    final modelInput = Input(prompt: 'Do you want to Model Directory? (y/n): ').interact();
    if (modelInput == 'y') {
      // creating widget directory here ---
      final widgetDirName = Directory('${screenNameDir.path}/model');
      if (!widgetDirName.existsSync()) {
        widgetDirName.createSync();
        CliLogger.repositoryLog("Model Directory Generated Successfully");
      }
    } else {
      CliLogger.info("Model Skipped due to wrong input");
    }
  }

  static repositoryFile(String screenName) {
    final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');
    // if you wanna provider repository
    final repositoryDirInput = Input(prompt: 'Do you want to provide repository? (y/n): ').interact();
    if (repositoryDirInput == 'y') {
      // create repository directory here ---
      final repositoryDirectory = Directory('${screenNameDir.path}/repository');
      if (!repositoryDirectory.existsSync()) {
        repositoryDirectory.createSync();
      }
      // repository
      final repositoryDartInput = Input(prompt: 'Enter Repository Name: ').interact();
      // creating repository dart file
      final screenRepoDart = File('${repositoryDirectory.path}/$repositoryDartInput.dart');
      if (!screenRepoDart.existsSync()) {
        screenRepoDart.createSync(recursive: true);
        CliLogger.repositoryLog("Repository $repositoryDartInput Generated Successfully");
      }
      // repository interface
      _repositoryInterfaceFile(repositoryDirectory, repositoryDartInput);
      screenRepoDart.writeAsStringSync(generateRepository(FileCase.toPascalCase(repositoryDartInput), null));
    } else {
      CliLogger.info("Repository Skipped due to wrong input");
    }
  }

  static void _repositoryInterfaceFile(Directory repositoryDirectory, String repositoryDartInput) {
    final repositoryInterfaceDartInput = Input(prompt: 'Do you want to screen repository interface dart? (y/n): ').interact();
    if (repositoryInterfaceDartInput == "y") {
      // creating repository interface dart file
      final screenRepoDart = File('${repositoryDirectory.path}/${repositoryDartInput}_interface.dart');
      if (!screenRepoDart.existsSync()) {
        screenRepoDart.createSync(recursive: true);
        CliLogger.screenLog("Repository Generated Successfully");
      }
      screenRepoDart.writeAsStringSync(
        generateRepository(FileCase.toPascalCase(repositoryDartInput), FileCase.toPascalCase(repositoryDartInput)),
      );
      screenRepoDart.writeAsStringSync(generateRepositoryInterface(FileCase.toPascalCase("${repositoryDartInput}_interface")));
    }
  }
}
