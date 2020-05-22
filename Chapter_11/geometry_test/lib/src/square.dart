import 'rectangle.dart';

class Square extends Rectangle {
  Square(double side) : super(side, side);
  @override
  String get description => 'I am a square with sides of length $length.';
}
