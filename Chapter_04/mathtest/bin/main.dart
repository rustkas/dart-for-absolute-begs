import 'dart:io';
import 'dart:math';

void main() {
  final rand = Random();
  int correctAnswer, userAnswer, operand1, operand2, operation; //all ints
  var questionsAttempted = 0, numCorrect = 0; //ints initialized
print('Welcome!');
print('This is calculation game.');
print('For ending, please, enter any letter');
  while (true) {
    operation = rand.nextInt(3); //random number 0, 1, or 2
    operand1 = rand.nextInt(11); //random number 0-10
    operand2 = rand.nextInt(11); //random number 0-10

    switch (operation) {
      case 0: //addition question
        print('$operand1 + $operand2 = ');
        correctAnswer = operand1 + operand2;
        break;
      case 1: //subtraction question
        print('$operand1 - $operand2 = ');
        correctAnswer = operand1 - operand2;
        break;
      case 2: //multiplication question
        print('$operand1 * $operand2 = ');
        correctAnswer = operand1 * operand2;
        break;
      default:
        break;
    }

    final inTemp = stdin.readLineSync();

    try {
      userAnswer = int.parse(inTemp);
    } on FormatException {
      //uh oh, could not be turned into integer
      print('Thanks for playing!');
      print('You got $numCorrect out of $questionsAttempted correct.');
      break;
    }

    if (userAnswer == correctAnswer) {
      //right answer?
      numCorrect++;
      print('Correct!');
    } else {
      print('Wrong!');
    }

    questionsAttempted++;
  }
}
