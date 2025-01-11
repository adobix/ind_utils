import 'dart:convert';
import 'package:flutter/foundation.dart';

class PrintLog {
  final String message;
  final dynamic res;

  PrintLog(this.message, this.res);

  String get microphone => _print('🎤');

  String get fileFolder => _print('📁');

  String get briefcase => _print('💼');

  String get mobilePhone => _print('📱');

  String get link => _print('🔗');

  String get dollar => _print('💵');

  String get rupee => _print('₹');

  String get battery => _print('🔋');

  String get method => _print('⚙️');

  String get header => _print('📝');

  String get warning => _print('⚠️');

  String get notification => _print('🔔');

  String get info => _print('ℹ️');

  String get voice => _print('🗣️');

  String get denied => _print('🚫');

  String get failed => _print('🚨');

  String get request => _print('📡');

  String get token => _print('🔑');

  String get error => _print('❌');

  String get success => _print('✅');

  String get stop => _print('⛔');

  _print(String emoji) {
    final logMessage = '$emoji $message';
    if (res == null) {
      int length = logMessage.length;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $message');
      debugPrint('⊸${'⊸' * length}');
      return;
    }

    if (res.runtimeType == String) {
      String d = res;
      if (d.isEmpty) {
        return;
      }
      int length = logMessage.length + d.length + 5;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $logMessage $res ');
      debugPrint('⊸${'⊸' * length}');
      return logMessage;
    }
    if (res is Map) {
      debugModePrint('⊸' * 90);
      debugPrint('⤒ $logMessage ');
      _printJson(res);
      return logMessage;
    }
    return logMessage;
  }

  void _printJson(Map map) {
    if (map.isEmpty) return;
    String jsonString = jsonEncode(map);
    String formattedJson = _formatJson(jsonString);
    _printColoredJson(formattedJson);
    debugModePrint('⊸' * 90);
  }

  String _formatJson(String json) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonDecode(json));
  }

  void _printColoredJson(String json) {
    List<String> lines = json.split('\n');
    for (int i = 0; i < lines.length; i++) {
      debugModePrint('⤒ ${lines[i]}');
    }
  }
  debugModePrint(p0) {
    if (kDebugMode) {
      print(p0);
    }
  }
}

PrintLog printLog(String message, [dynamic data = '']) {
  return PrintLog(message, data);
}
