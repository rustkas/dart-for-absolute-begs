import 'dart:math';
import 'dart:io';

import 'package:geometry_test/geometry_test.dart';

void main() {
  Shape randomShape;
  final rand = Random();
  var choice = rand.nextInt(3);

  switch (choice) {
    case 0:
      randomShape =
          Circle(rand.nextInt(10) + 1.0); // adding 1.0 converts to double
      break;
    case 1:
      randomShape = Rectangle(rand.nextInt(10) + 1.0, rand.nextInt(10) + 1.0);
      break;
    case 2:
      randomShape = Square(rand.nextInt(10) + 1.0);
      break;
  }

  String inTemp;
  double userAnswer;
  print(randomShape.description);

  print('What is the area of the shape?');
  inTemp = stdin.readLineSync();
  try {
    userAnswer = double.parse(inTemp);
  } on FormatException {
    // uh oh, could not be turned into double
    print('Could not interpret input.');
    return;
  }
  if (userAnswer.roundToDouble() == randomShape.area.roundToDouble()) {
    print('Good job!');
  } else {
    print('Wrong, it\'s ${randomShape.area}!');
  }

  print('What is the perimeter of the shape?');
  inTemp = stdin.readLineSync();
  try {
    userAnswer = double.parse(inTemp);
  } on FormatException {
    // uh oh, could not be turned into double
    print('Could not interpret input.');
    return;
  }
  if (userAnswer.roundToDouble() == randomShape.perimeter.roundToDouble()) {
    print('Good job!');
  } else {
    print('Wrong, it\'s ${randomShape.perimeter}!');
  }
}
