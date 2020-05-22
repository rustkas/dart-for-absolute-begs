void main() {
  var temperature = 80;
  if (temperature > 75) {
    print('It is hot today.'); //print is used to output text to the console
  }

  temperature = 60;
  if (temperature > 75) {
    print('It is hot today.');
  } else {
    print('It is not that hot today.');
  }

  if (temperature > 75) {
    print('It is hot today.');
  } else if (temperature > 50) {
    print('It is mild today.');
  } else {
    print('It is cold today.');
  }
}
