import 'dart:convert';
import 'package:flutter/foundation.dart';

class PrintUtils {
  /// Print a frame around the message
  static void printFrame(String message, {bool messageOnly = false}) {
    int length = message.length;
    debugPrint('⊸${'⊸' * length}');
    debugPrint('⤒ $message');
    if (!messageOnly) {
      debugPrint('⊸${'⊸' * length}');
    }
  }

  /// Print JSON in a formatted way
  static void printJson(Map map) {
    if (map.isEmpty) return;

    String jsonString = jsonEncode(map);
    String formattedJson = _formatJson(jsonString);
    _printColoredJson(formattedJson);
    debugPrint('⊸' * 90);
  }

  /// Format JSON with indentation
  static String _formatJson(String json) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonDecode(json));
  }

  /// Print JSON with colored formatting
  static void _printColoredJson(String json) {
    for (var line in json.split('\n')) {
      debugModePrint('⤒ $line');
    }
  }

  /// Print a list in a formatted way
  static void printList(List list) {
    for (var item in list) {
      if (item is Map) {
        printJson(item);
      } else {
        debugPrint('⤒  $item');
      }
    }
  }

  /// Debug mode printing
  static void debugModePrint(dynamic message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
