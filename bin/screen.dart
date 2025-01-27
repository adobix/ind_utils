import 'package:ind_utils/src/print_log/cli_logger.dart';
import 'package:ind_utils/src/manager/directory_manager.dart';
import 'package:interact/interact.dart';

void main() {
  // Start logging
  CliLogger.startedLog();
  // Display info message
  CliLogger.info('Ready to create Dart files based on structures...\n');
  // Prompt user for screen name
  final screenName = Input(prompt: 'Enter screen Name: ').interact();
  // Generate the directory structure and files
  DirectoryManager.createStructure(screenName);
  // End logging
}