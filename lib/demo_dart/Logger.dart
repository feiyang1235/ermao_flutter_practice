class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front
  // of its name.
  static final Map<String, Logger> _cache =
  <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._a(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._a(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
  void main() {
    var p1 = new Logger("1");
    p1.log("2");


    var p2 = new Logger("11");
    p2.log("21");

  }
}