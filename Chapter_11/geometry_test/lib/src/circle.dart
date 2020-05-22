import 'dart:math';

import 'shape.dart';

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double get perimeter => radius * 2 * pi;
  @override
  double get area => pi * (radius * radius);
  @override
  String get description => 'I am a circle with radius $radius';
}
