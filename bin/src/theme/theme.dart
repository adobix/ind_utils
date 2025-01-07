String lightTheme(){
  return '''
import 'package:flutter/material.dart';

ThemeData light({Color? primaryColor, Color? secondaryColor}){
  return ThemeData(
    primaryColor: primaryColor ?? const Color(0xFF483c3c),
    brightness: Brightness.light,
    highlightColor: Colors.white,
    hintColor: const Color(0xFF9E9E9E),
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF483c3c),
      secondary: const Color(0xFF483c3c),
      tertiary: const Color(0xFFF9D4A8),
      tertiaryContainer: const Color(0xFFADC9F3),
      onTertiaryContainer: const Color(0xFF33AF74),
      onPrimary: const Color(0xFF7FBBFF),
      surface: const Color(0xFFF4F8FF),
      onSecondary: secondaryColor ?? const Color(0xFFF88030),
      error: const Color(0xFFFF5555),
      onSecondaryContainer: const Color(0xFFF3F9FF),
      outline: const Color(0xFF483c3c),
      onTertiary: const Color(0xFFE9F3FF),
      primaryContainer: const Color(0xFF9AECC6),
      secondaryContainer: const Color(0xFFF2F2F2),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),
  );
}
  ''';
}

String darkTheme(){
  return '''
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  primaryColor: const Color(0xFF483c3c),
  brightness: Brightness.dark,
  highlightColor: const Color(0xFF252525),
  hintColor: const Color(0xFFc7c7c7),
  cardColor: const Color(0xFF242424),
  scaffoldBackgroundColor: const Color(0xFF000000),
  splashColor: Colors.transparent,
  colorScheme : const ColorScheme.dark(
    primary: Color(0xFF483c3c),
    secondary: Color(0xFF78BDFC),
    tertiary: Color(0xFF865C0A),
    tertiaryContainer: Color(0xFF6C7A8E),
    surface: Color(0xFF2D2D2D),
    onPrimary: Color(0xFFB7D7FE),
    onTertiaryContainer: Color(0xFF0F5835),
    primaryContainer: Color(0xFF208458),
    onSecondaryContainer: Color(0x912A2A2A),
    outline: Color(0xFF483c3c),
    onTertiary: Color(0xFF545252),
    secondaryContainer: Color(0xFFF2F2F2),),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xFFE9EEF4))),

  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
  ''';
}
String themeController(){
  return '''
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier {
  final SharedPreferences? sharedPreferences;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences!.setBool(AppConstants.theme, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences!.getBool(AppConstants.theme) ?? false;
    notifyListeners();
  }

  Color? selectedPrimaryColor;
  Color? selectedSecondaryColor;

  void setThemeColor({Color? primaryColor, Color? secondaryColor}) {
    selectedPrimaryColor = primaryColor;
    selectedPrimaryColor = secondaryColor;
    notifyListeners();
  }
}
''';
}