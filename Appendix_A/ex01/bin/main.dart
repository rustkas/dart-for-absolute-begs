import 'dart:io';

void main() {
  String inTemp;
  double userAnswer;
  print('Please, enter double value:');
  inTemp = stdin.readLineSync();
  try {
    userAnswer = double.parse(inTemp);
    print('User answer is $userAnswer');
  } on FormatException {
    // uh oh, could not be turned into double
    print('Could not interpret input.');
    return;
  }
}
