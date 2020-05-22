void main() {
  printTotal1();
  printTotal2();
}

void printTotal1() {
  var total = 0;
  for (var count = 1; count <= 10; count++) {
    total = total + count;
  }
  print('The sum of the numbers 1 through 10 is: $total');
}

void printTotal2() {
  for (var count = 1; count <= 10; count++) {
    var total = 0; //WRONG
    total = total + count;
  }
  //print('The sum of the numbers 1 through 10 is: $total'); //ERROR
}
