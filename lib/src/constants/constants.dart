// ignore_for_file: constant_identifier_names

const String importTxtFile = "import 'package:flutter/material.dart';";

const String START_MESSAGE = '''
┌───────────────────────────────────────────────────────────────────┐
│ Package:  │ Ind_utils                                             │
└───────────────────────────────────────────────────────────────────┘''';
 String controllerMessage(String name)=> '''
┌────────────────────────────────────────────────────────────────────────
│  ✅  $name Controller Created Successfully\x1B[0m                  
└────────────────────────────────────────────────────────────────────────''';
 String screenMessage(String name)=> '''
┌────────────────────────────────────────────────────────────────────────
│  ✅  $name Screen Created Successfully\x1B[0m                     
└─────────────────────────────────────────────────────────────────────────''';
 String directoryMessage(String name)=> '''
┌─────────────────────────────────────────────────────────────────────────
│  ✅  $name Directory Created Successfully\x1B[0m                     
└─────────────────────────────────────────────────────────────────────────''';

const String END_MESSAGE = '''
==> 🎉 GENERATE Generated Files SUCCESSFULLY 🎉 <==

🙏 If this package helped you, please don't forget to
Give a 👍 on Pub.dev https://pub.dev/packages/Ind_utils
Give a ⭐️ on GitHub https://github.com/ansaralisah/ind_utils

                💚 THANK YOU! 💚
''';

String genAppEdge() {
 return '''
part of 'styles.dart';
class AppEdge {
  AppEdge._();
  static EdgeInsets sym({double v = 0, double h = 0}) {
    return EdgeInsets.symmetric(vertical: v, horizontal: h);
  }
  static EdgeInsets all({required double a}) {
    return EdgeInsets.all(a);
  }
  static EdgeInsets eOnly({double l = 0, double r = 0, double t = 0, double b = 0}) {
    return EdgeInsets.only(left: l, right: r, top: t, bottom: b);
  }
}
extension SizedExtensions on num {
  Widget get wBox => SizedBox(width: toDouble());
  Widget get hBox => SizedBox(height: toDouble());
}
''';
}
String genAppColor() {
 return '''
part of 'styles.dart';
class AppColors {
  ///Primary
  static const Color primary = Color(0xff1E2C67);
  static const Color darkPrimary = Color(0xff151C2E);
  ///BgColor
  static const Color bgColor = Color(0xfff3f4f6);
  static const Color lightColor = Color(0xffF6F9FE);
  static const Color white = Colors.white;
  static const Color red = Colors.red;
}
''';
}
