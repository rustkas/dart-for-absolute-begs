void main() {
  for (var x = 1; x <= 10; x++) {
    //outer loop
    var powerTotal = 1;
    for (var y = 1; y <= 10; y++) {
      //inner loop
//print the powers of x
      powerTotal = powerTotal * x;
      print('$x^$y is $powerTotal');
    }
  }
}
