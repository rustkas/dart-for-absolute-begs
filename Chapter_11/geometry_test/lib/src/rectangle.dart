import 'shape.dart';

class Rectangle extends Shape {
  double length;
  double width;
  Rectangle(this.length, this.width);
  @override
  double get perimeter => length * 2 + width * 2;
  @override
  double get area => length * width;
  @override
  String get description =>
      'I am a rectangle with length $length and width $width.';
}
