void main() {
  var temp = 75;
  var weatherReport = 'It is rainy and $temp degrees';
  var obviousReport =
      'If it were 30 degrees cooler it would be ${temp - 30} degrees.';
  print(weatherReport);
  print(obviousReport);
  print('\"I am very tired,\" she said.');

  var myRawString = r'Here are my \ not \special backslashes\';
  print(myRawString); //Prints: Here are my \ not \special backslashes\

  print('''
  "Hello"
  "你好"
  "ابحرم"
  "☺☃Δ♡"
  ''');
}
