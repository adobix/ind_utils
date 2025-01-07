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

extension INDNum on num {
  Widget get wBox => SizedBox(width: toDouble());

  Widget get hBox => SizedBox(height: toDouble());
}
