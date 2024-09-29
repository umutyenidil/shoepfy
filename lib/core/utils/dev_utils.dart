import 'dart:developer' as dev;

class DevUtils {
  DevUtils._();

  static void log([String? message]) {
    dev.log("FROM: ${_getCurrentMethodName()}");
    if (message != null) dev.log("MESSAGE: $message");
  }

  static String _getCurrentMethodName() {
    final frames = StackTrace.current.toString().split('\n');
    final frame = frames.elementAtOrNull(2);
    if (frame != null) {
      final tokens = frame.split(" ");
      final methodName = tokens.elementAtOrNull(tokens.length - 2);
      if (methodName != null) {
        return methodName;
      }
    }

    return '';
  }
}
