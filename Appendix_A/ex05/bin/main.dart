import 'dart:math';

void main(List<String> arguments) {
  var circle = Circle(10);
  print(circle.description);
  print('perimeter = ${circle.perimeter}');
  print('aria = ${circle.area}');
}

abstract class Shape {
  double get perimeter;
  double get area;
  String get description;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  double get perimeter => radius * 2 * pi;
  double get area => pi * (radius * radius);
  String get description => "I am a circle with radius $radius";
}
