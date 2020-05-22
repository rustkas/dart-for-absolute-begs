import 'dart:html';
import 'dart:async'; // for Timer

void main() {
  // add the img elements, you didn't think we were going to type
  // <img...> 16 times, did you? Computers are better at repetitive tasks.
  final card_box = document.getElementById('card_box');
  for (var i = 0; i < num_cards; i++) {
    var ie = ImageElement(height: 100, width: 100);
    ie
      ..onClick.listen(cardClicked)
      ..alt = i.toString(); // a way of tagging the cards
    card_box.append(ie);
  }
  document.getElementById('new_game_button').onClick.listen(newGame);
  reset();
}

// A lot of constants makes for maintainable code as opposed
// to using magic numbers (or magic Strings for that matter)
const num_cards = 16;
const num_of_each = 4;
const card_back = 'images/card_back.png';
const card_file_names = <String>[
  'images/dog.png',
  'images/cat.png',
  'images/giraffe.png',
  'images/turtle.png'
];

int strikes, cardsLeft;
List<String> cards = getCards(); // the actual deck
ImageElement lastClicked; // last card clicked if not two clicked

/// create the deck of cards
List<String> getCards() {
  var cards = [];
  for (var cardFileName in card_file_names) {
    for (var i = 0; i < num_of_each; i++) {
      cards.add(cardFileName);
    }
  }
  return cards;
}

/// Resets the game board for a new game
void reset() {
  strikes = 0;
  cardsLeft = num_cards;
  document.getElementById('num_strikes').text = strikes.toString();
  document.getElementById('num_left').text = cardsLeft.toString();
  // find all <img> Elements in the DOM and change their src
  // attribute to be that of the facedown card

  for (ImageElement img in document.getElementsByTagName('img')) {
    img.src = card_back;
  }
  
  cards.shuffle();
}

/// Main game logic, checks if two cards have been matched
/// or not; also flips cards when clicked
void cardClicked(MouseEvent event) {
  ImageElement clickedCard = event.target; // which card was clicked
  // if the card's already turned over, ignore
  if (!clickedCard.src.endsWith(card_back)) {
    return;
  }
  // otherwise flip it over
  var clickedNumber = int.parse(clickedCard.alt); // thing we stored
  clickedCard.src = cards[clickedNumber];

  if (lastClicked == null) {
    lastClicked = clickedCard;
  } else {
    if (clickedCard.src == lastClicked.src) {
      // we have a match!
      cardsLeft -= 2;
      document.getElementById('num_left').text = cardsLeft.toString();
    } else {
      // we have a strike!
      strikes++;
      document.getElementById('num_strikes').text = strikes.toString();

      // flip them back after 2 seconds
      var tempClicked = lastClicked;
      Timer(Duration(seconds: 2), () {
        clickedCard.src = card_back;
        tempClicked.src = card_back;
      });
    }
    lastClicked = null;
  }
}

void newGame(MouseEvent event) => reset();
