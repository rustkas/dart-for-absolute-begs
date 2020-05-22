import 'dart:html';

bool imperial = true;
const int imperial_multipllier = 703;

void main() {
  document.getElementById('unit_type1').onChange.listen(changeUnits);
  document.getElementById('unit_type2').onChange.listen(changeUnits);
  document.getElementById('submit').onClick.listen(calculate);
}

/// Change the units displayed by the inputs
/// and update [imperial]
void changeUnits(Event e) {
  // if imperial is checked
  if ((document.getElementById('unit_type1') as RadioButtonInputElement).checked) {
    imperial = true;
    document.getElementById('weight_units').text = 'pounds';
    document.getElementById('height_units').text = 'inches';
  } else {
    // metric is checked
    imperial = false;
    document.getElementById('weight_units').text = 'kilograms';
    document.getElementById('height_units').text = 'meters';
  }
}

/// Check the height and weight inputs are valid
/// Calculate the bmi and display the results
void calculate(MouseEvent event) {
  double height, weight;
  // get the height and weight
  try {
    weight =
        double.parse((document.getElementById('weight_input') as InputElement).value);
    height =
        double.parse((document.getElementById('height_input') as InputElement).value);
  } on FormatException {
    // uh oh, could not be turned into double
    window.alert('Only numbers are valid input.'); // popup alert
    return;
  }
  // do the actual calculations
  var bmi = weight / (height * height);
  if (imperial) {
    bmi = bmi * imperial_multipllier;
  }
  // update the display with a BMI rounded to 1 decimal digit
  document.getElementById('result1').text = 'Your BMI is ' + bmi.toStringAsFixed(1);
  String comment;
  if (bmi < 18.5) {
    comment = 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25.0) {
    comment = 'Normal';
  } else if (bmi >= 25.0 && bmi < 30.0) {
    comment = 'Oveweight';
  } else {
    comment = 'Obese';
  }
  querySelector('#result2').text = comment;
}
// webdev serve 
