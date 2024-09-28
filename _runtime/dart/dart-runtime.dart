import 'dart:io';

void main() {
  print('Dart Runtime Environment');
  print('Dart version: ${Platform.version}');
  print('Current working directory: ${Directory.current.path}');
  print('Operating System: ${Platform.operatingSystem}');
  print('Number of processors: ${Platform.numberOfProcessors}');

  // Measure execution time
  Stopwatch stopwatch = Stopwatch()..start();

  // Add your application logic here
  // For example:
  // import 'package:my_app/app.dart';
  // App.start();

  stopwatch.stop();
  print('Execution time: ${stopwatch.elapsedMilliseconds} ms');
}

// To run: dart run runtime.dart
