import 'dart:io';
import 'dart:math';

void main() {
  print('Rock, Paper, Scissors Shoot!');
  print('To stop the game enter eny letter exept "R", "P" or "S"');

  while (true) {
    //main game loop (qusi infinite loop)
    final playerMove = getPlayerMove();

    if (playerMove == quit) {
      break; // stop the infinite loop
    }

    print('You played $playerMove');
    final computerMove = getComputerMove();
    print('Computer played $computerMove');
    print(whoWon(playerMove, computerMove));
  }
}

/// Get a player move via keyboard input
/// If the player does not enter a valid move
/// return 'Quit' so that the main game loop
/// knows to end the game
String getPlayerMove() {
  print('Would you like (R)ock, (P)aper, or (S)cissors?');
  final selection = stdin.readLineSync().toUpperCase();

  switch (selection) {
    case 'R':
      return rock;
      break;
    case 'P':
      return paper;
      break;
    case 'S':
      return scissors;
      break;
    default: //if anything but R, P, or S
      return quit;
      break;
  }
}

/// Return a random move in the form of a string of either
/// 'Rock', 'Paper', or 'Scissors'
String getComputerMove() {
  final rand = Random();
  final move = rand.nextInt(3); //random int from 0 to 2
  return computerMove[move];
}

/// Determine if the player or the computer won
/// by comparing [playerMove] to [computerMove]
String whoWon(String playerMove, String computerMove) {
  if (playerMove == computerMove) {
    //if the same, it's a tie
    return 'Tie';
  } else if (playerMove == rock && computerMove == scissors) {
    return 'You Win!';
  } else if (playerMove == scissors && computerMove == paper) {
    return 'You Win!';
  } else if (playerMove == paper && computerMove == rock) {
    return 'You Win!';
  } else {
    //if it's not a tie and you didn't win, computer won
    return 'Computer Wins!';
  }
}

enum ComputerMove { rock, paper, scissors }

const rock = 'Rock';
const paper = 'Paper';
const scissors = 'Scissors';
const quit = 'Quit';
final computerMove = {
  ComputerMove.rock.index: rock,
  ComputerMove.paper.index: paper,
  ComputerMove.scissors.index: scissors
};
