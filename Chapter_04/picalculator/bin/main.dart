import 'dart:math';

void main() {
  const iterations = 100000;  //the higher the more accurate
  var series = 1.0;
  var denominator = 3.0;
  var negate = -1.0;
  
  for (var i = 0; i < iterations; i++) {
    series += (negate * (1 / denominator));
    denominator += 2.0;
    negate *= -1.0;
  }
  
  final calculated_pi = 4 * series;
  print('We calculated pi as $calculated_pi');
  print('The real pi is $pi');
  print('We were off by ${(pi - calculated_pi).abs()}');
}
// dart bin/main.dart
