import 'package:ind_utils/src/generator/style_generator.dart';
import 'package:ind_utils/src/logs/cli_logger.dart';
import 'dart:io';

void main() {
  // Start logging
  CliLogger.startedLog();
  final currentDirectory = Directory(Directory.current.path);
  // Generate the styles structure and files
  StyleGenerator.generateStyles(currentDirectory);
  // End logging
  CliLogger.endLog();
}