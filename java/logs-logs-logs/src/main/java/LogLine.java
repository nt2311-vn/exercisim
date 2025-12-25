public class LogLine {
  private final LogLevel logLevel;
  private final String shortOutput;

  public LogLine(String logLine) {
    String logLevel = logLine.substring(1, 4);
    String logMessage = logLine.substring(7);

    switch (logLevel) {
      case "TRC":
        this.logLevel = LogLevel.TRACE;
        this.shortOutput = "1:" + logMessage;
        break;
      case "DBG":
        this.logLevel = LogLevel.DEBUG;
        this.shortOutput = "2:" + logMessage;
        break;
      case "INF":
        this.logLevel = LogLevel.INFO;
        this.shortOutput = "4:" + logMessage;
        break;
      case "WRN":
        this.logLevel = LogLevel.WARNING;
        this.shortOutput = "5:" + logMessage;
        break;
      case "ERR":
        this.logLevel = LogLevel.ERROR;
        this.shortOutput = "6:" + logMessage;
        break;
      case "FTL":
        this.logLevel = LogLevel.FATAL;
        this.shortOutput = "42:" + logMessage;
        break;
      default:
        this.logLevel = LogLevel.UNKNOWN;
        this.shortOutput = "0:" + logMessage;
        break;
    }
  }

  public LogLevel getLogLevel() {
    return this.logLevel;
  }

  public String getOutputForShortLog() {
    return this.shortOutput;
  }
}
