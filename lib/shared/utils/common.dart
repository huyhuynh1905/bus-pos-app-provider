import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

void customLog(String message) {
  var tag = "AAAAAAAAAA";

  if (Platform.isAndroid) {
    // On Android, use ANSI escape codes
    const String redColorCode = '\x1B[31m';
    const String resetColorCode = '\x1B[0m';
    debugPrint('$redColorCode$tag   $message$resetColorCode');
  } else {
    debugPrint('$tag: $message');
  }
}

void measureTime(void Function() action) {
  final stopwatch = Stopwatch()..start();
  action();
  stopwatch.stop();
  customLog('Time elapsed: ${stopwatch.elapsedMilliseconds} milliseconds');
}

