library colour_log;
import 'package:intl/intl.dart';

// const String ANSI_RESET = "\u001B[0m";
// const String ANSI_GREEN = "\u001B[32m";
// const String ANSI_BLACK_BRIGHT = "\u001B[90m";
// const String ANSI_RED_BACKGROUND = "\u001B[41m";
// const String ANSI_YELLOW_BRIGHT_BACKGROUND = "\u001B[103m";

enum LogLevel {
  DEBUG,
  INFO,
  WARN,
  ERROR,
}

/// A Logger.
/// 
/// ```
///   var log = Logger(LogLevel.INFO);
///   log.d("debug"); // will not show
///   log.i("info");
///   log.e("warn");
///   log.e("error");
/// ```
///  create a logger instance with log level, and enjoy yourself ! 
class Logger {

  Logger({
    logLevel = LogLevel.DEBUG
  }) 
  :assert(logLevel != null),
  _logLevel = logLevel;


  /// log level
  LogLevel _logLevel;

  get logLevel => _logLevel;

  /// log level [LogLevel] 
  set logLevel(LogLevel level) {
    assert(level != null);
    logLevel = level;
  }

  /// print debug log
  /// sender can be a instance, String or null, normally `this` recommended
  /// 
  /// ```
  ///  logger.d(this, "debug log");
  /// ```
  void d(sender, Object object) {
    if (logLevel.index > LogLevel.DEBUG.index) return;
    String msg = "DEBUG [${datetime()}] ${formatSender(sender)} $object";
    print(msg);
  }

  /// print info log
  /// sender can be a instance, String or null, normally `this` recommended
  /// 
  /// ```
  ///  logger.i(this, "info log");
  /// ```
  void i(sender, Object object) {
    if (logLevel.index > LogLevel.INFO.index) return;
    String msg = "INFO [${datetime()}] ${formatSender(sender)} $object";
    print(msg);
  }

  /// print warn log
  /// sender can be a instance, String or null, normally `this` recommended
  /// 
  /// ```
  ///  logger.w(this, "warn log");
  /// ```
  void w(sender, Object object) {
    if (logLevel.index > LogLevel.WARN.index) return;
    String msg = "WARN [${datetime()}] ${formatSender(sender)} $object";
    print(msg);
  }

  /// print debug log
  /// sender can be a instance, String or null, normally `this` recommended
  /// 
  /// ```
  ///  logger.e(this, "error log");
  /// ```
  void e(sender,Object object) {
    if (logLevel.index > LogLevel.ERROR.index) return;
    String msg = "ERROR [${datetime()}] ${formatSender(sender)} $object";
    print(msg);
  }

  String datetime() {
    return DateFormat('yy-MM-dd HH:mm:ss').format(new DateTime.now());
  }

  String formatSender(sender) {
    if (sender == null) {
      return "";
    }
    if (sender is String) {
      return sender;
    }
    return sender.runtimeType.toString();
  }
}
