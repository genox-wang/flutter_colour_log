import 'package:flutter_test/flutter_test.dart';

import 'package:colour_log/colour_log.dart';
import 'package:intl/intl.dart';

void main() {

  test('new Logger with null logLevel', (){
    expect(() => Logger(logLevel: null), throwsAssertionError);
  });

  test('set logLevel with null', (){
    expect(() => Logger().logLevel = null, throwsAssertionError);
  });
}
