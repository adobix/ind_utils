import 'dart:io';
import 'package:ind_utils/src/manager/directory_manager.dart';
import 'package:ind_utils/src/manager/file_writer_manger.dart';
import 'package:ind_utils/src/print_log/cli_logger.dart';
import 'package:interact/interact.dart';

void main() {
  // Start Log
  CliLogger.startedLog();
  try {
    // Inserting assets image process
    CliLogger.info('Checking and inserting assets images...\n');
    final assetsDirectory = DirectoryManager.getAssetsDirectory();
    // Get all subdirectories of the 'assets' directory recursively
    final subdirectories = DirectoryManager.getSubdirectories(assetsDirectory);
    if (subdirectories.isEmpty) {
      CliLogger.error('No subdirectories found in the assets folder.', level: CliLoggerLevel.two);
      exit(1);
    }
    // Get input for the file location
    final fileLocationInput = Input(prompt: 'Enter the file path to create app_assets.dart: ').interact();
    final targetDirectory = DirectoryManager.getTargetDirectory(Directory.current, fileLocationInput);
    // Generate the assets dart file
    FileWriter.generateAssetsDartFile(targetDirectory, assetsDirectory, subdirectories);
    // End message
    CliLogger.endLog();
  } catch (e) {
    CliLogger.error('An error occurred: $e', level: CliLoggerLevel.one);
    exit(1);
  }
}
