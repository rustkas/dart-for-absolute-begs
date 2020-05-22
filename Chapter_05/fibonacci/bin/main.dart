import 'dart:io';

void main() {
  int n;
  
  print('What n do you want to lookup in the Fibonacci sequence?');
  var inTemp = stdin.readLineSync();
  
  try {
    n = int.parse(inTemp);
  } on FormatException {  //uh oh, could not be turned into integer
    print('That was not an integer.');
    return;
  }
  
  print('fib($n) = ${fib(n)}');
}

/// Find the nth term in the Fibonacci sequence
int fib(int n) {
  if (n < 2) {  //base case
    return n;
  }
  return fib(n - 2) + fib(n - 1);  //recursive case
}


