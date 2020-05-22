import 'dart:io';

void main() {
  int userAnswer;
  var names = <String>['Karl', 'Mark', 'Adam', 'Seth'];
  String which;
  print('What index in the names List do you want to look at?');
  which = stdin.readLineSync();
  try {
    userAnswer = int.parse(which);
    print(names[userAnswer]);
  } on FormatException {
    print('Could not understand the input.');
  } on RangeError {
    print('No name for index chosen.');
  } finally {
    print('You selected $which out of ${names.length}');
  }
}
