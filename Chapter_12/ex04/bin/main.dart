import 'dart:io';

void main() {
  var numCorrect = 1;
  var questionsAttempted = 1;
  var inTemp = stdin.readLineSync();
  try {
    var userAnswer = int.parse(inTemp);
    print(userAnswer);
  } on FormatException {
    // uh oh, could not be turned into integer
    print('Thanks for playing!');
    print('You got $numCorrect out of $questionsAttempted correct.');
  }
}
