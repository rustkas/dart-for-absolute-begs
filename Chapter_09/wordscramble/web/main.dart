import 'dart:html';
import 'dart:async';

void main() {
  document.getElementById('guess').onKeyUp.listen(checkGuess);
  Timer.periodic(Duration(seconds: 1), tick);
  newWord(); // get us started the first time the program is run
}

String secretWord;
int numCorrect = 0;
int numMissed = 0;
int secondsLeft = 60;
List<String> wordList = <String>[
  'antelope',
  'arkansas',
  'awesome',
  'pickle',
  'ceiling',
  'supreme',
  'careful',
  'writing',
  'funhouse',
  'forever'
];

/// Check if the user has entered the de-scrambled word
void checkGuess(Event e) {
  var guess =
      (document.getElementById('guess') as InputElement).value.toLowerCase();
  print(guess);
  if (guess == secretWord) {
    // player got it right
    numCorrect++;
    document.getElementById('num_correct').text = numCorrect.toString();
    newWord();
  }
}

/// Once a second update the time display and check if
/// the player has run out of time
void tick(Timer t) {
  secondsLeft--;
  document.getElementById('seconds_left').text = secondsLeft.toString();
  if (secondsLeft <= 0) {
    // player missed one
    numMissed++;
    document.getElementById('num_missed').text = numMissed.toString();
    newWord();
  }
}

/// Randomly pick a new word and scramble it for display
void newWord() {
  secondsLeft = 60;
  wordList.shuffle();
  secretWord = wordList[0];
  var tempList = secretWord.split(''); // divide word into letter strings
  tempList.shuffle(); // scramble the word for display
  document.getElementById('scrambled_word').text =
      tempList.join(); // put it back together
  (document.getElementById('guess') as InputElement).value =
      ''; // clear input text
}
