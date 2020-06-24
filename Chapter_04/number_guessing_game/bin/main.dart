import 'dart:math';
import 'dart:io';

void main() {
  int guess;
  final rand = Random();  //create a random number generator
  final answer = rand.nextInt(100);  //gets a random integer from 0 to 99
  do {
    stdout.write('Enter your guess: ');
    final temp = stdin.readLineSync();  //read in from the keyboard
    guess = int.parse(temp);  //convert string to integer
    if (guess < answer) {
      print('Too low!');
    } else if (guess > answer) {
      print('Too high!');
    }
  } while (guess != answer);
  print('You got it!');
}
