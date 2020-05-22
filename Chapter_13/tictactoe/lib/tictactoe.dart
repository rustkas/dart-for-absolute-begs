import 'dart:html';
import 'board.dart';

CanvasElement myCanvas;
Board board = Board();

/// When the canvas is clicked, we make a move at the appropriate box
/// check if the game is over and redraw the canvas
void clickHappened(MouseEvent me) {
  int clickX = me.offset.x;
  int clickY = me.offset.y;
  num col = clickX ~/ (myCanvas.width / 3);  // calculate box column
  num row = clickY ~/ (myCanvas.height / 3);  // calculate box row
  if (row == 1) {  // reuse col as exact box number
    col += 3;
  } else if (row == 2) {
    col += 6;
  }
  if (board.makeMove(col) == true) {  // returns true if legal move
    board.draw(myCanvas);
    var winner = board.winner;  // check if the game is over
    if (winner != null) {
      window.alert(winner + '  wins!');
    } else if (board.isDraw) {  // can only be a draw if it's not a win
      window.alert('Draw!');
    }
  }
}
