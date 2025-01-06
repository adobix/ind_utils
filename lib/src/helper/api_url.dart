String genApiUrl() {
  return '''part of 'helper.dart';
  
class APIUrl {
  const APIUrl._();
  static const String baseUrl = "https://api.example.com";
  // auth
  static const String auth = "/login";
  static const String signup = "/signup";
}''';
}
