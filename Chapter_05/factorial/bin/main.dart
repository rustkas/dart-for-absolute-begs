import 'dart:io';

void main() {
  int n;

  stdout.write('What factorial do you want to calculate? ');
  var inTemp = stdin.readLineSync();

  try {
    n = int.parse(inTemp);
  } on FormatException {
    //uh oh, could not be turned into integer
    print('That was not an integer.');
    return;
  }

  if (n <= 0) {
    //check for bad input
    print('That\'s not a positive integer!');
    return;
  }

  print('n! = ${factorial(n)} calculated recursively.');
  print('n! = ${factorial2(n)} calculated iteratively.');
}

/// Calculate n! recursively.
int factorial(int n) {
  if (n <= 1) {
    //base case
    return 1;
  }
  return n * factorial(n - 1); //recursive case
}

/// Calculate n! with a for-loop
BigInt factorial2(int n) {
  var total = BigInt.from(1);
  
  for (var i = n; i > 0; i--) {
    //working backwards
    total *= BigInt.from(i);
    
    print('total = $total');
  }
  return total;
}

// dart bin/main.dart
