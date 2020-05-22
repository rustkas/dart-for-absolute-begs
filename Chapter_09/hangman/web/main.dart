import 'dart:html';
import 'dart:math';

int wrongGuesses;
const int GUESS_LIMIT = 5;
const String word_list_file = 'word_lists/hanglist.txt';
const String capital_alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const List<String> hang_images = ['images/hang0.gif', 'images/hang1.gif',
                                        'images/hang2.gif', 'images/hang3.gif',
                                        'images/hang4.gif', 'images/hang5.gif',
                                        'images/hang6.gif'];
String lettersLeft, secretWord;
bool gameOver;

void main() {
  // listen for keyboard input, also listen for clicks to the new game button
  window.onKeyPress.listen((KeyboardEvent e) {
    var lastPressed = String.fromCharCodes([e.charCode]);
    lastPressed = lastPressed.toUpperCase();
    playLetter(lastPressed);
  });
  document.getElementById('new_game_button').onClick.listen((MouseEvent me) => restart());
  restart();
}

/// The user has tried to play [letter] - see if it's in the secret word
/// if it is uncover it. If it's not, process a miss.
void playLetter(String letter) {
  if (lettersLeft.contains(letter) && !gameOver) {
    lettersLeft = lettersLeft.replaceFirst(RegExp(letter), '');
    document.getElementById('letter_list').text = lettersLeft;
    
    // put the letter into the secret word
    if (secretWord.contains(letter)) {
      var oldDisplay = document.getElementById('secret').text;  // what the user sees
      var newDisplay = '';  // what we will soon show the user
      for (var i = 0; i < secretWord.length; i++) {
        if (secretWord[i] == letter) {  // put the new
          newDisplay = newDisplay + letter;
        }
        else {  // put the old back in
          newDisplay = newDisplay + oldDisplay[i];
        }
      }
      document.getElementById('secret').text = newDisplay;
      
      if (newDisplay == secretWord) {  // if we won
        gameOver = true;
        document.getElementById('letter_list').text = 'YOU WIN';
      }
    }
    else {  // secretWord does not contain letter
      wrongGuesses++;
      (document.getElementById('hang_image') as ImageElement).src = hang_images[wrongGuesses];
      if (wrongGuesses > GUESS_LIMIT) {
        gameOver = true;
        document.getElementById('letter_list').text = 'GAME OVER';
        document.getElementById('secret').text = secretWord;
      }
    }
    //do an else and move the hangman forward and check for loss or win
  }
  
}

/// Grab a random word from the hanglist.txt file for [secretWord]
void chooseSecretWord() {
  var url = word_list_file;
  var request = HttpRequest();
  request.open('GET', url, async: false);
  request.send();
  var wordList = request.responseText;
  var words = wordList.split('\n');  // convert text file into List of words
  
  // randomly choose a word from the List
  var rnd = Random();
  secretWord = words[rnd.nextInt(words.length)];
  secretWord = secretWord.toUpperCase();
  
  // hide what we display to the user - all underscores for letters
  document.getElementById('secret').text = secretWord.replaceAll(RegExp(r'[a-zA-Z]'), '_');
}

/// Put everything in the starting position
void clearBoard() {
  wrongGuesses = 0;
  (document.getElementById('hang_image') as ImageElement).src = hang_images[wrongGuesses];
  lettersLeft = capital_alphabet;
  document.getElementById('letter_list').text = lettersLeft;
}

/// Reset everything for a new game
void restart() {
  gameOver = false;
  chooseSecretWord();
  clearBoard();
}
