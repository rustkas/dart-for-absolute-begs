import 'dart:math';

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  b = b - a;
  print(b); // prints Point(2, 2)
  a = a * 2;
  print(a); // prints Point(4, 4)
  a = b + a;
  print(a); // prints Point(6, 6);
  if ((b + b) == (a - b)) {
    // this is true
    print('Both sides of the equation hold equivalent values.');
  }
}
