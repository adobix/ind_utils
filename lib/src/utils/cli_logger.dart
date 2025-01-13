import 'constants.dart';

enum CliLoggerLevel { one, two, three }

/// Cli Logger
class CliLogger {
  /// Constructor
  CliLogger();

  /// Log info
  static void info(String message, {CliLoggerLevel level = CliLoggerLevel.one}) {
    final space = _getSpace(level);
    print('\x1B[34m$space🌱  $message\x1B[0m');
  }

  /// Logs a error message at the given level.
  static void error(String message, {CliLoggerLevel level = CliLoggerLevel.one}) {
    final space = _getSpace(level);
    print('$space❌  $message');
  }

  /// Logs a warning message at the given level.
  static void warning(String message, {CliLoggerLevel level = CliLoggerLevel.one}) {
    final space = _getSpace(level);
    print('\x1B[33m$space🚧 $message\x1B[0m');
  }

  /// Logs a success message at the given level.
  static void success(String message, {CliLoggerLevel level = CliLoggerLevel.one}) {
    final space = _getSpace(level);
    print('\x1B[32m$space✅  $message\x1B[0m');
  }

  static void screenLog(String message) => print(screenMessage("${message.toLowerCase()}.dart"));
  static void repositoryLog(String message) => print(screenMessage(message));

  static void startedLog() => print(START_MESSAGE);

  static void controllerLog(String message) => print(controllerMessage("${message.toLowerCase()}.dart"));

  static void directoryLog(String message) => print(directoryMessage(message));
  static void endLog() => print(END_MESSAGE);

  static String _getSpace(CliLoggerLevel level) {
    var space = '';
    switch (level) {
      case CliLoggerLevel.one:
        space = '';
        break;
      case CliLoggerLevel.two:
        space = '      ';
        break;
      case CliLoggerLevel.three:
        space = '         ';
        break;
    }
    return space;
  }
}
