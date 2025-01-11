
String toCamelCaseAssets(String p0) {
  final pascal = p0.split(RegExp(r'[_-]')).map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join('');
  return pascal[0].toLowerCase() + pascal.substring(1);
}

String toPascalCase(String p0) {
  final pascal = p0.split(RegExp(r'[_-]')).map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join('');
  return pascal;
}