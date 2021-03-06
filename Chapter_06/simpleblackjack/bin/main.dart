import 'dart:io';

void main() {
  var deck = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'];
  var playerCards = [];
  var dealerCards = [];

  deck.shuffle();

  print('Dealer draws first card.');
  dealerCards.add(deck.removeLast()); // move 1 card from deck to dealerCards
  print('Player receives two cards.');
  playerCards.add(deck.removeLast()); // move 1 card from deck to playerCards
  playerCards.add(deck.removeLast());
  printStatus(playerCards, dealerCards);

  while (true) {
    // player decision loop
    print('Do you want to (H)it, (S)tay, or (Q)uit?');

    try {
      var selection = stdin.readLineSync().toUpperCase(); // get uppercase input

      switch (selection) {
        case 'H':
          // hit
          playerCards.add(deck.removeLast());
          printStatus(playerCards, dealerCards);

          if (calculateScore(playerCards) > 21) {
            print('You busted!  You lose!');
            exit(0); // quits the program
          }
          break;
        case 'S':
          // stay
          break; // stop offering to hit, leave this loop
        case 'Q':
          // quit
          exit(0); // quits the program
          break;
        default:
          break;
      }

      print('Dealer draws rest of cards.');
      while (calculateScore(dealerCards) < 17) {
        // keep drawing cards till 17
        dealerCards.add(deck.removeLast());
      }
      printStatus(playerCards, dealerCards);

      if (calculateScore(dealerCards) > 21) {
        // dealer bust
        print('Dealer busts!  You win!');
      } else if (calculateScore(dealerCards) > calculateScore(playerCards)) {
        print('Dealer wins!');
      } else if (calculateScore(dealerCards) < calculateScore(playerCards)) {
        print('You win!');
      } else {
        // must be a tie by default
        print('It\'s a tie!');
      }
    } catch (_) {
      // try again
    }
  } // while
}

/// Calculate the score of the [cards] List
int calculateScore(List cards) {
  var score = 0;
  var hasAce = false; // only one ace in Simple Blackjack

  for (var card in cards) {
    // use var because card can be int or String
    if (card is int) {
      // is operator, check type of card
      score += card;
    } else if (card == 'A') {
      hasAce = true;
    } else {
      // must be king, queen, or jack
      score += 10;
    }
  }

  if (hasAce) {
    if ((score + 11) > 21) {
      // don't let ace cause bust
      score += 1;
    } else {
      score += 11;
    }
  }

  return score;
}

/// Print everyone's scores and decks
void printStatus(playerCards, dealerCards) {
  // print(''); // blank line
  print("\nPlayer's Total is ${calculateScore(playerCards)}:");
  print(playerCards); // automatically prints contents of List
  print("Dealer's Total is ${calculateScore(dealerCards)}");
  print('$dealerCards\n');
  // print(''); // blank line
}
