
String genPrefKey() {
  return '''
part of 'helper.dart';
class PrefKey {
  static const String isLogin = "isLogin";
  static const String userId = "userId";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String token = "token";
}
''';
}


String genApiUrl(){
  return '''part of 'helper.dart';
class APIUrl {
  const APIUrl._();
  static const String baseUrl = "https://api.example.com";
  // auth
  static const String auth = "/login";
  static const String signup = "/signup";
}''';
}
String genApiStatus(){
  return '''
  part of 'helper.dart';
enum ApiStatus { loading, completed, error }

''';
}

String genHelper(){
  return '''
library;

part 'helper.dart';
part 'api_url.dart';
part 'api_status.dart';

''';
}