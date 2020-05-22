void main() {
  var b = true;
  if (!b) {
    print('True'); //will not be executed
  } else {
    print('False'); //will print: False
  }
  var temperature = 0;
  if (!(temperature > 75)) {
    print('It is NOT hot today.'); //prints only if temperature is NOT > 75
  }
}
