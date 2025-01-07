import 'dart:io';
import '../bin/src/controller/controller_gen.dart';
import '../bin/src/theme/theme.dart';


void main() {
  themeGen();
}
void themeGen() {
  // Assets File Here
  final currentDir = Directory.current;
  final flutterProjectRoot = getFlutterProjectRoot(currentDir);
  final libDir = Directory('${flutterProjectRoot.path}/lib');

  /// Create theme directory
  final helperDir = Directory('${libDir.path}/theme');
  if (!helperDir.existsSync()) helperDir.createSync(recursive: true);

  /// Create lightThemeFile
  final lightThemeFile = File('${helperDir.path}/light_theme.dart');
  if (lightThemeFile.existsSync()) {
    lightThemeFile.createSync(recursive: true);
  }
  lightThemeFile.writeAsStringSync(lightTheme());

  /// Create darkThemeFile
  final darkThemeFile = File('${helperDir.path}/dark_theme.dart');
  if (darkThemeFile.existsSync()) {
    darkThemeFile.createSync(recursive: true);
  }
  darkThemeFile.writeAsStringSync(darkTheme());

  /// Create themeControllerFile
  final themeControllerFile = File('${helperDir.path}/theme_controller.dart');
  if (themeControllerFile.existsSync()) {
    themeControllerFile.createSync(recursive: true);
  }
  themeControllerFile.writeAsStringSync(themeController());
}
