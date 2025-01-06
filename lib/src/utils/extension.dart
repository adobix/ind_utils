import 'dart:math';

import 'package:flutter/material.dart';

extension Context on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get h => mediaQuerySize.height;

  double get w => mediaQuerySize.width;
}

extension DurationUtils on Duration {
  ///  await Duration(seconds: 1).delay();
  Future<void> get delay => Future.delayed(this);
}

extension StyleExtension on BuildContext {
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  Color? get primary => Theme.of(this).primaryColor;

  Color? get cardColor => Theme.of(this).cardColor;
}

extension INDNum on num {
  Duration get microseconds => Duration(microseconds: round());

  Duration get ms => (this * 1000).microseconds;

  Duration get milliseconds => (this * 1000).microseconds;

  Duration get seconds => (this * 1000 * 1000).microseconds;

  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;

  /// Space between two widget horizontally
  Widget get wBox => SizedBox(width: toDouble());

  /// Space between two widget Vertical
  Widget get hBox => SizedBox(height: toDouble());

  Widget get sqBox => SizedBox(height: toDouble(), width: toDouble());

  /// Square Value and also increase power of any value
  num powValue({num v = 2}) => pow(this, v);

  /// Change value of Meter to Feet of Any Number
  double mToFeet() => this * 3.28084;

  /// Change value of Feet to Meter of Any Number
  double fToMeter() => this / 3.28084;

  /// num long
  int get length => toString().length;

  /// Returns number of digits in this number
  int get numberOfDigits => toString().length;

  /// Returns if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns if the number is positive
  bool get isPositive => this > 0;

  /// Returns if the number is negative
  bool get isNegative => this < 0;
}

extension INDBoxConstraints on BoxConstraints {
  /// Check is it Tablet
  bool get isTablet => maxWidth > 730;

  /// Check is it isDesktop
  bool get isDesktop => maxWidth > 1200;

  /// Check is it isMobile
  bool get isMobile => !isTablet && !isDesktop;
}

extension DoubleUtils on dynamic {
  /// Make Double of dynamic Value
  double makeDouble() {
    if (this == null) {
      return 0.0;
    }
    if (this is String && this.isNotEmpty) {
      try {
        return double.parse(this);
      } catch (e) {
        var list = this.split(" ");
        if (list.isNotEmpty) {
          return double.parse(list.first.isEmpty ? "0" : list.first);
        }
      }
    } else if (this is int) {
      return this.toDouble();
    } else if (this is double) {
      return this;
    }
    return 0.0;
  }

  double getPercentage(num? value, num? percentage) {
    if (value != null && percentage != null) {
      return (value * percentage) / 100;
    }
    return 0;
  }

  double valuePercentage(num? amount, num? originalValue) {
    if (amount != null && originalValue != null && originalValue != 0) {
      return (amount / originalValue) * 100;
    }
    return 0;
  }

  int makeInt() {
    if (this is String && this.isNotEmpty) {
      return int.parse(this);
    } else if (this is double) {
      return this.toInt();
    } else if (this is int) {
      return this;
    } else if (this is bool) {
      return this ? 1 : 0;
    }
    return 0;
  }

  String distanceFormat() {
    String distanceStr = "0";
    if (this != null) {
      var kmDis = makeDouble();
      distanceStr = kmDis < 1 ? "1" : kmDis.toStringAsFixed(2);
    }
    return "$distanceStr KM";
  }
}

extension BoxExtension on Widget {
  pSym(double h, double v) => EdgeInsets.symmetric(horizontal: h, vertical: v);

  pAll(a) => EdgeInsets.all(a);

  Widget pall({double a = 0.0}) => Padding(padding: pAll(a), child: this);

  Widget sym({double h = 0.0, double v = 0.0}) =>
      Padding(padding: pSym(h, v), child: this);

  Widget p0({
    double t = 0.0,
    double l = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: t, bottom: b, left: l, right: r),
      child: this,
    );
  }
}
