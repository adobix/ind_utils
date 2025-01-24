
String genStyle() {
  return '''
library;

import 'package:flutter/material.dart';

part 'app_color.dart';
part 'app_edge.dart';

''';
}
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
