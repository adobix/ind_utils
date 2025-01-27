import 'print_utils.dart';

class PrintLog {
  final String message;
  final dynamic res;
  const PrintLog(this.message, this.res);
  /// Warning log
  String get warning => _print('⚠️');
  /// Denied log
  String get denied => _print('🚫');
  /// Error log
  String get error => _print('❌');
  /// Success log
  String get success => _print('✅');
  String _print(String emoji) {
    final logMessage = '$emoji $message';

    /// Handle null response
    if (res == null) {
      PrintUtils.printFrame(logMessage, messageOnly: true);
      return logMessage;
    }

    /// Handle string response
    if (res is String && res.isNotEmpty) {
      PrintUtils.printFrame('$logMessage $res');
      return logMessage;
    }

    /// Handle list response
    if (res is List) {
      PrintUtils.printFrame(logMessage);
      PrintUtils.printList(res);
      return logMessage;
    }

    /// Handle map response
    if (res is Map) {
      PrintUtils.printFrame(logMessage);
      PrintUtils.printJson(res);
      return logMessage;
    }

    return logMessage;
  }
}
