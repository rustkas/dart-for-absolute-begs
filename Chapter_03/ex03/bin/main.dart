void main() {
  var something = 2;
  var other = 2;
  var total = something + other; //total is 4
  print(
      'something = $something, other = $other. total = something + other. total = $total.');

  var total2 = total / other; //total is 2 again
  print('double total2 = total / other. total2 = $total2.');
  something = 2 * 4; //something is now 8, note total is not changed
  print('something = 2 * 4. something = $something');
}
