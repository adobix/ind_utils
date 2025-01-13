import 'dart:convert';
import 'package:flutter/foundation.dart';

/// printLog here ------
PrintLog printLog(String message, [dynamic data = '']) => PrintLog(message, data);

class PrintLogger {
  /// success
  success(dynamic message) {
    printLog('Success', message).success;
  }

  /// error
  error(dynamic message) {
    printLog('Error', message).error;
  }

  /// warning
  warning(dynamic message) {
    printLog('Warning', message).warning;
  }

  /// denied
  denied(dynamic message) {
    printLog('Permission Denied', message).denied;
  }
}

class PrintLog {
  final String message;
  final dynamic res;

  PrintLog(this.message, this.res);

  /// warning here ---
  String get warning => _print('⚠️');

  /// denied print ---
  String get denied => _print('🚫');

  /// error print ---
  String get error => _print('❌');

  /// success print --
  String get success => _print('✅');

  _print(String emoji) {
    final logMessage = '$emoji $message';

    /// if res is null
    if (res == null) {
      int length = logMessage.length;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $message');
      debugPrint('⊸${'⊸' * length}');
      return;
    }

    /// if res is String
    if (res is String) {
      String d = res;
      if (res.isEmpty) {
        return;
      }
      int length = logMessage.length + d.length + 5;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $logMessage $res ');
      debugPrint('⊸${'⊸' * length}');
      return logMessage;
    }

    /// if res is List
    if (res is List) {
      int length = logMessage.length;
      debugPrint('⊸${'⊸' * length}');
      debugPrint('⤒ $logMessage ');
      _printList(res);
      debugPrint('⊸${'⊸' * length}');
      return logMessage;
    }

    /// if res is Map
    if (res is Map) {
      debugModePrint('⊸' * 90);
      debugPrint('⤒ $logMessage ');
      _printJson(res);
      return logMessage;
    }
    return logMessage;
  }

  /// print as json format
  void _printJson(Map map) {
    if (map.isEmpty) return;
    String jsonString = jsonEncode(map);
    String formattedJson = _formatJson(jsonString);
    _printColoredJson(formattedJson);
    debugModePrint('⊸' * 90);
  }

  /// Convert in formatJson
  String _formatJson(String json) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonDecode(json));
  }

  ///
  void _printColoredJson(String json) {
    List<String> lines = json.split('\n');
    for (int i = 0; i < lines.length; i++) {
      debugModePrint('⤒ ${lines[i]}');
    }
  }

  /// print as list format
  void _printList(List list) {
    for (var item in list) {
      if (item is Map) {
        _printJson(item);
      } else {
        debugPrint('⤒  $item');
      }
    }
  }

  /// final print here---
  debugModePrint(m0) {
    if (kDebugMode) {
      print(m0);
    }
  }
}
