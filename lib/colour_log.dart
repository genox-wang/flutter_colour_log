library colour_log;

const String ANSI_RESET = "\u001B[0m";
const String ANSI_GREEN = "\u001B[32m";
const String ANSI_BLACK_BRIGHT = "\u001B[90m";
const String ANSI_RED_BACKGROUND = "\u001B[41m";
const String ANSI_YELLOW_BRIGHT_BACKGROUND = "\u001B[103m";

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

  void d(sender, Object object) {
    if (logLevel.index > LogLevel.DEBUG.index) return;
    String msg = "$ANSI_BLACK_BRIGHT[${datetime()}] ${formatSender(sender)} $object$ANSI_RESET";
    print(msg);
  }

  void i(sender, Object object) {
    if (logLevel.index > LogLevel.INFO.index) return;
    String msg = "$ANSI_GREEN[${datetime()}] ${formatSender(sender)} $object$ANSI_RESET";
    print(msg);
  }

  void w(sender, Object object) {
    if (logLevel.index > LogLevel.WARN.index) return;
    String msg = "$ANSI_YELLOW_BRIGHT_BACKGROUND[${datetime()}] ${formatSender(sender)} $object$ANSI_RESET";
    print(msg);
  }

  void e(sender,Object object) {
    if (logLevel.index > LogLevel.ERROR.index) return;
    String msg = "$ANSI_RED_BACKGROUND[${datetime()}] ${formatSender(sender)} $object$ANSI_RESET";
    print(msg);
  }

  String datetime() {
    return DateTime.now().toString();
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
