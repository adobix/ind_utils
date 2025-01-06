import 'dart:io';
import 'package:ind_utils/src/features/screen/screen_controller_gen.dart';
import 'package:ind_utils/src/helper/helper.dart';

void main() {
  helperGen();
}
void helperGen() {
  // Assets File Here
  final currentDir = Directory.current;
  final flutterProjectRoot = getFlutterProjectRoot(currentDir);
  final libDir = Directory('${flutterProjectRoot.path}/lib');

  /// Create helper directory in src file
  final helperDir = Directory('${libDir.path}/src/helper');
  if (!helperDir.existsSync()) helperDir.createSync(recursive: true);

  /// Create Helper dart file with some import of helper
  final helperFile = File('${helperDir.path}/helper.dart');
  if (helperFile.existsSync()) {
    helperFile.createSync(recursive: true);
  }
  helperFile.writeAsStringSync(genHelper());

  /// Create SharedPreference dart file with some examples in src/helper directory
  final prefKye = File('${helperDir.path}/helper.dart');
  if (prefKye.existsSync()) {
    prefKye.createSync(recursive: true);
  }
  prefKye.writeAsStringSync(genPrefKey());


  /// Create api status dart file with some examples in src/helper directory
  final apiStatus = File('${helperDir.path}/api_status.dart');
  if (apiStatus.existsSync()) {
    apiStatus.createSync(recursive: true);
  }
  apiStatus.writeAsStringSync(genApiStatus());

  /// Create api api url dart file with some examples in src/helper directory
  final apiUrl = File('${helperDir.path}/api_url.dart');
  if (apiUrl.existsSync()) {
    apiUrl.createSync(recursive: true);
  }
  apiUrl.writeAsStringSync(genApiUrl());

}
