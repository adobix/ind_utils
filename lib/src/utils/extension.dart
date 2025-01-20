part of '../../ind_utils.dart';

extension Context on BuildContext {
  /// Get MediaQuery size
  Size get mediaQuerySize => MediaQuery.of(this).size;

  /// Get MediaQuery height
  double get h => mediaQuerySize.height;

  /// Get MediaQuery width
  double get w => mediaQuerySize.width;
}

extension INDNum on num {
  /// Space between two widget horizontally
  Widget get wBox => SizedBox(width: toDouble());

  /// Space between two widget Vertical
  Widget get hBox => SizedBox(height: toDouble());
}
