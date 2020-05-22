void main() {
  final myLogger = SimpleLogger();
  final myLogger2 = SimpleLogger();
  print(myLogger == myLogger2); // prints true
}

class SimpleLogger {
  static SimpleLogger logger; // our single instance's representation
  factory SimpleLogger() {
    SimpleLogger.logger ??= SimpleLogger._internal();
    return SimpleLogger.logger;
  }
  SimpleLogger._internal(); // a private constructor
  void log(Object o) {
    print(o);
  }
}
