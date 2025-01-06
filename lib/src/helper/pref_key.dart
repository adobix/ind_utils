
String genPrefKey() {
  return '''
part of 'helper.dart';
class PrefKey {
  static const String isLogin = "isLogin";
  static const String userId = "userId";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String country = "country";
  static const String phone = "phone";
  static const String carrierCode = "carrierCode";
  static const String defaultCountry = "defaultCountry";
  static const String balance = "balance";
  static const String formattedPhone = "formattedPhone";
  static const String token = "token";
}
''';
}
