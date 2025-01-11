import 'dart:io';

/// Converts a string to snake_case
String toSnakeCase(String p0) {
  return p0
      .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (Match match) => '${match.group(1)}_${match.group(2)}')
      .toLowerCase();
}

/// Converts a string to camelCase
String toCamelCaseForWidget(String input) {
  final pascal = input.split('_').map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join('');
  return pascal[0].toLowerCase() + pascal.substring(1);
}

String toCamelCaseAssets(String p0) {
  final pascal = p0.split(RegExp(r'[_-]')).map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join('');
  return pascal[0].toLowerCase() + pascal.substring(1);
}

String toPascalCase(String p0) {
  final pascal = p0.split(RegExp(r'[_-]')).map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join('');
  return pascal;
}