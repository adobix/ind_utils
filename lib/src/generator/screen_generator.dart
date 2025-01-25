import 'dart:io';
import 'package:ind_utils/src/constants/file_case.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';
import 'package:interact/interact.dart';
import '../constants/constants.dart';

/// A class to handle the creation of various screen-related files such as controllers,
/// widgets, models, and repositories.
class ScreenGenerator {
  /// This method handles the file generation for a new screen.
  static Future<void> generateScreenFiles(String screenName) async {
    final screenNameDir = Directory('${Directory.current.path}/${screenName.toLowerCase()}');

    // Ask user for file generation options
    await _askForController(screenName, screenNameDir);
    await _askForWidgets(screenName, screenNameDir);
    await _askForModel(screenName, screenNameDir);
    await _askForRepository(screenName, screenNameDir);
    CliLogger.endLog();
  }

  /// Ask the user whether to create a controller, and generate it if needed.
  static Future<void> _askForController(String screenName, Directory screenNameDir) async {
    final controllerInput = await _getUserInput('Do you want to provide a controller? (y/n): ');
    if (controllerInput == 'y') {
      await _createController(screenName, screenNameDir);
    } else {
      CliLogger.info("Controller Skipped.");
    }
  }

  /// Ask the user whether to create a widget directory and widget files.
  static Future<void> _askForWidgets(String screenName, Directory screenNameDir) async {
    final widgetInput = await _getUserInput('Do you want Widget Directory? (y/n): ');
    if (widgetInput == 'y') {
      await _createWidgets(screenName, screenNameDir);
    } else {
      CliLogger.info("Widget Skipped.");
    }
  }

  /// Ask the user whether to create a model directory.
  static Future<void> _askForModel(String screenName, Directory screenNameDir) async {
    final modelInput = await _getUserInput('Do you want to Model Directory? (y/n): ');
    if (modelInput == 'y') {
      await _createModel(screenName, screenNameDir);
    } else {
      CliLogger.info("Model Skipped.");
    }
  }

  /// Ask the user whether to create a repository and generate the necessary files.
  static Future<void> _askForRepository(String screenName, Directory screenNameDir) async {
    final repositoryInput = await _getUserInput('Do you want to provide repository? (y/n): ');
    if (repositoryInput == 'y') {
      await _createRepository(screenName, screenNameDir);
    } else {
      CliLogger.info("Repository Skipped.");
    }
  }

  /// Create a controller for the screen.
  static Future<void> _createController(String screenName, Directory screenNameDir) async {
    final controllerName = await _getUserInput('Enter the controller name: ');
    final controllerDirectory = Directory('${screenNameDir.path}/controller');
    if (!controllerDirectory.existsSync()) {
      controllerDirectory.createSync();
    }
    final controllerFile = File('${controllerDirectory.path}/$controllerName.dart');
    var controller = FileCase.toPascalCase(controllerName);
    controllerFile.writeAsStringSync("$importTxtFile\nclass $controller extends ChangeNotifier {\n}");
    CliLogger.controllerLog(controllerName);
  }

  /// Create widget files for the screen.
  static Future<void> _createWidgets(String screenName, Directory screenNameDir) async {
    final widgetDir = Directory('${screenNameDir.path}/widgets');
    if (!widgetDir.existsSync()) {
      widgetDir.createSync();
      CliLogger.repositoryLog("Widget Directory Generated Successfully.");
    }
    final widgetName = await _getUserInput('Enter Your Widget Name: ');
    final widgetFile = File('${screenNameDir.path}/widgets/$widgetName.dart');
    if (!widgetFile.existsSync()) {
      widgetFile.createSync(recursive: true);
      CliLogger.screenLog("$widgetName Generated Successfully.");
    }
  }

  /// Create a model directory for the screen.
  static Future<void> _createModel(String screenName, Directory screenNameDir) async {
    final modelDir = Directory('${screenNameDir.path}/model');
    if (!modelDir.existsSync()) {
      modelDir.createSync();
      CliLogger.repositoryLog("Model Directory Generated Successfully.");
    }
  }

  /// Create repository files for the screen.
  static Future<void> _createRepository(String screenName, Directory screenNameDir) async {
    final repositoryDir = Directory('${screenNameDir.path}/repository');
    if (!repositoryDir.existsSync()) {
      repositoryDir.createSync();
    }
    final repositoryName = await _getUserInput('Enter Repository Name: ');
    final repositoryFile = File('${repositoryDir.path}/$repositoryName.dart');
    if (!repositoryFile.existsSync()) {
      repositoryFile.createSync(recursive: true);
      CliLogger.repositoryLog("Repository $repositoryName Generated Successfully.");
    }
    await _createRepositoryInterface(repositoryDir, repositoryName);
    repositoryFile.writeAsStringSync("class ${FileCase.toPascalCase(repositoryName)} {\n}");
  }

  /// Create a repository interface if requested by the user.
  static Future<void> _createRepositoryInterface(Directory repositoryDir, String repositoryName) async {
    final interfaceInput = await _getUserInput('Do you want to create a repository interface? (y/n): ');
    if (interfaceInput == 'y') {
      final interfaceFile = File('${repositoryDir.path}/${repositoryName}_interface.dart');
      if (!interfaceFile.existsSync()) {
        interfaceFile.createSync(recursive: true);
        CliLogger.screenLog("Repository Interface Generated Successfully.");
      }
      interfaceFile.writeAsStringSync("abstract class ${FileCase.toPascalCase('${repositoryName}_interface')} {\n\n}");
    }
  }

  /// Helper method to interact with the user and get input.
  static Future<String> _getUserInput(String prompt) async {
    final input = Input(prompt: prompt).interact();
    return input.trim().toLowerCase();
  }
}
