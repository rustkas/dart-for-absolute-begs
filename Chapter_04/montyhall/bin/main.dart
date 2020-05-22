import 'dart:math';

void main() {
  const TRIALS = 1000000;
  var correct = 0;
  var rand = Random();
  for (var i = 0; i < TRIALS; i++) {
    var randDoor = rand.nextInt(3) + 1; //random door 1 to 3
    var guess = 1; //we guess door 1
    int eliminated;

    switch (randDoor) {
      case 2:
        eliminated = 3; //door 3 eliminated
        break;
      case 3:
        eliminated = 2; //door 2 eliminated
        break;
      default:
        //randDoor must be 1
        eliminated = rand.nextInt(2) + 2; //door 2 or 3 randomly eliminated
        break;
    }

    if (eliminated == 2) {
      guess = 3; //switch our guess to door 3
    } else {
      //eliminated must be 3
      guess = 2; //switch our guess to door 2
    }

    if (guess == randDoor) {
      correct++;
    }
  }
  print('The percentage of correct guesses was '
      '${format((correct / TRIALS) * 100)}%');
}

String format(double n) {
  var fraction = n - n.toInt();
  if (fraction == 0.0) {
    return n.toString();
  }
  var twoDigitFraction = (fraction * 100).truncateToDouble().toInt();
  return '${n.toInt()}.$twoDigitFraction';
}
