import 'package:test/test.dart';

void main() {
  group('Example tests', () {
    test('Addition test', () {
      expect(2 + 2, equals(4));
    });

    test('String concatenation test', () {
      expect('Hello, ' + 'World!', equals('Hello, World!'));
    });

    test('Async test', () async {
      var value = await Future.value(42);
      expect(value, equals(42));
    });
  });

  // Custom test runner
  print('Running Dart tests...');
  var testRunner = TestRunner();
  testRunner.run();
}

class TestRunner {
  int passed = 0;
  int failed = 0;

  void run() {
    runZoned(() {
      test('Custom test runner', () {
        // This will trigger the tests defined in the main function
      });
    }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        if (line.startsWith('+'')) {
          passed++;
        } else if (line.startsWith('-')) {
          failed++;
        }
        parent.print(zone, line);
      },
    ));

    print('Tests run: ${passed + failed}');
    print('Tests passed: $passed');
    print('Tests failed: $failed');
  }
}

// To run: dart test testscript.dart
// Note: You need to add the test package to your pubspec.yaml file:
// dependencies:
//   test: ^1.16.0
