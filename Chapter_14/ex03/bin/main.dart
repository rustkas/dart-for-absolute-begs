import 'dart:isolate';

void funk(var message) {
  print('from funk');
}

void main() {
  Isolate.spawn(funk, null);
  print('from main');
}
