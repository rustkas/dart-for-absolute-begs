import 'dart:io';

void main() {
  print('A:Convert Celsius to Fahrenheit' 'B:Convert Fahrenheit to Celsius');
  String selection;

  do {
    selection = stdin.readLineSync().toUpperCase(); //get uppercase input
  } while (selection != 'A' && selection != 'B'); //think of && like AND

  print('Enter the starting temperature:');
  var inTemp = stdin.readLineSync();
  var temp = int.parse(inTemp);

  switch (selection) {
    case 'A':
      print('$temp degrees Celsius is ${format(temp * 1.8 + 32)} degrees Fahrenheit');
      break;
    case 'B':
      print('$temp degrees Fahrenheit is ${format((temp - 32) / 1.8)} degrees Celsius');
      break;
    default:
      break;
  }
}
String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
