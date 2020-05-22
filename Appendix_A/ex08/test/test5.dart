import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('Future.value() returns the value', () async {
    var value = await Future.value(10);
    expect(value, equals(10));
  });
}
