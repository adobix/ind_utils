import 'dart:convert';

class AppLog {
  final void Function(Object object) logPrint;

  AppLog({this.logPrint = print});

  static const String whiteColor = '\x1B[37m';
  static const String redColor = '\x1B[31m';
  static const String resetColor = '\x1B[0m';

  void printURL(dynamic url) {
    _printLineURL('╔');
    logPrint('║ API URL 📌 $whiteColor$url$resetColor');
    _printLineURL('╚');
  }

  void printRes(dynamic data) {
    logPrint('${whiteColor}Response Data 💡 $resetColor');
    _printRequestBodyD(data);
  }

  void _printLineURL(String pre) {
    logPrint('$pre$whiteColor${'═' * 60}$resetColor');
  }

  void printError(dynamic data) {
    _printRequestBody(data, color: redColor);
  }

  void printMethod(dynamic method) {
    _printLineURL('╔');
    logPrint('║ ➡️ $whiteColor$method$resetColor');
    _printLineURL('╚');
  }

  void printHeader(dynamic header) {
    _printLineURL('╔');
    logPrint('║ HEADER🎩 $whiteColor$header$resetColor');
    _printLineURL('╚');
  }

  void printRq(dynamic rq) {
    _printLineURL('╔');
    logPrint('║ REQUEST DATA 🚀 $rq');
    _printLineURL('╚');
  }

  void _printRequestBodyD(dynamic data) {
    if (data != null) {
      if (data is Map) {
        _printJson(data.cast<String, dynamic>());
      } else {
        logPrint('$whiteColor${data.toString()}$resetColor');
      }
    }
  }

  void _printJson(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) return;
    String jsonString = jsonEncode(map);
    String formattedJson = _formatJson(jsonString);
    _printColoredJson(formattedJson);
    _printLine(); // Add a line after printing the JSON
  }

  String _formatJson(String json) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonDecode(json));
  }

  void _printColoredJson(String json) {
    List<String> lines = json.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (i == 0) {
        logPrint('$whiteColor║$resetColor');
      }
      logPrint('║ $whiteColor${lines[i]}$resetColor');
    }
  }

  void _printLine([String pre = '', String suf = '╝']) {
    logPrint('$pre$whiteColor${'═' * 90}$suf$resetColor');
  }

  void _printKV(String? key, Object? v, {String color = whiteColor}) {
    final pre = '$color$key$resetColor';
    final msg = v.toString();
    if (pre.length + msg.length > 90) {
      logPrint(pre);
      _printBlock(msg, color: color);
    } else {
      logPrint('$pre$msg$resetColor');
    }
  }

  void _printBlock(String msg, {String color = whiteColor}) {
    final lines = (msg.length / 90).ceil();
    for (var i = 0; i < lines; ++i) {
      logPrint(
        (i >= 0 ? '$color║$resetColor - ' : '') +
            color +
            msg.substring(
                i * 90, i * 90 + 90 > msg.length ? msg.length : i * 90 + 90) +
            resetColor,
      );
    }
  }

  void _printRequestBody(dynamic data, {String color = whiteColor}) {
    if (data != null) {
      if (data is Map) {
        _printMapAsTable(data, header: '', color: color);
      }
    }
  }

  void _printMapAsTable(Map? map, {String? header, String color = whiteColor}) {
    if (map == null || map.isEmpty) return;
    logPrint('$color║$resetColor  $header ');
    map.forEach(
        (dynamic k, dynamic v) => _printKV(k.toString(), v, color: color));
    _printLine('$color╚$resetColor ');
  }
}
