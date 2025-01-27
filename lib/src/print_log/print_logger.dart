import 'print_log.dart';

/// Deprecated printLog function
@Deprecated('Use PrintLogger instead.')
PrintLog printLog(String message, [dynamic data = '']) => PrintLog(message, data);

class PrintLogger {
  const PrintLogger._();

  /// Log success
  static void success(dynamic message) {
    PrintLog('Success', message).success;
  }

  /// Log error
  static void error(dynamic message) {
    PrintLog('Error', message).error;
  }

  /// Log warning
  static void warning(dynamic message) {
    PrintLog('Warning', message).warning;
  }

  /// Log denied
  static void denied(dynamic message) {
    PrintLog('Permission Denied', message).denied;
  }
}
