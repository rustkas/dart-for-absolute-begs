import 'dart:math';

void main() {
  var dice1 = Dice(1, 1);
  dice1.roll();
  dice1.printDice();
}

class Dice {
  /// Instance Variables
  int _sides = 6;
  int _numberOfDice = 2;
  List<int> _values = [];

  /// Properties
  int get maximumValue => sides * numberOfDice;
  int get numberOfDice => _numberOfDice;
  int get sides => _sides;

  /// total is the sum of [_values]
  int get total => _values.fold(0, (first, second) => first + second);

  /// Constructor
  /// constructs a new Dice object, setting _sides and _numberOfDice
  Dice(this._sides, this._numberOfDice);

  /// Methods
  /// generate random values for [_values]
  void roll() {
    var newValues = <int>[];
    var rand = Random();
    for (var i = 0; i < numberOfDice; i++) {
      newValues.add(rand.nextInt(sides) + 1); // number from 1 to sides
    }
    _values = newValues;
  }

  /// print the values of the dice
  void printDice() => print(_values);
}
