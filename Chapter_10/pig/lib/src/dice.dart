import 'dart:math';

class Dice {
  final int _sides;
  final int _numberOfDice;
  var _values = <int>[];

  int get maximumValue => sides * numberOfDice;
  int get numberOfDice => _numberOfDice;
  int get sides => _sides;

  /// total is the sum of [_values]
  int get total => _values.fold(0, (first, second) => first + second);

  final rand = Random();

  /// constructs a new Dice object
  Dice(this._sides, this._numberOfDice);

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
