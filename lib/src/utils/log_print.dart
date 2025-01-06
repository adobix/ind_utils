import 'dart:convert';

import 'package:flutter/foundation.dart';

class PrintLog {
  final String message;
  final dynamic data;

  PrintLog(this.message, this.data);

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
    if (data == null) {
      int length = logMessage.length;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $message');
      debugPrint('⊸${'⊸' * length}');
      return;
    }

    if (data.runtimeType == String) {
      String d = data;
      if (d.isEmpty) {
        return;
      }
      int length = logMessage.length + d.length + 5;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $logMessage $data ');
      debugPrint('⊸${'⊸' * length}');
      return logMessage;
    }
    if (data is Map) {
      debugModePrint('⊸' * 90);
      debugPrint('⤒ $logMessage ');
      _printJson(data);
      return logMessage;
    }

    void _printListJson(List dataList) {
      if (dataList.isEmpty) return;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i] is Map) {
          debugModePrint('List item $i:');
          _printJson(dataList[i]);
        } else {
          debugModePrint('List item $i: ${dataList[i]}');
        }
      }
      debugModePrint('⊸' * 90);
      return;
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

  debugModePrint(_) {
    if (kDebugMode) {
      print(_);
    }
  }
}

PrintLog printLog(String message, [dynamic data = '']) {
  return PrintLog(message, data);
}
